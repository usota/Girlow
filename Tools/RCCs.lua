--[[ RCCs - RConsole Command Shortner | by S7 softworks | https://github.com/misterlerp/s7nc.softworks | License: S7M 1.0 ]]

local RCCs = {}
local _executor = (identifyexecutor and identifyexecutor())
               or (getexecutorname and getexecutorname())
               or "Universal"
local _cmds = {
    Solara = {
        print   = rconsoleprint,
        warn    = rconsolewarn,
        error   = rconsoleerr,
        info    = rconsoleinfo,
        destroy = rconsoledestroy,
        name    = rconsolename,
        input   = rconsoleinput,
        clear   = rconsoleclear,
    },
    Madium = {
        print   = rconsoleprint,
        warn    = rconsolewarn,
        error   = rconsoleerr,
        info    = rconsoleinfo,
        destroy = rconsoledestroy,
        name    = rconsolename,
        input   = rconsoleinput,
        clear   = rconsoleclear,
    },
}
_cmds.Universal = _cmds.Solara
local _E = _cmds[_executor] or _cmds.Universal
RCCs.Scripts = {}
local _DSIC = {
    "[\u{0400}-\u{04FF}]", -- Cyrillic
}
--[[ Not Tested !
    "[\u0600-\u06FF]", -- Arabic
    "[\u4E00-\u9FFF]", -- CJK Unified Ideographs
    "[\u3040-\u309F]", -- Hiragana
    "[\u30A0-\u30FF]", -- Katakana
    "[\u0900-\u097F]", -- Devanagari
    "[\u0E00-\u0E7F]", -- Thai
    "[\u0530-\u058F]", -- Armenian
    "[\u0590-\u05FF]", -- Hebrew
    "[\u0A00-\u0A7F]", -- Gurmukhi
    "[\u0B00-\u0B7F]", -- Bengali
    "[\u0C00-\u0C7F]", -- Telugu
    "[\u0D00-\u0D7F]", -- Malayalam
    "[\u0E80-\u0EFF]", -- Lao
    "[\u0F00-\u0FFF]", -- Tibetan
    "[\u0700-\u074F]", -- Syriac
    "[\u0780-\u07BF]", -- Thaana
    "[\u0A80-\u0AFF]", -- Gujarati
    "[\u0B80-\u0BFF]", -- Oriya 
    "[\u0C80-\u0CFF]", -- Kannada
    "[\u0D80-\u0DFF]", -- Sinhala
    "[\u0F00-\u0FFF]", -- Tibetan
    "[\u1000-\u109F]", -- Myanmar
    "[\u1200-\u137F]", -- Ethiopic
    "[\u13A0-\u13FF]", -- Cherokee
    "[\u1400-\u167F]", -- Unified Canadian Aboriginal Syllabics
    "[\u1680-\u169F]", -- Ogham
    "[\u16A0-\u16FF]", -- Runic
    "[\u1700-\u171F]", -- Tagalog
    "[\u1720-\u173F]", -- Hanunoo
    "[\u1740-\u175F]", -- Buhid
    "[\u1760-\u177F]", -- Tagbanwa
    "[\u1780-\u17FF]", -- Khmer
    "[\u1800-\u18AF]", -- Mongolian
    "[\u1E00-\u1EFF]", -- Latin Extended Additional
    "[\u1F00-\u1FFF]", -- Greek Extended
    "[\u2000-\u206F]", -- General Punctuation
    "[\u2070-\u209F]", -- Superscripts and Subscripts
    "[\u20A0-\u20CF]", -- Currency Symbols
    "[\u20D0-\u20FF]", -- Combining Diacritical Marks for Symbols
    "[\u2100-\u214F]", -- Letterlike Symbols
    "[\u2150-\u218F]", -- Number Forms
    "[\u2190-\u21FF]", -- Arrows
    "[\u2200-\u22FF]", -- Mathematical Operators
    "[\u2300-\u23FF]", -- Miscellaneous Technical
    "[\u2400-\u243F]", -- Control Pictures
    "[\u2440-\u245F]", -- Optical Character Recognition
    "[\u2460-\u24FF]", -- Enclosed Alphanumerics
    "[\u2500-\u257F]", -- Box Drawing
    "[\u2580-\u259F]", -- Block Elements
    "[\u25A0-\u25FF]", -- Geometric Shapes
    "[\u2600-\u26FF]", -- Miscellaneous Symbols
    "[\u2700-\u27BF]", -- Dingbats
    "[\u27C0-\u27EF]", -- Miscellaneous Mathematical Symbols-A
    "[\u27F0-\u27FF]", -- Supplemental Arrows-A
    "[\u2800-\u28FF]", -- Braille Patterns
    "[\u2900-\u297F]", -- Supplemental Arrows-B
    "[\u2980-\u29FF]", -- Miscellaneous Mathematical Symbols-B
    "[\u2E00-\u2E7F]", -- Supplemental Punctuation
    "[\u2FF0-\u2FFF]", -- Ideographic Description Characters 
    ]]

local function _dsic_check(code)
    for _, pattern in ipairs(_DSIC) do
        if code:find(pattern) then
            return false, pattern
        end
    end
    return true
end

local _aliases = {
    ["^%s*transfer%(%s*%)%s*$"] = function() return "RCCs.transfer()"          end,
    ["^%s*title%((.-)%)%s*$"]  = function(a) return "RCCs.name("  .. a .. ")"  end,
    ["^%s*print%((.-)%)%s*$"]  = function(a) return "RCCs.print(" .. a .. ")"  end,
    ["^%s*warn%((.-)%)%s*$"]   = function(a) return "RCCs.warn("  .. a .. ")"  end,
    ["^%s*info%((.-)%)%s*$"]   = function(a) return "RCCs.info("  .. a .. ")"  end,
    ["^%s*error%((.-)%)%s*$"]  = function(a) return "RCCs.error(" .. a .. ")"  end,
    ["^%s*destroy%(%s*%)%s*$"] = function()  return "RCCs.destroy()"           end,
    ["^%s*clear%(%s*%)%s*$"]   = function()  return "RCCs.clear()"             end,
}

local function _preprocess(code)
    local lines = {}
    for line in (code .. "\n"):gmatch("([^\n]*)\n") do
        local replaced = false
        for pattern, fn in pairs(_aliases) do
            local cap = line:match(pattern)
            if cap ~= nil then
                table.insert(lines, fn(cap))
                replaced = true
                break
            end
        end
        if not replaced then
            table.insert(lines, line)
        end
    end
    return table.concat(lines, "\n")
end

local function _run(code, ctx)
    local ok, reason = _dsic_check(code)
    if not ok then
            print("[RCCs] DSIC blocked: " .. reason)  --[[ Disabled for time _E.warn("[RCCs] DSIC blocked: " .. reason) ]]
        return
    end

    local processed = _preprocess(code)
    local env = setmetatable(ctx or {}, { __index = getfenv() })
    env.RCCs = RCCs

    local fn, err = loadstring(processed)
    if not fn then
         print("[RCCs] Parse error: " .. tostring(err))  --[[ Disabled for time _E.warn("[RCCs] Parse error: " .. tostring(err)) ]]
        return
    end
    setfenv(fn, env)
    fn()
end

function RCCs.print(...)        _E.print(...)   end
function RCCs.warn(...)         _E.warn(...)    end
function RCCs.error(...)        _E.error(...)   end
function RCCs.info(...)         _E.info(...)    end
function RCCs.destroy(...)      _E.destroy(...) end
function RCCs.name(...)         _E.name(...)    end
function RCCs.input(...)        _E.input(...)   end
function RCCs.clear(...)        _E.clear(...)   end
function RCCs.Run(code, ctx)    _run(code, ctx) end

function RCCs.Auto(code, ctx)
    local _prev = _E
    _E = _cmds[_executor] or _cmds.Universal
    _run(code, ctx)
    _E = _prev
end

setmetatable(RCCs, {
    __index = function(t, key)
        local target = _cmds[key]
        if not target then return nil end
        return {
            __call = function(_, code, ctx)
                local _prev = _E
                _E = target
                _run(code, ctx)
                _E = _prev
            end,
            Run = function(name, ctx)
                local code = RCCs.Scripts[name]
                if not code then
                    _E.warn("[RCCs] '" .. tostring(name) .. "' not found in RCCs.Scripts")
                    return
                end
                local _prev = _E
                _E = target
                _run(code, ctx)
                _E = _prev
            end,
        }
    end
})

return RCCs