local Execu_tor = Instance.new("ScreenGui")
Execu_tor.Name = "Execu.tor"
Execu_tor.IgnoreGuiInset = true
Execu_tor.ResetOnSpawn = false
Execu_tor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Execu_tor.DisplayOrder = 999999
Execu_tor.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Position = UDim2.new(1, -10, 0, 25)
Container.Size = UDim2.new(0, 1450, 0, 695)
Container.BackgroundColor3 = Color3.new(0.109804, 0.109804, 0.109804)
Container.BorderSizePixel = 0
Container.AnchorPoint = Vector2.new(1, 0)
Container.ClipsDescendants = true
Container.Parent = Execu_tor

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Container

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 26)
TitleBar.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 0
TitleBar.Parent = Container

local UICorner2 = Instance.new("UICorner")
UICorner2.Name = "UICorner"
UICorner2.CornerRadius = UDim.new(0, 4)
UICorner2.Parent = TitleBar

local Frame = Instance.new("Frame")
Frame.Name = "Frame"
Frame.Position = UDim2.new(0, 0, 1, -4)
Frame.Size = UDim2.new(1, 0, 0, 4)
Frame.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Frame.BorderSizePixel = 0
Frame.ZIndex = 10
Frame.Parent = TitleBar

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.Position = UDim2.new(0, 6, 0.5, -8)
ImageLabel.Size = UDim2.new(0, 16, 0, 16)
ImageLabel.BackgroundTransparency = 1
ImageLabel.ZIndex = 11
ImageLabel.Transparency = 1
ImageLabel.Image = "rbxassetid://76643617981830"
ImageLabel.Parent = TitleBar

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "TextLabel"
TextLabel.Position = UDim2.new(0, 28, 0, -3)
TextLabel.Size = UDim2.new(0, 200, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.ZIndex = 11
TextLabel.Transparency = 1
TextLabel.Text = "Execu.tor"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14
TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = TitleBar

local TextLabel2 = Instance.new("TextLabel")
TextLabel2.Name = "TextLabel"
TextLabel2.Position = UDim2.new(0, 28, 0.5, 3)
TextLabel2.Size = UDim2.new(0, 200, 0, 10)
TextLabel2.BackgroundTransparency = 1
TextLabel2.ZIndex = 11
TextLabel2.Transparency = 1
TextLabel2.Text = "karioff77"
TextLabel2.TextColor3 = Color3.new(0.509804, 0.509804, 0.509804)
TextLabel2.TextSize = 9
TextLabel2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel2.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Position = UDim2.new(1, -22, 0.5, -8)
CloseButton.Size = UDim2.new(0, 16, 0, 16)
CloseButton.BackgroundTransparency = 1
CloseButton.BorderSizePixel = 0
CloseButton.ZIndex = 15
CloseButton.Transparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextSize = 16
CloseButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
CloseButton.Parent = TitleBar

local Socials = Instance.new("Frame")
Socials.Name = "Socials"
Socials.Position = UDim2.new(0, 1113, 0, 656)
Socials.Size = UDim2.new(0, 333, 0, 32)
Socials.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Socials.BorderSizePixel = 0
Socials.ZIndex = 0
Socials.Parent = Container

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke.Parent = Socials

local UICorner3 = Instance.new("UICorner")
UICorner3.Name = "UICorner"
UICorner3.CornerRadius = UDim.new(0, 4)
UICorner3.Parent = Socials

local Discord = Instance.new("Frame")
Discord.Name = "Discord"
Discord.Position = UDim2.new(0, 4, 0.125, 0)
Discord.Size = UDim2.new(1, -8, 0.75, 0)
Discord.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Discord.BorderSizePixel = 0
Discord.Parent = Socials

local UICorner4 = Instance.new("UICorner")
UICorner4.Name = "UICorner"
UICorner4.CornerRadius = UDim.new(0, 2)
UICorner4.Parent = Discord

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Name = "UIStroke"
UIStroke2.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke2.Parent = Discord

local TextLabel3 = Instance.new("TextLabel")
TextLabel3.Name = "TextLabel"
TextLabel3.Position = UDim2.new(0, 6, 0, 0)
TextLabel3.Size = UDim2.new(0, 70, 1, 0)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Transparency = 1
TextLabel3.Text = "Discord"
TextLabel3.TextColor3 = Color3.new(1, 1, 1)
TextLabel3.TextSize = 16
TextLabel3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel3.Parent = Discord

local TextButton = Instance.new("TextButton")
TextButton.Name = "TextButton"
TextButton.Position = UDim2.new(0, 90, 0, 0)
TextButton.Size = UDim2.new(1, -94, 1, 0)
TextButton.BackgroundTransparency = 1
TextButton.Transparency = 1
TextButton.Text = "Copy link"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextSize = 16
TextButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextButton.Parent = Discord

local Executor = Instance.new("Frame")
Executor.Name = "Executor"
Executor.Position = UDim2.new(0, 0, 0.00143885, 0)
Executor.Size = UDim2.new(0, 1450, 0, 695)
Executor.BackgroundColor3 = Color3.new(1, 1, 1)
Executor.BackgroundTransparency = 1
Executor.BorderSizePixel = 0
Executor.BorderColor3 = Color3.new(0, 0, 0)
Executor.Transparency = 1
Executor.Parent = Container

local Explorer = Instance.new("Frame")
Explorer.Name = "Explorer"
Explorer.Position = UDim2.new(0, 1113, 0, 30)
Explorer.Size = UDim2.new(0, 333, 0, 620)
Explorer.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Explorer.BorderSizePixel = 0
Explorer.ClipsDescendants = true
Explorer.Parent = Executor

local UIStroke3 = Instance.new("UIStroke")
UIStroke3.Name = "UIStroke"
UIStroke3.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke3.Parent = Explorer

local UICorner5 = Instance.new("UICorner")
UICorner5.Name = "UICorner"
UICorner5.CornerRadius = UDim.new(0, 4)
UICorner5.Parent = Explorer

local ExplorerLabel = Instance.new("TextLabel")
ExplorerLabel.Name = "ExplorerLabel"
ExplorerLabel.Size = UDim2.new(0, 69, 0, 25)
ExplorerLabel.BackgroundTransparency = 1
ExplorerLabel.Transparency = 1
ExplorerLabel.Text = "Explorer"
ExplorerLabel.TextColor3 = Color3.new(1, 1, 1)
ExplorerLabel.TextSize = 14
ExplorerLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
ExplorerLabel.Parent = Explorer

local Frame2 = Instance.new("Frame")
Frame2.Name = "Frame"
Frame2.Position = UDim2.new(0, 0, 0, 25)
Frame2.Size = UDim2.new(1, 0, 0, 1)
Frame2.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
Frame2.BorderSizePixel = 0
Frame2.Parent = Explorer

local TextButton2 = Instance.new("TextButton")
TextButton2.Name = "TextButton"
TextButton2.Position = UDim2.new(1, -26, 0, 2)
TextButton2.Size = UDim2.new(0, 22, 0, 22)
TextButton2.BackgroundTransparency = 1
TextButton2.Transparency = 1
TextButton2.Text = "↻"
TextButton2.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
TextButton2.TextSize = 16
TextButton2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextButton2.Parent = Explorer

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Position = UDim2.new(0, 0, 0, 26)
ScrollingFrame.Size = UDim2.new(1, 0, 1, -26)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Transparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0.4, 0.4, 0.4)
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Parent = Explorer

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Name = "UIListLayout"
UIListLayout.Padding = UDim.new(0, 1)
UIListLayout.Parent = ScrollingFrame

local EditorHeader = Instance.new("Frame")
EditorHeader.Name = "EditorHeader"
EditorHeader.Position = UDim2.new(0, 4, 0, 66)
EditorHeader.Size = UDim2.new(0, 1101, 0, 24)
EditorHeader.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
EditorHeader.BorderSizePixel = 0
EditorHeader.ZIndex = 5
EditorHeader.Parent = Executor

local UIStroke4 = Instance.new("UIStroke")
UIStroke4.Name = "UIStroke"
UIStroke4.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke4.Parent = EditorHeader

local UICorner6 = Instance.new("UICorner")
UICorner6.Name = "UICorner"
UICorner6.CornerRadius = UDim.new(0, 4)
UICorner6.Parent = EditorHeader

local Frame3 = Instance.new("Frame")
Frame3.Name = "Frame"
Frame3.Position = UDim2.new(0, 0, 1, -4)
Frame3.Size = UDim2.new(1, 0, 0, 4)
Frame3.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Frame3.BorderSizePixel = 0
Frame3.ZIndex = 5
Frame3.Parent = EditorHeader

local TextLabel4 = Instance.new("TextLabel")
TextLabel4.Name = "TextLabel"
TextLabel4.Position = UDim2.new(0, 8, 0, 0)
TextLabel4.Size = UDim2.new(0, 200, 1, 0)
TextLabel4.BackgroundTransparency = 1
TextLabel4.ZIndex = 6
TextLabel4.Transparency = 1
TextLabel4.Text = "script.lua"
TextLabel4.TextColor3 = Color3.new(1, 1, 1)
TextLabel4.TextSize = 13
TextLabel4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
TextLabel4.Parent = EditorHeader

local TextLabel5 = Instance.new("TextLabel")
TextLabel5.Name = "TextLabel"
TextLabel5.Position = UDim2.new(1, -120, 0, 0)
TextLabel5.Size = UDim2.new(0, 116, 1, 0)
TextLabel5.BackgroundTransparency = 1
TextLabel5.ZIndex = 6
TextLabel5.Transparency = 1
TextLabel5.Text = "Ln 1, Col 1"
TextLabel5.TextColor3 = Color3.new(0.509804, 0.509804, 0.509804)
TextLabel5.TextSize = 11
TextLabel5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel5.TextXAlignment = Enum.TextXAlignment.Right
TextLabel5.Parent = EditorHeader

local CodeExecute = Instance.new("Frame")
CodeExecute.Name = "CodeExecute"
CodeExecute.Position = UDim2.new(0, 4, 0, 90)
CodeExecute.Size = UDim2.new(0, 1101, 0, 562)
CodeExecute.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
CodeExecute.BorderSizePixel = 0
CodeExecute.ClipsDescendants = true
CodeExecute.Parent = Executor

local UIStroke5 = Instance.new("UIStroke")
UIStroke5.Name = "UIStroke"
UIStroke5.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke5.Parent = CodeExecute

local UICorner7 = Instance.new("UICorner")
UICorner7.Name = "UICorner"
UICorner7.CornerRadius = UDim.new(0, 4)
UICorner7.Parent = CodeExecute

local Frame4 = Instance.new("Frame")
Frame4.Name = "Frame"
Frame4.Size = UDim2.new(0, 40, 1, 0)
Frame4.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Frame4.BorderSizePixel = 0
Frame4.ZIndex = 3
Frame4.ClipsDescendants = true
Frame4.Parent = CodeExecute

local ScrollingFrame2 = Instance.new("ScrollingFrame")
ScrollingFrame2.Name = "ScrollingFrame"
ScrollingFrame2.Size = UDim2.new(1, 0, 1, -22)
ScrollingFrame2.BackgroundTransparency = 1
ScrollingFrame2.BorderSizePixel = 0
ScrollingFrame2.ZIndex = 3
ScrollingFrame2.Transparency = 1
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.ScrollBarThickness = 0
ScrollingFrame2.ScrollingEnabled = false
ScrollingFrame2.Parent = Frame4

local TextLabel6 = Instance.new("TextLabel")
TextLabel6.Name = "TextLabel"
TextLabel6.Position = UDim2.new(0, 0, 0, 6)
TextLabel6.Size = UDim2.new(1, -4, 0, 10000)
TextLabel6.BackgroundTransparency = 1
TextLabel6.ZIndex = 4
TextLabel6.Transparency = 1
TextLabel6.Text = "1"
TextLabel6.TextColor3 = Color3.new(0.352941, 0.352941, 0.352941)
TextLabel6.TextSize = 13
TextLabel6.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel6.TextXAlignment = Enum.TextXAlignment.Right
TextLabel6.TextYAlignment = Enum.TextYAlignment.Top
TextLabel6.Parent = ScrollingFrame2

local CodeScroll = Instance.new("ScrollingFrame")
CodeScroll.Name = "CodeScroll"
CodeScroll.Position = UDim2.new(0, 44, 0, 0)
CodeScroll.Size = UDim2.new(1, -44, 1, -22)
CodeScroll.BackgroundTransparency = 1
CodeScroll.BorderSizePixel = 0
CodeScroll.ZIndex = 2
CodeScroll.Transparency = 1
CodeScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
CodeScroll.ScrollBarImageColor3 = Color3.new(0.4, 0.4, 0.4)
CodeScroll.ScrollBarThickness = 5
CodeScroll.Parent = CodeExecute

local HighlightDisplay = Instance.new("TextLabel")
HighlightDisplay.Name = "HighlightDisplay"
HighlightDisplay.Position = UDim2.new(0, 4, 0, 6)
HighlightDisplay.BackgroundTransparency = 1
HighlightDisplay.ZIndex = 2
HighlightDisplay.Transparency = 1
HighlightDisplay.Text = ""
HighlightDisplay.TextColor3 = Color3.new(0.831373, 0.831373, 0.831373)
HighlightDisplay.TextSize = 13
HighlightDisplay.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
HighlightDisplay.TextXAlignment = Enum.TextXAlignment.Left
HighlightDisplay.TextYAlignment = Enum.TextYAlignment.Top
HighlightDisplay.RichText = true
HighlightDisplay.Parent = CodeScroll

local SelectionBox = Instance.new("Frame")
SelectionBox.Name = "SelectionBox"
SelectionBox.BackgroundColor3 = Color3.new(0, 0.470588, 0.843137)
SelectionBox.BackgroundTransparency = 0.5
SelectionBox.BorderSizePixel = 0
SelectionBox.Visible = false
SelectionBox.ZIndex = 3
SelectionBox.Transparency = 0.5
SelectionBox.Parent = CodeScroll

local CursorBar = Instance.new("Frame")
CursorBar.Name = "CursorBar"
CursorBar.Position = UDim2.new(0, 4, 0, 8)
CursorBar.Size = UDim2.new(0, 1, 0, 14)
CursorBar.BackgroundColor3 = Color3.new(0.862745, 0.862745, 0.862745)
CursorBar.BorderSizePixel = 0
CursorBar.ZIndex = 5
CursorBar.Parent = CodeScroll

local EnterTheCodeBox = Instance.new("TextBox")
EnterTheCodeBox.Name = "EnterTheCodeBox"
EnterTheCodeBox.Position = UDim2.new(0, 4, 0, 6)
EnterTheCodeBox.BackgroundTransparency = 1
EnterTheCodeBox.BorderSizePixel = 0
EnterTheCodeBox.ZIndex = 6
EnterTheCodeBox.Transparency = 1
EnterTheCodeBox.Text = ""
EnterTheCodeBox.TextColor3 = Color3.new(0, 0, 0)
EnterTheCodeBox.TextSize = 13
EnterTheCodeBox.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
EnterTheCodeBox.TextXAlignment = Enum.TextXAlignment.Left
EnterTheCodeBox.TextYAlignment = Enum.TextYAlignment.Top
EnterTheCodeBox.ClearTextOnFocus = false
EnterTheCodeBox.MultiLine = true
EnterTheCodeBox.Parent = CodeScroll

local Frame5 = Instance.new("Frame")
Frame5.Name = "Frame"
Frame5.Position = UDim2.new(0, 0, 1, -22)
Frame5.Size = UDim2.new(1, 0, 0, 22)
Frame5.BackgroundColor3 = Color3.new(0.509804, 0.109804, 0.109804)
Frame5.BorderSizePixel = 0
Frame5.Visible = false
Frame5.ZIndex = 10
Frame5.Parent = CodeExecute

local TextLabel7 = Instance.new("TextLabel")
TextLabel7.Name = "TextLabel"
TextLabel7.Position = UDim2.new(0, 8, 0, 0)
TextLabel7.Size = UDim2.new(1, -8, 1, 0)
TextLabel7.BackgroundTransparency = 1
TextLabel7.ZIndex = 11
TextLabel7.Transparency = 1
TextLabel7.Text = ""
TextLabel7.TextColor3 = Color3.new(1, 0.705882, 0.705882)
TextLabel7.TextSize = 11
TextLabel7.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
TextLabel7.Parent = Frame5

local TextButton3 = Instance.new("TextButton")
TextButton3.Name = "TextButton"
TextButton3.Position = UDim2.new(0, 214, 0, 656)
TextButton3.Size = UDim2.new(0, 105, 0, 32)
TextButton3.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
TextButton3.BorderSizePixel = 0
TextButton3.Text = "Clear"
TextButton3.TextColor3 = Color3.new(1, 1, 1)
TextButton3.TextSize = 18
TextButton3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextButton3.Parent = Executor

local UIStroke6 = Instance.new("UIStroke")
UIStroke6.Name = "UIStroke"
UIStroke6.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke6.Parent = TextButton3

local UICorner8 = Instance.new("UICorner")
UICorner8.Name = "UICorner"
UICorner8.CornerRadius = UDim.new(0, 4)
UICorner8.Parent = TextButton3

local TextButton4 = Instance.new("TextButton")
TextButton4.Name = "TextButton"
TextButton4.Position = UDim2.new(0, 4, 0, 656)
TextButton4.Size = UDim2.new(0, 200, 0, 32)
TextButton4.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
TextButton4.BorderSizePixel = 0
TextButton4.Text = "Execute"
TextButton4.TextColor3 = Color3.new(1, 1, 1)
TextButton4.TextSize = 18
TextButton4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextButton4.Parent = Executor

local UIStroke7 = Instance.new("UIStroke")
UIStroke7.Name = "UIStroke"
UIStroke7.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke7.Parent = TextButton4

local UICorner9 = Instance.new("UICorner")
UICorner9.Name = "UICorner"
UICorner9.CornerRadius = UDim.new(0, 4)
UICorner9.Parent = TextButton4

local Tabs = Instance.new("Frame")
Tabs.Name = "Tabs"
Tabs.Position = UDim2.new(0, 4, 0, 30)
Tabs.Size = UDim2.new(0, 1101, 0, 32)
Tabs.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Tabs.BorderSizePixel = 0
Tabs.ClipsDescendants = true
Tabs.Parent = Executor

local UIStroke8 = Instance.new("UIStroke")
UIStroke8.Name = "UIStroke"
UIStroke8.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke8.Parent = Tabs

local UICorner10 = Instance.new("UICorner")
UICorner10.Name = "UICorner"
UICorner10.CornerRadius = UDim.new(0, 4)
UICorner10.Parent = Tabs

local Tab__1 = Instance.new("Frame")
Tab__1.Name = "Tab #1"
Tab__1.Position = UDim2.new(0, 4, 0, 4)
Tab__1.Size = UDim2.new(0, 100, 0, 23)
Tab__1.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Tab__1.BorderSizePixel = 0
Tab__1.Parent = Tabs

local UICorner11 = Instance.new("UICorner")
UICorner11.Name = "UICorner"
UICorner11.CornerRadius = UDim.new(0, 2)
UICorner11.Parent = Tab__1

local UIStroke9 = Instance.new("UIStroke")
UIStroke9.Name = "UIStroke"
UIStroke9.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke9.Parent = Tab__1

local TextButton5 = Instance.new("TextButton")
TextButton5.Name = "TextButton"
TextButton5.Position = UDim2.new(0.14, 0, 0, 0)
TextButton5.Size = UDim2.new(0.49, 0, 1, 0)
TextButton5.BackgroundTransparency = 1
TextButton5.Transparency = 1
TextButton5.Text = "Tab #1"
TextButton5.TextColor3 = Color3.new(1, 1, 1)
TextButton5.TextSize = 16
TextButton5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextButton5.TextXAlignment = Enum.TextXAlignment.Left
TextButton5.Parent = Tab__1

local CloseTabButton = Instance.new("TextButton")
CloseTabButton.Name = "CloseTabButton"
CloseTabButton.Position = UDim2.new(0.77, 0, 0.173913, 0)
CloseTabButton.Size = UDim2.new(0, 16, 0, 16)
CloseTabButton.BackgroundColor3 = Color3.new(1, 1, 1)
CloseTabButton.BackgroundTransparency = 1
CloseTabButton.BorderSizePixel = 0
CloseTabButton.BorderColor3 = Color3.new(0, 0, 0)
CloseTabButton.Transparency = 1
CloseTabButton.Text = "X"
CloseTabButton.TextColor3 = Color3.new(1, 1, 1)
CloseTabButton.TextSize = 14
CloseTabButton.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
CloseTabButton.Parent = Tab__1

local Tab__2 = Instance.new("Frame")
Tab__2.Name = "Tab #2"
Tab__2.Position = UDim2.new(0, 110, 0, 4)
Tab__2.Size = UDim2.new(0, 100, 0, 23)
Tab__2.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Tab__2.BorderSizePixel = 0
Tab__2.Parent = Tabs

local UICorner12 = Instance.new("UICorner")
UICorner12.Name = "UICorner"
UICorner12.CornerRadius = UDim.new(0, 2)
UICorner12.Parent = Tab__2

local UIStroke10 = Instance.new("UIStroke")
UIStroke10.Name = "UIStroke"
UIStroke10.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke10.Parent = Tab__2

local TextButton6 = Instance.new("TextButton")
TextButton6.Name = "TextButton"
TextButton6.Position = UDim2.new(0.14, 0, 0, 0)
TextButton6.Size = UDim2.new(0.49, 0, 1, 0)
TextButton6.BackgroundTransparency = 1
TextButton6.Transparency = 1
TextButton6.Text = "Tab #2"
TextButton6.TextColor3 = Color3.new(1, 1, 1)
TextButton6.TextSize = 16
TextButton6.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextButton6.TextXAlignment = Enum.TextXAlignment.Left
TextButton6.Parent = Tab__2

local CloseTabButton2 = Instance.new("TextButton")
CloseTabButton2.Name = "CloseTabButton"
CloseTabButton2.Position = UDim2.new(0.77, 0, 0.173913, 0)
CloseTabButton2.Size = UDim2.new(0, 16, 0, 16)
CloseTabButton2.BackgroundColor3 = Color3.new(1, 1, 1)
CloseTabButton2.BackgroundTransparency = 1
CloseTabButton2.BorderSizePixel = 0
CloseTabButton2.BorderColor3 = Color3.new(0, 0, 0)
CloseTabButton2.Transparency = 1
CloseTabButton2.Text = "X"
CloseTabButton2.TextColor3 = Color3.new(1, 1, 1)
CloseTabButton2.TextSize = 14
CloseTabButton2.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
CloseTabButton2.Parent = Tab__2

local CreateTabButton = Instance.new("TextButton")
CreateTabButton.Name = "CreateTabButton"
CreateTabButton.Position = UDim2.new(0.975477, 0, 0.125, 0)
CreateTabButton.Size = UDim2.new(0, 23, 0, 23)
CreateTabButton.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
CreateTabButton.BorderSizePixel = 0
CreateTabButton.BorderColor3 = Color3.new(0, 0, 0)
CreateTabButton.Text = "+"
CreateTabButton.TextColor3 = Color3.new(1, 1, 1)
CreateTabButton.TextSize = 14
CreateTabButton.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
CreateTabButton.Parent = Tabs

local UICorner13 = Instance.new("UICorner")
UICorner13.Name = "UICorner"
UICorner13.CornerRadius = UDim.new(0, 4)
UICorner13.Parent = CreateTabButton

local UIStroke11 = Instance.new("UIStroke")
UIStroke11.Name = "UIStroke"
UIStroke11.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke11.Parent = CreateTabButton

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Position = UDim2.new(0.5, 0, 1, -5)
VersionLabel.Size = UDim2.new(0, 200, 0, 12)
VersionLabel.BackgroundTransparency = 1
VersionLabel.ZIndex = 21
VersionLabel.AnchorPoint = Vector2.new(0.5, 1)
VersionLabel.Transparency = 1
VersionLabel.Text = "v1.0.0"
VersionLabel.TextColor3 = Color3.new(0.470588, 0.470588, 0.470588)
VersionLabel.TextSize = 10
VersionLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
VersionLabel.Parent = Container

local Maintance = Instance.new("Frame")
Maintance.Name = "Maintance"
Maintance.Size = UDim2.new(0, 1450, 0, 695)
Maintance.BackgroundColor3 = Color3.new(0.168627, 0.168627, 0.168627)
Maintance.BorderSizePixel = 0
Maintance.BorderColor3 = Color3.new(0, 0, 0)
Maintance.Visible = false
Maintance.ZIndex = 20
Maintance.Parent = Container

local UICorner14 = Instance.new("UICorner")
UICorner14.Name = "UICorner"
UICorner14.CornerRadius = UDim.new(0, 4)
UICorner14.Parent = Maintance

local ImageLabel2 = Instance.new("ImageLabel")
ImageLabel2.Name = "ImageLabel"
ImageLabel2.Size = UDim2.new(0, 1450, 0, 695)
ImageLabel2.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel2.BackgroundTransparency = 1
ImageLabel2.BorderSizePixel = 0
ImageLabel2.BorderColor3 = Color3.new(0, 0, 0)
ImageLabel2.Transparency = 1
ImageLabel2.Image = "rbxasset://textures/ui/dev.png"
ImageLabel2.ImageColor3 = Color3.new(0.6, 0.6, 0.6)
ImageLabel2.Parent = Maintance

local UICorner15 = Instance.new("UICorner")
UICorner15.Name = "UICorner"
UICorner15.CornerRadius = UDim.new(0, 4)
UICorner15.Parent = ImageLabel2

local TextLabel8 = Instance.new("TextLabel")
TextLabel8.Name = "TextLabel"
TextLabel8.Position = UDim2.new(0.431034, 0, 0.463309, 0)
TextLabel8.Size = UDim2.new(0, 200, 0, 50)
TextLabel8.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel8.BackgroundTransparency = 1
TextLabel8.BorderSizePixel = 0
TextLabel8.BorderColor3 = Color3.new(0, 0, 0)
TextLabel8.Transparency = 1
TextLabel8.Text = "Under Maintenance"
TextLabel8.TextColor3 = Color3.new(1, 1, 1)
TextLabel8.TextSize = 64
TextLabel8.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel8.Parent = Maintance

local TextLabel9 = Instance.new("TextLabel")
TextLabel9.Name = "TextLabel"
TextLabel9.Position = UDim2.new(0.431034, 0, 0.517986, 0)
TextLabel9.Size = UDim2.new(0, 200, 0, 50)
TextLabel9.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel9.BackgroundTransparency = 1
TextLabel9.BorderSizePixel = 0
TextLabel9.BorderColor3 = Color3.new(0, 0, 0)
TextLabel9.Transparency = 1
TextLabel9.Text = "Please check back in a few hours"
TextLabel9.TextColor3 = Color3.new(1, 1, 1)
TextLabel9.TextSize = 24
TextLabel9.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel9.Parent = Maintance

local thanks = Instance.new("TextLabel")
thanks.Name = "thanks"
thanks.Position = UDim2.new(0.431034, 0, 0.565468, 0)
thanks.Size = UDim2.new(0, 200, 0, 50)
thanks.BackgroundColor3 = Color3.new(1, 1, 1)
thanks.BackgroundTransparency = 1
thanks.BorderSizePixel = 0
thanks.BorderColor3 = Color3.new(0, 0, 0)
thanks.Transparency = 1
thanks.Text = "Thank you <3"
thanks.TextColor3 = Color3.new(1, 1, 1)
thanks.TextSize = 24
thanks.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
thanks.Parent = Maintance

local thanks2 = Instance.new("TextLabel")
thanks2.Name = "thanks"
thanks2.Position = UDim2.new(0.431034, 0, 0.91223, 0)
thanks2.Size = UDim2.new(0, 200, 0, 50)
thanks2.BackgroundColor3 = Color3.new(1, 1, 1)
thanks2.BackgroundTransparency = 1
thanks2.BorderSizePixel = 0
thanks2.BorderColor3 = Color3.new(0, 0, 0)
thanks2.Transparency = 1
thanks2.Text = "Sincerely Girlow"
thanks2.TextColor3 = Color3.new(1, 1, 1)
thanks2.TextSize = 16
thanks2.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
thanks2.Parent = Maintance

local Change = Instance.new("Frame")
Change.Name = "Change"
Change.Position = UDim2.new(0, 904, 0, 656)
Change.Size = UDim2.new(0, 201, 0, 32)
Change.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Change.BorderSizePixel = 0
Change.ZIndex = 0
Change.Parent = Container

local UIStroke12 = Instance.new("UIStroke")
UIStroke12.Name = "UIStroke"
UIStroke12.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke12.Parent = Change

local UICorner16 = Instance.new("UICorner")
UICorner16.Name = "UICorner"
UICorner16.CornerRadius = UDim.new(0, 4)
UICorner16.Parent = Change

local Executor2 = Instance.new("Frame")
Executor2.Name = "Executor"
Executor2.Position = UDim2.new(0.0294032, 4, 0.125, 0)
Executor2.Size = UDim2.new(0.481825, -8, 0.75, 0)
Executor2.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Executor2.BorderSizePixel = 0
Executor2.Parent = Change

local UICorner17 = Instance.new("UICorner")
UICorner17.Name = "UICorner"
UICorner17.CornerRadius = UDim.new(0, 2)
UICorner17.Parent = Executor2

local UIStroke13 = Instance.new("UIStroke")
UIStroke13.Name = "UIStroke"
UIStroke13.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke13.Parent = Executor2

local ChangeButton = Instance.new("TextButton")
ChangeButton.Name = "ChangeButton"
ChangeButton.Position = UDim2.new(0, 47, 0, 0)
ChangeButton.Size = UDim2.new(1, -94, 1, 0)
ChangeButton.BackgroundTransparency = 1
ChangeButton.Transparency = 1
ChangeButton.Text = "Executor"
ChangeButton.TextColor3 = Color3.new(1, 1, 1)
ChangeButton.TextSize = 16
ChangeButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
ChangeButton.Parent = Executor2

local Scripts = Instance.new("Frame")
Scripts.Name = "Scripts"
Scripts.Position = UDim2.new(0.50325, 4, 0.125, 0)
Scripts.Size = UDim2.new(0.496751, -8, 0.75, 0)
Scripts.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Scripts.BorderSizePixel = 0
Scripts.Parent = Change

local UICorner18 = Instance.new("UICorner")
UICorner18.Name = "UICorner"
UICorner18.CornerRadius = UDim.new(0, 2)
UICorner18.Parent = Scripts

local UIStroke14 = Instance.new("UIStroke")
UIStroke14.Name = "UIStroke"
UIStroke14.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke14.Parent = Scripts

local ChangeButton2 = Instance.new("TextButton")
ChangeButton2.Name = "ChangeButton"
ChangeButton2.Position = UDim2.new(0, 47, 0, 0)
ChangeButton2.Size = UDim2.new(1, -94, 1, 0)
ChangeButton2.BackgroundTransparency = 1
ChangeButton2.Transparency = 1
ChangeButton2.Text = "Scripts"
ChangeButton2.TextColor3 = Color3.new(1, 1, 1)
ChangeButton2.TextSize = 16
ChangeButton2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
ChangeButton2.Parent = Scripts

local Scripts2 = Instance.new("Frame")
Scripts2.Name = "Scripts"
Scripts2.Size = UDim2.new(0, 1450, 0, 695)
Scripts2.BackgroundColor3 = Color3.new(1, 1, 1)
Scripts2.BackgroundTransparency = 1
Scripts2.BorderSizePixel = 0
Scripts2.BorderColor3 = Color3.new(0, 0, 0)
Scripts2.Visible = false
Scripts2.Transparency = 1
Scripts2.Parent = Container

local UICorner19 = Instance.new("UICorner")
UICorner19.Name = "UICorner"
UICorner19.CornerRadius = UDim.new(0, 4)
UICorner19.Parent = Scripts2

local Internal = Instance.new("Frame")
Internal.Name = "Internal"
Internal.Position = UDim2.new(0.00827586, 0, 0.0618705, 0)
Internal.Size = UDim2.new(0, 250, 0, 610)
Internal.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Internal.BorderSizePixel = 0
Internal.BorderColor3 = Color3.new(0, 0, 0)
Internal.Parent = Scripts2

local UICorner20 = Instance.new("UICorner")
UICorner20.Name = "UICorner"
UICorner20.CornerRadius = UDim.new(0, 4)
UICorner20.Parent = Internal

local TextLabel10 = Instance.new("TextLabel")
TextLabel10.Name = "TextLabel"
TextLabel10.Size = UDim2.new(0, 250, 0, 30)
TextLabel10.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel10.BackgroundTransparency = 1
TextLabel10.BorderSizePixel = 0
TextLabel10.BorderColor3 = Color3.new(0, 0, 0)
TextLabel10.Transparency = 1
TextLabel10.Text = "Internal"
TextLabel10.TextColor3 = Color3.new(1, 1, 1)
TextLabel10.TextSize = 14
TextLabel10.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel10.Parent = Internal

local Separator = Instance.new("Frame")
Separator.Name = "Separator"
Separator.Position = UDim2.new(0, 0, 0.0491803, 0)
Separator.Size = UDim2.new(0, 250, 0, 1)
Separator.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
Separator.BorderSizePixel = 0
Separator.BorderColor3 = Color3.new(0, 0, 0)
Separator.Parent = Internal

local UIStroke15 = Instance.new("UIStroke")
UIStroke15.Name = "UIStroke"
UIStroke15.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke15.Parent = Internal

local InternalScript = Instance.new("Frame")
InternalScript.Name = "InternalScript"
InternalScript.Position = UDim2.new(0.0131034, 0, 0.119424, 0)
InternalScript.Size = UDim2.new(0, 235, 0, 30)
InternalScript.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript.BorderSizePixel = 0
InternalScript.BorderColor3 = Color3.new(0, 0, 0)
InternalScript.Parent = Scripts2

local UICorner21 = Instance.new("UICorner")
UICorner21.Name = "UICorner"
UICorner21.CornerRadius = UDim.new(0, 4)
UICorner21.Parent = InternalScript

local UIStroke16 = Instance.new("UIStroke")
UIStroke16.Name = "UIStroke"
UIStroke16.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke16.Parent = InternalScript

local TextLabel11 = Instance.new("TextLabel")
TextLabel11.Name = "TextLabel"
TextLabel11.Size = UDim2.new(0, 235, 0, 30)
TextLabel11.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel11.BackgroundTransparency = 1
TextLabel11.BorderSizePixel = 0
TextLabel11.BorderColor3 = Color3.new(0, 0, 0)
TextLabel11.Transparency = 1
TextLabel11.Text = "ESP | by WA"
TextLabel11.TextColor3 = Color3.new(1, 1, 1)
TextLabel11.TextSize = 14
TextLabel11.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel11.Parent = InternalScript

local InternalScript2 = Instance.new("Frame")
InternalScript2.Name = "InternalScript"
InternalScript2.Position = UDim2.new(0.0131034, 0, 0.567, 0)
InternalScript2.Size = UDim2.new(0, 235, 0, 30)
InternalScript2.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript2.BorderSizePixel = 0
InternalScript2.BorderColor3 = Color3.new(0, 0, 0)
InternalScript2.Parent = Scripts2

local UICorner22 = Instance.new("UICorner")
UICorner22.Name = "UICorner"
UICorner22.CornerRadius = UDim.new(0, 4)
UICorner22.Parent = InternalScript2

local UIStroke17 = Instance.new("UIStroke")
UIStroke17.Name = "UIStroke"
UIStroke17.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke17.Parent = InternalScript2

local TextLabel12 = Instance.new("TextLabel")
TextLabel12.Name = "TextLabel"
TextLabel12.Size = UDim2.new(0, 234, 0, 30)
TextLabel12.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel12.BackgroundTransparency = 1
TextLabel12.BorderSizePixel = 0
TextLabel12.BorderColor3 = Color3.new(0, 0, 0)
TextLabel12.Transparency = 1
TextLabel12.Text = "External Shift"
TextLabel12.TextColor3 = Color3.new(1, 1, 1)
TextLabel12.TextSize = 14
TextLabel12.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel12.Parent = InternalScript2

local InternalScript3 = Instance.new("Frame")
InternalScript3.Name = "InternalScript"
InternalScript3.Position = UDim2.new(0.0131034, 0, 0.227338, 0)
InternalScript3.Size = UDim2.new(0, 235, 0, 30)
InternalScript3.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript3.BorderSizePixel = 0
InternalScript3.BorderColor3 = Color3.new(0, 0, 0)
InternalScript3.Parent = Scripts2

local UICorner23 = Instance.new("UICorner")
UICorner23.Name = "UICorner"
UICorner23.CornerRadius = UDim.new(0, 4)
UICorner23.Parent = InternalScript3

local UIStroke18 = Instance.new("UIStroke")
UIStroke18.Name = "UIStroke"
UIStroke18.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke18.Parent = InternalScript3

local TextLabel13 = Instance.new("TextLabel")
TextLabel13.Name = "TextLabel"
TextLabel13.Size = UDim2.new(0, 235, 0, 30)
TextLabel13.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel13.BackgroundTransparency = 1
TextLabel13.BorderSizePixel = 0
TextLabel13.BorderColor3 = Color3.new(0, 0, 0)
TextLabel13.Transparency = 1
TextLabel13.Text = "CFrame Speed"
TextLabel13.TextColor3 = Color3.new(1, 1, 1)
TextLabel13.TextSize = 14
TextLabel13.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel13.Parent = InternalScript3

local InternalScript4 = Instance.new("Frame")
InternalScript4.Name = "InternalScript"
InternalScript4.Position = UDim2.new(0.0131034, 0, 0.282014, 0)
InternalScript4.Size = UDim2.new(0, 235, 0, 30)
InternalScript4.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript4.BorderSizePixel = 0
InternalScript4.BorderColor3 = Color3.new(0, 0, 0)
InternalScript4.Parent = Scripts2

local UICorner24 = Instance.new("UICorner")
UICorner24.Name = "UICorner"
UICorner24.CornerRadius = UDim.new(0, 4)
UICorner24.Parent = InternalScript4

local UIStroke19 = Instance.new("UIStroke")
UIStroke19.Name = "UIStroke"
UIStroke19.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke19.Parent = InternalScript4

local TextLabel14 = Instance.new("TextLabel")
TextLabel14.Name = "TextLabel"
TextLabel14.Size = UDim2.new(0, 235, 0, 30)
TextLabel14.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel14.BackgroundTransparency = 1
TextLabel14.BorderSizePixel = 0
TextLabel14.BorderColor3 = Color3.new(0, 0, 0)
TextLabel14.Transparency = 1
TextLabel14.Text = "Fly | by Girlow"
TextLabel14.TextColor3 = Color3.new(1, 1, 1)
TextLabel14.TextSize = 14
TextLabel14.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel14.Parent = InternalScript4

local InternalScript5 = Instance.new("Frame")
InternalScript5.Name = "InternalScript"
InternalScript5.Position = UDim2.new(0.0131034, 0, 0.339568, 0)
InternalScript5.Size = UDim2.new(0, 235, 0, 30)
InternalScript5.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript5.BorderSizePixel = 0
InternalScript5.BorderColor3 = Color3.new(0, 0, 0)
InternalScript5.Parent = Scripts2

local UICorner25 = Instance.new("UICorner")
UICorner25.Name = "UICorner"
UICorner25.CornerRadius = UDim.new(0, 4)
UICorner25.Parent = InternalScript5

local UIStroke20 = Instance.new("UIStroke")
UIStroke20.Name = "UIStroke"
UIStroke20.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke20.Parent = InternalScript5

local TextLabel15 = Instance.new("TextLabel")
TextLabel15.Name = "TextLabel"
TextLabel15.Size = UDim2.new(0, 235, 0, 30)
TextLabel15.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel15.BackgroundTransparency = 1
TextLabel15.BorderSizePixel = 0
TextLabel15.BorderColor3 = Color3.new(0, 0, 0)
TextLabel15.Transparency = 1
TextLabel15.Text = "Gaze | Animations"
TextLabel15.TextColor3 = Color3.new(1, 1, 1)
TextLabel15.TextSize = 14
TextLabel15.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel15.Parent = InternalScript5

local InternalScript6 = Instance.new("Frame")
InternalScript6.Name = "InternalScript"
InternalScript6.Position = UDim2.new(0.0131034, 0, 0.398561, 0)
InternalScript6.Size = UDim2.new(0, 235, 0, 30)
InternalScript6.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript6.BorderSizePixel = 0
InternalScript6.BorderColor3 = Color3.new(0, 0, 0)
InternalScript6.Parent = Scripts2

local UICorner26 = Instance.new("UICorner")
UICorner26.Name = "UICorner"
UICorner26.CornerRadius = UDim.new(0, 4)
UICorner26.Parent = InternalScript6

local UIStroke21 = Instance.new("UIStroke")
UIStroke21.Name = "UIStroke"
UIStroke21.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke21.Parent = InternalScript6

local TextLabel16 = Instance.new("TextLabel")
TextLabel16.Name = "TextLabel"
TextLabel16.Size = UDim2.new(0, 235, 0, 30)
TextLabel16.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel16.BackgroundTransparency = 1
TextLabel16.BorderSizePixel = 0
TextLabel16.BorderColor3 = Color3.new(0, 0, 0)
TextLabel16.Transparency = 1
TextLabel16.Text = "AFEM | Emotions"
TextLabel16.TextColor3 = Color3.new(1, 1, 1)
TextLabel16.TextSize = 14
TextLabel16.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel16.Parent = InternalScript6

local InternalScript7 = Instance.new("Frame")
InternalScript7.Name = "InternalScript"
InternalScript7.Position = UDim2.new(0.0131034, 0, 0.457554, 0)
InternalScript7.Size = UDim2.new(0, 235, 0, 30)
InternalScript7.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript7.BorderSizePixel = 0
InternalScript7.BorderColor3 = Color3.new(0, 0, 0)
InternalScript7.Parent = Scripts2

local UICorner27 = Instance.new("UICorner")
UICorner27.Name = "UICorner"
UICorner27.CornerRadius = UDim.new(0, 4)
UICorner27.Parent = InternalScript7

local UIStroke22 = Instance.new("UIStroke")
UIStroke22.Name = "UIStroke"
UIStroke22.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke22.Parent = InternalScript7

local TextLabel17 = Instance.new("TextLabel")
TextLabel17.Name = "TextLabel"
TextLabel17.Size = UDim2.new(0, 235, 0, 30)
TextLabel17.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel17.BackgroundTransparency = 1
TextLabel17.BorderSizePixel = 0
TextLabel17.BorderColor3 = Color3.new(0, 0, 0)
TextLabel17.Transparency = 1
TextLabel17.Text = "Infinity Yield"
TextLabel17.TextColor3 = Color3.new(1, 1, 1)
TextLabel17.TextSize = 14
TextLabel17.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel17.Parent = InternalScript7

local InternalScript8 = Instance.new("Frame")
InternalScript8.Name = "InternalScript"
InternalScript8.Position = UDim2.new(0.0131034, 0, 0.515108, 0)
InternalScript8.Size = UDim2.new(0, 235, 0, 30)
InternalScript8.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript8.BorderSizePixel = 0
InternalScript8.BorderColor3 = Color3.new(0, 0, 0)
InternalScript8.Parent = Scripts2

local UICorner28 = Instance.new("UICorner")
UICorner28.Name = "UICorner"
UICorner28.CornerRadius = UDim.new(0, 4)
UICorner28.Parent = InternalScript8

local UIStroke23 = Instance.new("UIStroke")
UIStroke23.Name = "UIStroke"
UIStroke23.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke23.Parent = InternalScript8

local TextLabel18 = Instance.new("TextLabel")
TextLabel18.Name = "TextLabel"
TextLabel18.Size = UDim2.new(0, 235, 0, 30)
TextLabel18.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel18.BackgroundTransparency = 1
TextLabel18.BorderSizePixel = 0
TextLabel18.BorderColor3 = Color3.new(0, 0, 0)
TextLabel18.Transparency = 1
TextLabel18.Text = "System Broken"
TextLabel18.TextColor3 = Color3.new(1, 1, 1)
TextLabel18.TextSize = 14
TextLabel18.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel18.Parent = InternalScript8

local InternalScript9 = Instance.new("Frame")
InternalScript9.Name = "InternalScript"
InternalScript9.Position = UDim2.new(0.0131034, 0, 0.617266, 0)
InternalScript9.Size = UDim2.new(0, 235, 0, 30)
InternalScript9.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript9.BorderSizePixel = 0
InternalScript9.BorderColor3 = Color3.new(0, 0, 0)
InternalScript9.Parent = Scripts2

local UICorner29 = Instance.new("UICorner")
UICorner29.Name = "UICorner"
UICorner29.CornerRadius = UDim.new(0, 4)
UICorner29.Parent = InternalScript9

local UIStroke24 = Instance.new("UIStroke")
UIStroke24.Name = "UIStroke"
UIStroke24.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke24.Parent = InternalScript9

local TextBox = Instance.new("TextBox")
TextBox.Name = "TextBox"
TextBox.Position = UDim2.new(0.0382979, 0, 0.233333, 0)
TextBox.Size = UDim2.new(0, 217, 0, 16)
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundTransparency = 1
TextBox.BorderSizePixel = 0
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.Transparency = 1
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.TextSize = 16
TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.PlaceholderText = "Aspect Ratio | 0.01 - 1.00"
TextBox.Parent = InternalScript9

local Game_Scripts = Instance.new("Frame")
Game_Scripts.Name = "Game-Scripts"
Game_Scripts.Position = UDim2.new(0.193103, 0, 0.0618705, 0)
Game_Scripts.Size = UDim2.new(0, 250, 0, 610)
Game_Scripts.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Game_Scripts.BorderSizePixel = 0
Game_Scripts.BorderColor3 = Color3.new(0, 0, 0)
Game_Scripts.Parent = Scripts2

local UICorner30 = Instance.new("UICorner")
UICorner30.Name = "UICorner"
UICorner30.CornerRadius = UDim.new(0, 4)
UICorner30.Parent = Game_Scripts

local TextLabel19 = Instance.new("TextLabel")
TextLabel19.Name = "TextLabel"
TextLabel19.Size = UDim2.new(0, 250, 0, 30)
TextLabel19.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel19.BackgroundTransparency = 1
TextLabel19.BorderSizePixel = 0
TextLabel19.BorderColor3 = Color3.new(0, 0, 0)
TextLabel19.Transparency = 1
TextLabel19.Text = "Game Scripts"
TextLabel19.TextColor3 = Color3.new(1, 1, 1)
TextLabel19.TextSize = 14
TextLabel19.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel19.Parent = Game_Scripts

local Separator2 = Instance.new("Frame")
Separator2.Name = "Separator"
Separator2.Position = UDim2.new(0, 0, 0.0491803, 0)
Separator2.Size = UDim2.new(0, 250, 0, 1)
Separator2.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
Separator2.BorderSizePixel = 0
Separator2.BorderColor3 = Color3.new(0, 0, 0)
Separator2.Parent = Game_Scripts

local UIStroke25 = Instance.new("UIStroke")
UIStroke25.Name = "UIStroke"
UIStroke25.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke25.Parent = Game_Scripts

local TextLabel20 = Instance.new("TextLabel")
TextLabel20.Name = "TextLabel"
TextLabel20.Position = UDim2.new(0, 0, 0.0491803, 0)
TextLabel20.Size = UDim2.new(0, 250, 0, 30)
TextLabel20.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel20.BackgroundTransparency = 1
TextLabel20.BorderSizePixel = 0
TextLabel20.BorderColor3 = Color3.new(0, 0, 0)
TextLabel20.Transparency = 1
TextLabel20.Text = "Violence District"
TextLabel20.TextColor3 = Color3.new(1, 1, 1)
TextLabel20.TextSize = 14
TextLabel20.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel20.Parent = Game_Scripts

local TextLabel21 = Instance.new("TextLabel")
TextLabel21.Name = "TextLabel"
TextLabel21.Position = UDim2.new(0, 0, 0.270492, 0)
TextLabel21.Size = UDim2.new(0, 250, 0, 30)
TextLabel21.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel21.BackgroundTransparency = 1
TextLabel21.BorderSizePixel = 0
TextLabel21.BorderColor3 = Color3.new(0, 0, 0)
TextLabel21.Transparency = 1
TextLabel21.Text = "Murder Mystery 2"
TextLabel21.TextColor3 = Color3.new(1, 1, 1)
TextLabel21.TextSize = 14
TextLabel21.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel21.Parent = Game_Scripts

local TextLabel22 = Instance.new("TextLabel")
TextLabel22.Name = "TextLabel"
TextLabel22.Position = UDim2.new(-0.004, 0, 0.5, 0)
TextLabel22.Size = UDim2.new(0, 250, 0, 30)
TextLabel22.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel22.BackgroundTransparency = 1
TextLabel22.BorderSizePixel = 0
TextLabel22.BorderColor3 = Color3.new(0, 0, 0)
TextLabel22.Transparency = 1
TextLabel22.Text = "Lumber Tycoon 2"
TextLabel22.TextColor3 = Color3.new(1, 1, 1)
TextLabel22.TextSize = 14
TextLabel22.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel22.Parent = Game_Scripts

local GameScript = Instance.new("Frame")
GameScript.Name = "GameScript"
GameScript.Position = UDim2.new(0.197931, 0, 0.148201, 0)
GameScript.Size = UDim2.new(0, 235, 0, 30)
GameScript.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
GameScript.BorderSizePixel = 0
GameScript.BorderColor3 = Color3.new(0, 0, 0)
GameScript.Parent = Scripts2

local UICorner31 = Instance.new("UICorner")
UICorner31.Name = "UICorner"
UICorner31.CornerRadius = UDim.new(0, 4)
UICorner31.Parent = GameScript

local UIStroke26 = Instance.new("UIStroke")
UIStroke26.Name = "UIStroke"
UIStroke26.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke26.Parent = GameScript

local TextLabel23 = Instance.new("TextLabel")
TextLabel23.Name = "TextLabel"
TextLabel23.Size = UDim2.new(0, 234, 0, 30)
TextLabel23.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel23.BackgroundTransparency = 1
TextLabel23.BorderSizePixel = 0
TextLabel23.BorderColor3 = Color3.new(0, 0, 0)
TextLabel23.Transparency = 1
TextLabel23.Text = "Script | by TexxRBLX"
TextLabel23.TextColor3 = Color3.new(1, 1, 1)
TextLabel23.TextSize = 16
TextLabel23.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel23.Parent = GameScript

local GameScript2 = Instance.new("Frame")
GameScript2.Name = "GameScript"
GameScript2.Position = UDim2.new(0.197931, 0, 0.2, 0)
GameScript2.Size = UDim2.new(0, 235, 0, 30)
GameScript2.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
GameScript2.BorderSizePixel = 0
GameScript2.BorderColor3 = Color3.new(0, 0, 0)
GameScript2.Parent = Scripts2

local UICorner32 = Instance.new("UICorner")
UICorner32.Name = "UICorner"
UICorner32.CornerRadius = UDim.new(0, 4)
UICorner32.Parent = GameScript2

local UIStroke27 = Instance.new("UIStroke")
UIStroke27.Name = "UIStroke"
UIStroke27.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke27.Parent = GameScript2

local TextLabel24 = Instance.new("TextLabel")
TextLabel24.Name = "TextLabel"
TextLabel24.Size = UDim2.new(0, 234, 0, 30)
TextLabel24.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel24.BackgroundTransparency = 1
TextLabel24.BorderSizePixel = 0
TextLabel24.BorderColor3 = Color3.new(0, 0, 0)
TextLabel24.Transparency = 1
TextLabel24.Text = "AntiStopEmote | by Girlow"
TextLabel24.TextColor3 = Color3.new(1, 1, 1)
TextLabel24.TextSize = 16
TextLabel24.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel24.Parent = GameScript2

local GameScript3 = Instance.new("Frame")
GameScript3.Name = "GameScript"
GameScript3.Position = UDim2.new(0.197931, 0, 0.256115, 0)
GameScript3.Size = UDim2.new(0, 235, 0, 30)
GameScript3.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
GameScript3.BorderSizePixel = 0
GameScript3.BorderColor3 = Color3.new(0, 0, 0)
GameScript3.Parent = Scripts2

local UICorner33 = Instance.new("UICorner")
UICorner33.Name = "UICorner"
UICorner33.CornerRadius = UDim.new(0, 4)
UICorner33.Parent = GameScript3

local UIStroke28 = Instance.new("UIStroke")
UIStroke28.Name = "UIStroke"
UIStroke28.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke28.Parent = GameScript3

local TextLabel25 = Instance.new("TextLabel")
TextLabel25.Name = "TextLabel"
TextLabel25.Position = UDim2.new(0.00425532, 0, 0, 0)
TextLabel25.Size = UDim2.new(0, 234, 0, 30)
TextLabel25.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel25.BackgroundTransparency = 1
TextLabel25.BorderSizePixel = 0
TextLabel25.BorderColor3 = Color3.new(0, 0, 0)
TextLabel25.Transparency = 1
TextLabel25.Text = "MoonWalk | by Girlow"
TextLabel25.TextColor3 = Color3.new(1, 1, 1)
TextLabel25.TextSize = 16
TextLabel25.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel25.Parent = GameScript3

local GameScript4 = Instance.new("Frame")
GameScript4.Name = "GameScript"
GameScript4.Position = UDim2.new(0.197931, 0, 0.342446, 0)
GameScript4.Size = UDim2.new(0, 235, 0, 30)
GameScript4.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
GameScript4.BorderSizePixel = 0
GameScript4.BorderColor3 = Color3.new(0, 0, 0)
GameScript4.Parent = Scripts2

local UICorner34 = Instance.new("UICorner")
UICorner34.Name = "UICorner"
UICorner34.CornerRadius = UDim.new(0, 4)
UICorner34.Parent = GameScript4

local UIStroke29 = Instance.new("UIStroke")
UIStroke29.Name = "UIStroke"
UIStroke29.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke29.Parent = GameScript4

local TextLabel26 = Instance.new("TextLabel")
TextLabel26.Name = "TextLabel"
TextLabel26.Position = UDim2.new(0.00425532, 0, 0, 0)
TextLabel26.Size = UDim2.new(0, 234, 0, 30)
TextLabel26.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel26.BackgroundTransparency = 1
TextLabel26.BorderSizePixel = 0
TextLabel26.BorderColor3 = Color3.new(0, 0, 0)
TextLabel26.Transparency = 1
TextLabel26.Text = "Vertex"
TextLabel26.TextColor3 = Color3.new(1, 1, 1)
TextLabel26.TextSize = 16
TextLabel26.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel26.Parent = GameScript4

local GameScript5 = Instance.new("Frame")
GameScript5.Name = "GameScript"
GameScript5.Position = UDim2.new(0.197931, 0, 0.398561, 0)
GameScript5.Size = UDim2.new(0, 235, 0, 30)
GameScript5.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
GameScript5.BorderSizePixel = 0
GameScript5.BorderColor3 = Color3.new(0, 0, 0)
GameScript5.Parent = Scripts2

local UICorner35 = Instance.new("UICorner")
UICorner35.Name = "UICorner"
UICorner35.CornerRadius = UDim.new(0, 4)
UICorner35.Parent = GameScript5

local UIStroke30 = Instance.new("UIStroke")
UIStroke30.Name = "UIStroke"
UIStroke30.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke30.Parent = GameScript5

local TextLabel27 = Instance.new("TextLabel")
TextLabel27.Name = "TextLabel"
TextLabel27.Position = UDim2.new(0.00425532, 0, 0, 0)
TextLabel27.Size = UDim2.new(0, 234, 0, 30)
TextLabel27.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel27.BackgroundTransparency = 1
TextLabel27.BorderSizePixel = 0
TextLabel27.BorderColor3 = Color3.new(0, 0, 0)
TextLabel27.Transparency = 1
TextLabel27.Text = "XHub"
TextLabel27.TextColor3 = Color3.new(1, 1, 1)
TextLabel27.TextSize = 16
TextLabel27.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel27.Parent = GameScript5

local GameScript6 = Instance.new("Frame")
GameScript6.Name = "GameScript"
GameScript6.Position = UDim2.new(0.197931, 0, 0.457554, 0)
GameScript6.Size = UDim2.new(0, 235, 0, 30)
GameScript6.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
GameScript6.BorderSizePixel = 0
GameScript6.BorderColor3 = Color3.new(0, 0, 0)
GameScript6.Parent = Scripts2

local UICorner36 = Instance.new("UICorner")
UICorner36.Name = "UICorner"
UICorner36.CornerRadius = UDim.new(0, 4)
UICorner36.Parent = GameScript6

local UIStroke31 = Instance.new("UIStroke")
UIStroke31.Name = "UIStroke"
UIStroke31.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke31.Parent = GameScript6

local TextLabel28 = Instance.new("TextLabel")
TextLabel28.Name = "TextLabel"
TextLabel28.Position = UDim2.new(0.00425532, 0, 0, 0)
TextLabel28.Size = UDim2.new(0, 234, 0, 30)
TextLabel28.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel28.BackgroundTransparency = 1
TextLabel28.BorderSizePixel = 0
TextLabel28.BorderColor3 = Color3.new(0, 0, 0)
TextLabel28.Transparency = 1
TextLabel28.Text = "OverDriveHub"
TextLabel28.TextColor3 = Color3.new(1, 1, 1)
TextLabel28.TextSize = 16
TextLabel28.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel28.Parent = GameScript6

local GameScript7 = Instance.new("Frame")
GameScript7.Name = "GameScript"
GameScript7.Position = UDim2.new(0.197931, 0, 0.543885, 0)
GameScript7.Size = UDim2.new(0, 235, 0, 30)
GameScript7.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
GameScript7.BorderSizePixel = 0
GameScript7.BorderColor3 = Color3.new(0, 0, 0)
GameScript7.Parent = Scripts2

local UICorner37 = Instance.new("UICorner")
UICorner37.Name = "UICorner"
UICorner37.CornerRadius = UDim.new(0, 4)
UICorner37.Parent = GameScript7

local UIStroke32 = Instance.new("UIStroke")
UIStroke32.Name = "UIStroke"
UIStroke32.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke32.Parent = GameScript7

local TextLabel29 = Instance.new("TextLabel")
TextLabel29.Name = "TextLabel"
TextLabel29.Position = UDim2.new(0.00425532, 0, 0, 0)
TextLabel29.Size = UDim2.new(0, 234, 0, 30)
TextLabel29.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel29.BackgroundTransparency = 1
TextLabel29.BorderSizePixel = 0
TextLabel29.BorderColor3 = Color3.new(0, 0, 0)
TextLabel29.Transparency = 1
TextLabel29.Text = "Kron Hub"
TextLabel29.TextColor3 = Color3.new(1, 1, 1)
TextLabel29.TextSize = 16
TextLabel29.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel29.Parent = GameScript7

local Hubs = Instance.new("Frame")
Hubs.Name = "Hubs"
Hubs.Position = UDim2.new(0.373793, 0, 0.0604317, 0)
Hubs.Size = UDim2.new(0, 250, 0, 610)
Hubs.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Hubs.BorderSizePixel = 0
Hubs.BorderColor3 = Color3.new(0, 0, 0)
Hubs.Parent = Scripts2

local UICorner38 = Instance.new("UICorner")
UICorner38.Name = "UICorner"
UICorner38.CornerRadius = UDim.new(0, 4)
UICorner38.Parent = Hubs

local TextLabel30 = Instance.new("TextLabel")
TextLabel30.Name = "TextLabel"
TextLabel30.Size = UDim2.new(0, 250, 0, 30)
TextLabel30.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel30.BackgroundTransparency = 1
TextLabel30.BorderSizePixel = 0
TextLabel30.BorderColor3 = Color3.new(0, 0, 0)
TextLabel30.Transparency = 1
TextLabel30.Text = "Hubs"
TextLabel30.TextColor3 = Color3.new(1, 1, 1)
TextLabel30.TextSize = 14
TextLabel30.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel30.Parent = Hubs

local Separator3 = Instance.new("Frame")
Separator3.Name = "Separator"
Separator3.Position = UDim2.new(0, 0, 0.0491803, 0)
Separator3.Size = UDim2.new(0, 250, 0, 1)
Separator3.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
Separator3.BorderSizePixel = 0
Separator3.BorderColor3 = Color3.new(0, 0, 0)
Separator3.Parent = Hubs

local UIStroke33 = Instance.new("UIStroke")
UIStroke33.Name = "UIStroke"
UIStroke33.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke33.Parent = Hubs

local HubScript = Instance.new("Frame")
HubScript.Name = "HubScript"
HubScript.Position = UDim2.new(0.378621, 0, 0.119424, 0)
HubScript.Size = UDim2.new(0, 235, 0, 30)
HubScript.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
HubScript.BorderSizePixel = 0
HubScript.BorderColor3 = Color3.new(0, 0, 0)
HubScript.Parent = Scripts2

local UICorner39 = Instance.new("UICorner")
UICorner39.Name = "UICorner"
UICorner39.CornerRadius = UDim.new(0, 4)
UICorner39.Parent = HubScript

local UIStroke34 = Instance.new("UIStroke")
UIStroke34.Name = "UIStroke"
UIStroke34.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke34.Parent = HubScript

local TextLabel31 = Instance.new("TextLabel")
TextLabel31.Name = "TextLabel"
TextLabel31.Position = UDim2.new(0.00425532, 0, 0, 0)
TextLabel31.Size = UDim2.new(0, 234, 0, 30)
TextLabel31.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel31.BackgroundTransparency = 1
TextLabel31.BorderSizePixel = 0
TextLabel31.BorderColor3 = Color3.new(0, 0, 0)
TextLabel31.Transparency = 1
TextLabel31.Text = "Yoxi Hub"
TextLabel31.TextColor3 = Color3.new(1, 1, 1)
TextLabel31.TextSize = 16
TextLabel31.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel31.Parent = HubScript

local HubScript2 = Instance.new("Frame")
HubScript2.Name = "HubScript"
HubScript2.Position = UDim2.new(0.378621, 0, 0.172662, 0)
HubScript2.Size = UDim2.new(0, 235, 0, 30)
HubScript2.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
HubScript2.BorderSizePixel = 0
HubScript2.BorderColor3 = Color3.new(0, 0, 0)
HubScript2.Parent = Scripts2

local UICorner40 = Instance.new("UICorner")
UICorner40.Name = "UICorner"
UICorner40.CornerRadius = UDim.new(0, 4)
UICorner40.Parent = HubScript2

local UIStroke35 = Instance.new("UIStroke")
UIStroke35.Name = "UIStroke"
UIStroke35.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke35.Parent = HubScript2

local TextLabel32 = Instance.new("TextLabel")
TextLabel32.Name = "TextLabel"
TextLabel32.Position = UDim2.new(0.00425532, 0, 0, 0)
TextLabel32.Size = UDim2.new(0, 234, 0, 30)
TextLabel32.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel32.BackgroundTransparency = 1
TextLabel32.BorderSizePixel = 0
TextLabel32.BorderColor3 = Color3.new(0, 0, 0)
TextLabel32.Transparency = 1
TextLabel32.Text = "Dara Hub"
TextLabel32.TextColor3 = Color3.new(1, 1, 1)
TextLabel32.TextSize = 16
TextLabel32.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel32.Parent = HubScript2

local InternalScript10 = Instance.new("Frame")
InternalScript10.Name = "InternalScript"
InternalScript10.Position = UDim2.new(0.0131034, 0, 0.172662, 0)
InternalScript10.Size = UDim2.new(0, 235, 0, 30)
InternalScript10.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InternalScript10.BorderSizePixel = 0
InternalScript10.BorderColor3 = Color3.new(0, 0, 0)
InternalScript10.Parent = Scripts2

local UICorner41 = Instance.new("UICorner")
UICorner41.Name = "UICorner"
UICorner41.CornerRadius = UDim.new(0, 4)
UICorner41.Parent = InternalScript10

local UIStroke36 = Instance.new("UIStroke")
UIStroke36.Name = "UIStroke"
UIStroke36.Color = Color3.new(0.4, 0.4, 0.4)
UIStroke36.Parent = InternalScript10

local TextLabel33 = Instance.new("TextLabel")
TextLabel33.Name = "TextLabel"
TextLabel33.Size = UDim2.new(0, 235, 0, 30)
TextLabel33.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel33.BackgroundTransparency = 1
TextLabel33.BorderSizePixel = 0
TextLabel33.BorderColor3 = Color3.new(0, 0, 0)
TextLabel33.Transparency = 1
TextLabel33.Text = "Limb Extender | by AAPVdev"
TextLabel33.TextColor3 = Color3.new(1, 1, 1)
TextLabel33.TextSize = 14
TextLabel33.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel33.Parent = InternalScript10
