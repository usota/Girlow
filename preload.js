const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('api', {
  readDir: (path) => ipcRenderer.invoke('read-dir', path),
  getDrives: () => ipcRenderer.invoke('get-drives'),
  getHome: () => ipcRenderer.invoke('get-home'),
  getQuickAccess: () => ipcRenderer.invoke('get-quick-access'),
  openFile: (path) => ipcRenderer.invoke('open-file', path),
  deleteItem: (path) => ipcRenderer.invoke('delete-item', path),
  renameItem: (path, name) => ipcRenderer.invoke('rename-item', path, name),
  createFolder: (dir, name) => ipcRenderer.invoke('create-folder', dir, name),
  copyItem: (src, dest) => ipcRenderer.invoke('copy-item', src, dest),
  getFileInfo: (path) => ipcRenderer.invoke('get-file-info', path),
  windowMinimize: () => ipcRenderer.invoke('window-minimize'),
  windowMaximize: () => ipcRenderer.invoke('window-maximize'),
  windowClose: () => ipcRenderer.invoke('window-close'),
  chooseFolder: () => ipcRenderer.invoke('choose-folder'),
  pathJoin: (...parts) => ipcRenderer.invoke('path-join', ...parts),
  pathDirname: (p) => ipcRenderer.invoke('path-dirname', p),
  pathBasename: (p) => ipcRenderer.invoke('path-basename', p),
  pathSep: () => ipcRenderer.invoke('path-sep'),
  getBackground: () => ipcRenderer.invoke('get-background'),
  getIconConfig: () => ipcRenderer.invoke('get-icon-config'),
});