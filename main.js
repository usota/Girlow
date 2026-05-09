const { app, BrowserWindow, ipcMain, dialog, shell, nativeTheme } = require('electron');
const path = require('path');
const fs = require('fs');
const os = require('os');

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1280,
    height: 800,
    minWidth: 900,
    minHeight: 600,
    frame: false,
    titleBarStyle: 'hidden',
    backgroundColor: '#0f1117',
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      preload: path.join(__dirname, 'preload.js')
    },
    icon: path.join(__dirname, 'assets', 'icon.png')
  });

  mainWindow.loadFile('index.html');
}

app.whenReady().then(createWindow);
app.commandLine.appendSwitch('no-sandbox')
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) createWindow();
});

ipcMain.handle('read-dir', async (event, dirPath) => {
  try {
    const entries = fs.readdirSync(dirPath, { withFileTypes: true });
    const items = entries.map(entry => {
      const fullPath = path.join(dirPath, entry.name);
      let size = 0, mtime = null, isHidden = false;
      try {
        const stat = fs.statSync(fullPath);
        size = stat.size;
        mtime = stat.mtime;
      } catch {}
      isHidden = entry.name.startsWith('.');
      return {
        name: entry.name,
        path: fullPath,
        isDirectory: entry.isDirectory(),
        isHidden,
        size,
        mtime,
        ext: entry.isDirectory() ? '' : path.extname(entry.name).toLowerCase()
      };
    });
    return { success: true, items };
  } catch (err) {
    return { success: false, error: err.message };
  }
});

ipcMain.handle('get-drives', async () => {
  const drives = [];
  if (process.platform === 'win32') {
    for (let i = 65; i <= 90; i++) {
      const driveLetter = String.fromCharCode(i) + ':\\';
      try { fs.accessSync(driveLetter); drives.push({ name: driveLetter, path: driveLetter, type: 'drive' }); } catch {}
    }
  } else {
    drives.push({ name: 'Root', path: '/', type: 'drive' });
    drives.push({ name: 'Home', path: os.homedir(), type: 'home' });
  }
  return drives;
});

ipcMain.handle('get-home', async () => os.homedir());

ipcMain.handle('get-quick-access', async () => {
  const home = os.homedir();
  const places = [
    { name: 'Home', path: home, icon: 'home' },
    { name: 'Desktop', path: path.join(home, 'Desktop'), icon: 'desktop' },
    { name: 'Documents', path: path.join(home, 'Documents'), icon: 'documents' },
    { name: 'Downloads', path: path.join(home, 'Downloads'), icon: 'downloads' },
    { name: 'Pictures', path: path.join(home, 'Pictures'), icon: 'pictures' },
    { name: 'Music', path: path.join(home, 'Music'), icon: 'music' },
    { name: 'Videos', path: path.join(home, 'Videos'), icon: 'videos' },
  ];
  return places.filter(p => { try { fs.accessSync(p.path); return true; } catch { return false; } });
});

ipcMain.handle('open-file', async (event, filePath) => {
  try { await shell.openPath(filePath); return { success: true }; }
  catch (err) { return { success: false, error: err.message }; }
});

ipcMain.handle('delete-item', async (event, itemPath) => {
  try { await shell.trashItem(itemPath); return { success: true }; }
  catch (err) { return { success: false, error: err.message }; }
});

ipcMain.handle('rename-item', async (event, oldPath, newName) => {
  try {
    const dir = path.dirname(oldPath);
    const newPath = path.join(dir, newName);
    fs.renameSync(oldPath, newPath);
    return { success: true, newPath };
  } catch (err) { return { success: false, error: err.message }; }
});

ipcMain.handle('create-folder', async (event, dirPath, name) => {
  try {
    const newPath = path.join(dirPath, name);
    fs.mkdirSync(newPath);
    return { success: true, newPath };
  } catch (err) { return { success: false, error: err.message }; }
});

ipcMain.handle('copy-item', async (event, src, destDir) => {
  try {
    const name = path.basename(src);
    const dest = path.join(destDir, name);
    fs.cpSync(src, dest, { recursive: true });
    return { success: true };
  } catch (err) { return { success: false, error: err.message }; }
});

ipcMain.handle('get-file-info', async (event, filePath) => {
  try {
    const stat = fs.statSync(filePath);
    return { success: true, size: stat.size, mtime: stat.mtime, atime: stat.atime, ctime: stat.birthtime };
  } catch (err) { return { success: false, error: err.message }; }
});

ipcMain.handle('window-minimize', () => mainWindow.minimize());
ipcMain.handle('window-maximize', () => {
  if (mainWindow.isMaximized()) mainWindow.unmaximize();
  else mainWindow.maximize();
});
ipcMain.handle('window-close', () => mainWindow.close());

ipcMain.handle('choose-folder', async () => {
  const result = await dialog.showOpenDialog(mainWindow, { properties: ['openDirectory'] });
  if (!result.canceled && result.filePaths.length > 0) return result.filePaths[0];
  return null;
});

ipcMain.handle('path-join', (event, ...parts) => path.join(...parts));
ipcMain.handle('path-dirname', (event, p) => path.dirname(p));
ipcMain.handle('path-basename', (event, p) => path.basename(p));
ipcMain.handle('path-sep', () => path.sep);

ipcMain.handle('get-icon-config', () => {
  const confPath = path.join(__dirname, 'icons.conf');
  try {
    fs.accessSync(confPath);
    const lines = fs.readFileSync(confPath, 'utf8').split('\n');
    const result = {};
    for (const line of lines) {
      const trimmed = line.trim();
      if (!trimmed || trimmed.startsWith('#')) continue;
      const eqIdx = trimmed.indexOf('=');
      if (eqIdx === -1) continue;
      const ext = trimmed.slice(0, eqIdx).trim().toLowerCase().replace(/^\./, '');
      const iconPath = trimmed.slice(eqIdx + 1).trim().replace(/^["']|["']$/g, '');
      const fullIconPath = path.isAbsolute(iconPath)
        ? iconPath
        : path.join(__dirname, iconPath);
      try {
        const data = fs.readFileSync(fullIconPath);
        const mime = fullIconPath.endsWith('.png') ? 'image/png'
          : fullIconPath.endsWith('.svg') ? 'image/svg+xml'
          : fullIconPath.endsWith('.ico') ? 'image/x-icon'
          : 'image/png';
        result[ext] = `data:${mime};base64,` + data.toString('base64');
      } catch {}
    }
    return result;
  } catch {
    return {};
  }
});

ipcMain.handle('get-background', () => {
  const bgPath = path.join(__dirname, 'background.png');
  try {
    fs.accessSync(bgPath);
    const data = fs.readFileSync(bgPath);
    return 'data:image/png;base64,' + data.toString('base64');
  } catch {
    return null;
  }
});