'use strict';

const state = {
  tabs: [],
  activeTab: null,
  viewMode: 'grid',
  sortBy: 'name',
  sortDir: 'asc',
  showHidden: false,
  searchQuery: '',
  clipboard: null,
  sep: '/'
};

let tabIdCounter = 1;
async function init() {
  state.sep = await api.pathSep();
  state.iconConfig = await api.getIconConfig();
  await loadBackground();
  await loadSidebar();
  const home = await api.getHome();
  await newTab(home);
  setupEventListeners();
}

async function loadBackground() {
  const dataUrl = await api.getBackground();
  if (dataUrl) {
    document.getElementById('bg-layer').style.backgroundImage = `url('${dataUrl}')`;
    document.body.classList.add('has-bg');
  }
}

async function newTab(path) {
  const id = tabIdCounter++;
  const tab = { id, path, history: [path], historyIdx: 0, items: [], scrollTop: 0 };
  state.tabs.push(tab);
  renderTabs();
  await activateTab(id);
}

function closeTab(id) {
  const idx = state.tabs.findIndex(t => t.id === id);
  if (state.tabs.length === 1) return;
  state.tabs.splice(idx, 1);
  if (state.activeTab === id) {
    const newIdx = Math.min(idx, state.tabs.length - 1);
    activateTab(state.tabs[newIdx].id);
  } else {
    renderTabs();
  }
}

async function activateTab(id) {
  state.activeTab = id;
  renderTabs();
  const tab = getActiveTab();
  await navigateTo(tab.path, false);
}

function getActiveTab() {
  return state.tabs.find(t => t.id === state.activeTab);
}

function renderTabs() {
  const list = document.getElementById('tabs-list');
  list.innerHTML = '';
  state.tabs.forEach(tab => {
    const div = document.createElement('div');
    div.className = 'tab' + (tab.id === state.activeTab ? ' active' : '');
    div.title = tab.path;
    const name = getBasename(tab.path) || tab.path;
    div.innerHTML = `
      <span class="tab-icon">${folderSvg(12)}</span>
      <span class="tab-title">${escHtml(name)}</span>
      <span class="tab-close" data-id="${tab.id}">${closeSvg(8)}</span>
    `;
    div.addEventListener('click', (e) => {
      if (!e.target.closest('.tab-close')) activateTab(tab.id);
    });
    div.querySelector('.tab-close').addEventListener('click', (e) => {
      e.stopPropagation();
      closeTab(tab.id);
    });
    list.appendChild(div);
  });
}

async function navigateTo(path, pushHistory = true) {
  const tab = getActiveTab();
  if (!tab) return;

  tab.path = path;
  if (pushHistory) {
    tab.history = tab.history.slice(0, tab.historyIdx + 1);
    tab.history.push(path);
    tab.historyIdx = tab.history.length - 1;
  }

  updateNavButtons();
  updateAddressBar(path);
  renderTabs();

  document.getElementById('file-grid').innerHTML = `<div class="loading-spinner" style="grid-column:1/-1"><div class="spinner"></div>Loading…</div>`;
  document.getElementById('list-body').innerHTML = `<div class="loading-spinner"><div class="spinner"></div>Loading…</div>`;

  const result = await api.readDir(path);
  if (!result.success) {
    showEmpty(`Cannot open this folder: ${result.error}`);
    return;
  }
  tab.items = result.items;
  renderFiles();
  updateStatus();
  updateSidebarActive(path);

  const sep = await api.pathSep();
  document.getElementById('status-path').textContent = path;
}

function goBack() {
  const tab = getActiveTab();
  if (!tab || tab.historyIdx <= 0) return;
  tab.historyIdx--;
  navigateTo(tab.history[tab.historyIdx], false);
}

function goForward() {
  const tab = getActiveTab();
  if (!tab || tab.historyIdx >= tab.history.length - 1) return;
  tab.historyIdx++;
  navigateTo(tab.history[tab.historyIdx], false);
}

async function goUp() {
  const tab = getActiveTab();
  if (!tab) return;
  const parent = await api.pathDirname(tab.path);
  if (parent !== tab.path) navigateTo(parent);
}

function refresh() {
  const tab = getActiveTab();
  if (tab) navigateTo(tab.path, false);
}

function updateNavButtons() {
  const tab = getActiveTab();
  document.getElementById('btn-back').disabled = !tab || tab.historyIdx <= 0;
  document.getElementById('btn-forward').disabled = !tab || tab.historyIdx >= tab.history.length - 1;
}

function updateAddressBar(path) {
  const bc = document.getElementById('breadcrumbs');
  const ab = document.getElementById('addressbar');
  ab.value = path;
  bc.innerHTML = '';
  bc.classList.remove('hidden');
  ab.classList.remove('visible');

  const parts = path.split(state.sep).filter(Boolean);
  const isAbsolute = path.startsWith(state.sep) || (path.length >= 3 && path[1] === ':');

  let builtPath = isAbsolute && !path.startsWith(state.sep) ? '' : state.sep;
  const crumbs = [];

  if (isAbsolute && !path.startsWith(state.sep)) {
    builtPath = parts[0] + state.sep;
    crumbs.push({ label: parts[0] + state.sep, path: builtPath });
    parts.shift();
  }

  parts.forEach(part => {
    builtPath = builtPath.endsWith(state.sep) ? builtPath + part : builtPath + state.sep + part;
    crumbs.push({ label: part, path: builtPath });
  });

  crumbs.forEach((crumb, i) => {
    const span = document.createElement('span');
    span.className = 'breadcrumb-item' + (i === crumbs.length - 1 ? ' last' : '');
    span.textContent = crumb.label;
    span.title = crumb.path;
    span.addEventListener('click', () => navigateTo(crumb.path));
    bc.appendChild(span);
    if (i < crumbs.length - 1) {
      const sep = document.createElement('span');
      sep.className = 'breadcrumb-sep';
      sep.textContent = '›';
      bc.appendChild(sep);
    }
  });
}

function showAddressInput() {
  const bc = document.getElementById('breadcrumbs');
  const ab = document.getElementById('addressbar');
  bc.classList.add('hidden');
  ab.classList.add('visible');
  ab.focus();
  ab.select();
}

function getFilteredItems() {
  const tab = getActiveTab();
  if (!tab) return [];
  let items = [...tab.items];
  if (!state.showHidden) items = items.filter(i => !i.isHidden);
  if (state.searchQuery) {
    const q = state.searchQuery.toLowerCase();
    items = items.filter(i => i.name.toLowerCase().includes(q));
  }
  items.sort((a, b) => {
    if (a.isDirectory !== b.isDirectory) return a.isDirectory ? -1 : 1;
    let va, vb;
    switch (state.sortBy) {
      case 'name': va = a.name.toLowerCase(); vb = b.name.toLowerCase(); break;
      case 'size': va = a.size; vb = b.size; break;
      case 'type': va = a.ext; vb = b.ext; break;
      case 'date': va = a.mtime ? new Date(a.mtime).getTime() : 0; vb = b.mtime ? new Date(b.mtime).getTime() : 0; break;
      default: va = a.name.toLowerCase(); vb = b.name.toLowerCase();
    }
    let cmp = va < vb ? -1 : va > vb ? 1 : 0;
    return state.sortDir === 'desc' ? -cmp : cmp;
  });
  return items;
}

function renderFiles() {
  if (state.viewMode === 'grid') renderGrid();
  else renderList();
}

function renderGrid() {
  const grid = document.getElementById('file-grid');
  const listEl = document.getElementById('file-list');
  grid.style.display = 'grid';
  listEl.style.display = 'none';
  grid.innerHTML = '';

  const items = getFilteredItems();
  if (!items.length) {
    grid.innerHTML = `<div class="empty-state" style="grid-column:1/-1">
      <svg width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1">
        <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/>
      </svg>
      <p>This folder is empty</p></div>`;
    return;
  }

  items.forEach(item => {
    const div = document.createElement('div');
    div.className = 'file-item';
    div.dataset.path = item.path;
    div.dataset.isDir = item.isDirectory;

    const iconDiv = document.createElement('div');
    iconDiv.className = 'file-item-icon';
    iconDiv.innerHTML = buildIconHtml(item);
    div.appendChild(iconDiv);

    const nameDiv = document.createElement('div');
    nameDiv.className = 'file-item-name';
    nameDiv.textContent = item.name;
    div.appendChild(nameDiv);

    div.addEventListener('click', (e) => handleItemClick(e, item, div));
    div.addEventListener('dblclick', () => handleItemDblClick(item));
    div.addEventListener('contextmenu', (e) => showContextMenu(e, item));

    if (state.clipboard?.op === 'cut' && state.clipboard.items.some(ci => ci.path === item.path))
      div.classList.add('cut-item');

    grid.appendChild(div);
  });
}

function renderList() {
  const grid = document.getElementById('file-grid');
  const listEl = document.getElementById('file-list');
  const body = document.getElementById('list-body');
  grid.style.display = 'none';
  listEl.style.display = 'block';
  body.innerHTML = '';

  const items = getFilteredItems();
  if (!items.length) {
    body.innerHTML = `<div class="empty-state"><svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg><p>This folder is empty</p></div>`;
    return;
  }

  items.forEach(item => {
    const row = document.createElement('div');
    row.className = 'list-row';
    row.dataset.path = item.path;
    row.dataset.isDir = item.isDirectory;

    const smallIcon = item.isDirectory
      ? `<svg class="row-icon" width="16" height="16" viewBox="0 0 24 24" fill="${'#f59e0b'}" stroke="none"><path d="M3 7C3 5.9 3.9 5 5 5H10L12 7H19C20.1 7 21 7.9 21 9V17C21 18.1 20.1 19 19 19H5C3.9 19 3 18.1 3 17V7Z"/></svg>`
      : `<svg class="row-icon" width="14" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--text-muted)" stroke-width="1.5"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"/><polyline points="13 2 13 9 20 9"/></svg>`;

    row.innerHTML = `
      <div class="list-row-name"><span>${smallIcon}</span><span>${escHtml(item.name)}</span></div>
      <div class="list-row-size">${item.isDirectory ? '' : formatSize(item.size)}</div>
      <div class="list-row-type">${item.isDirectory ? 'Folder' : (item.ext ? item.ext.slice(1).toUpperCase() + ' File' : 'File')}</div>
      <div class="list-row-date">${item.mtime ? formatDate(item.mtime) : ''}</div>
    `;

    row.addEventListener('click', (e) => handleItemClick(e, item, row));
    row.addEventListener('dblclick', () => handleItemDblClick(item));
    row.addEventListener('contextmenu', (e) => showContextMenu(e, item));
    body.appendChild(row);
  });
}

function buildIconHtml(item) {
  if (item.isDirectory) {
    return `<div class="icon-folder"></div>`;
  }
  const ext = item.ext.replace('.', '').toLowerCase();
  if (state.iconConfig && state.iconConfig[ext]) {
    return `<img src="${state.iconConfig[ext]}" style="width:44px;height:44px;object-fit:contain;image-rendering:auto;" draggable="false">`;
  }
  const label = ext.length > 4 ? ext.slice(0, 4) : ext;
  return `<div class="ext-${ext}" style="display:flex;align-items:center;justify-content:center">
    <div class="icon-file"><span class="ext-label">${escHtml(label)}</span></div>
  </div>`;
}

let lastSelected = null;
function handleItemClick(e, item, el) {
  e.stopPropagation();
  clearSelection();
  el.classList.add('selected');
  lastSelected = item;
  showDetails(item);
  updateStatusSelection([item]);
}

async function handleItemDblClick(item) {
  if (item.isDirectory) {
    await navigateTo(item.path);
  } else {
    await api.openFile(item.path);
  }
}

function clearSelection() {
  document.querySelectorAll('.file-item.selected, .list-row.selected').forEach(el => el.classList.remove('selected'));
  lastSelected = null;
  document.getElementById('details-content').style.display = 'none';
  document.getElementById('details-empty').style.display = 'flex';
  updateStatusSelection([]);
}

async function showDetails(item) {
  document.getElementById('details-empty').style.display = 'none';
  document.getElementById('details-content').style.display = 'block';
  document.getElementById('details-icon').innerHTML = item.isDirectory
    ? `<div class="icon-folder" style="transform:scale(1.2)"></div>`
    : buildIconHtml(item);
  document.getElementById('details-name').textContent = item.name;

  const rows = [
    { label: 'Type', value: item.isDirectory ? 'Folder' : (item.ext ? item.ext.slice(1).toUpperCase() + ' File' : 'File') },
    { label: 'Size', value: item.isDirectory ? '—' : formatSize(item.size) },
    { label: 'Modified', value: item.mtime ? formatDate(item.mtime) : '—' },
    { label: 'Location', value: item.path },
  ];

  document.getElementById('details-rows').innerHTML = rows.map(r =>
    `<div class="detail-row"><div class="detail-label">${r.label}</div><div class="detail-value">${escHtml(String(r.value))}</div></div>`
  ).join('');
}

let ctxTarget = null;
function showContextMenu(e, item) {
  e.preventDefault();
  e.stopPropagation();
  ctxTarget = item;
  clearSelection();

  const el = document.querySelector(`[data-path="${CSS.escape(item.path)}"]`);
  if (el) { el.classList.add('selected'); lastSelected = item; }
  showDetails(item);

  const menu = document.getElementById('context-menu');
  menu.classList.add('visible');
  menu.style.left = Math.min(e.clientX, window.innerWidth - 200) + 'px';
  menu.style.top = Math.min(e.clientY, window.innerHeight - 250) + 'px';
}

function hideContextMenu() {
  document.getElementById('context-menu').classList.remove('visible');
}

async function loadSidebar() {
  const [quickAccess, drives] = await Promise.all([api.getQuickAccess(), api.getDrives()]);

  const qaIcons = { home: homeSvg, desktop: desktopSvg, documents: docsSvg, downloads: downSvg, pictures: picsSvg, music: musicSvg, videos: vidSvg };
  const qaList = document.getElementById('quick-access-list');
  quickAccess.forEach(place => {
    const li = document.createElement('li');
    li.dataset.path = place.path;
    li.innerHTML = `${(qaIcons[place.icon] || docsSvg)(14)} ${escHtml(place.name)}`;
    li.addEventListener('click', () => navigateTo(place.path));
    qaList.appendChild(li);
  });

  const driveList = document.getElementById('drives-list');
  drives.forEach(drive => {
    const li = document.createElement('li');
    li.dataset.path = drive.path;
    li.innerHTML = `${driveSvg(14)} ${escHtml(drive.name)}`;
    li.addEventListener('click', () => navigateTo(drive.path));
    driveList.appendChild(li);
  });
}

function updateSidebarActive(path) {
  document.querySelectorAll('.sidebar-list li').forEach(li => {
    li.classList.toggle('active', li.dataset.path === path);
  });
}

function updateStatus() {
  const items = getFilteredItems();
  const folders = items.filter(i => i.isDirectory).length;
  const files = items.filter(i => !i.isDirectory).length;
  document.getElementById('status-count').textContent =
    `${folders} folder${folders !== 1 ? 's' : ''}, ${files} file${files !== 1 ? 's' : ''}`;
}

function updateStatusSelection(selected) {
  const sel = document.getElementById('status-selection');
  if (!selected.length) { sel.textContent = ''; return; }
  sel.textContent = `${selected.length} selected` + (selected.length === 1 && !selected[0].isDirectory ? ` (${formatSize(selected[0].size)})` : '');
}

function showEmpty(msg) {
  document.getElementById('file-grid').innerHTML = `<div class="empty-state" style="grid-column:1/-1"><p>${escHtml(msg)}</p></div>`;
}

function setupSidebarResize() {
  const handle = document.getElementById('resize-handle');
  const sidebar = document.getElementById('sidebar');
  let dragging = false, startX = 0, startW = 0;
  handle.addEventListener('mousedown', e => {
    dragging = true; startX = e.clientX; startW = sidebar.offsetWidth;
    handle.classList.add('dragging');
    document.body.style.cursor = 'col-resize';
    document.body.style.userSelect = 'none';
  });
  document.addEventListener('mousemove', e => {
    if (!dragging) return;
    const w = Math.max(150, Math.min(320, startW + e.clientX - startX));
    sidebar.style.width = w + 'px';
  });
  document.addEventListener('mouseup', () => {
    dragging = false;
    handle.classList.remove('dragging');
    document.body.style.cursor = '';
    document.body.style.userSelect = '';
  });
}

function setSort(by) {
  if (state.sortBy === by) state.sortDir = state.sortDir === 'asc' ? 'desc' : 'asc';
  else { state.sortBy = by; state.sortDir = 'asc'; }
  document.querySelectorAll('.sortable').forEach(el => {
    el.classList.toggle('active', el.dataset.sort === by);
    el.querySelector('.sort-arrow').textContent = el.dataset.sort === by ? (state.sortDir === 'asc' ? '↑' : '↓') : '';
  });
  renderFiles();
}

function setView(mode) {
  state.viewMode = mode;
  document.getElementById('view-grid').classList.toggle('active', mode === 'grid');
  document.getElementById('view-list').classList.toggle('active', mode === 'list');
  renderFiles();
}

function startRename(item) {
  document.getElementById('rename-input').value = item.name;
  document.getElementById('rename-modal').style.display = 'flex';
  document.getElementById('rename-input').focus();
  document.getElementById('rename-input').select();

  document.getElementById('rename-ok').onclick = async () => {
    const newName = document.getElementById('rename-input').value.trim();
    if (!newName || newName === item.name) { closeModal('rename-modal'); return; }
    const res = await api.renameItem(item.path, newName);
    closeModal('rename-modal');
    if (res.success) refresh();
    else alert('Rename failed: ' + res.error);
  };
  document.getElementById('rename-cancel').onclick = () => closeModal('rename-modal');
}

function startNewFolder() {
  document.getElementById('newfolder-input').value = 'New Folder';
  document.getElementById('newfolder-modal').style.display = 'flex';
  document.getElementById('newfolder-input').focus();
  document.getElementById('newfolder-input').select();

  document.getElementById('newfolder-ok').onclick = async () => {
    const name = document.getElementById('newfolder-input').value.trim();
    if (!name) { closeModal('newfolder-modal'); return; }
    const tab = getActiveTab();
    const res = await api.createFolder(tab.path, name);
    closeModal('newfolder-modal');
    if (res.success) refresh();
    else alert('Failed: ' + res.error);
  };
  document.getElementById('newfolder-cancel').onclick = () => closeModal('newfolder-modal');
}

function closeModal(id) {
  document.getElementById(id).style.display = 'none';
}

function setupEventListeners() {
  document.getElementById('btn-back').addEventListener('click', goBack);
  document.getElementById('btn-forward').addEventListener('click', goForward);
  document.getElementById('btn-up').addEventListener('click', goUp);
  document.getElementById('btn-refresh').addEventListener('click', refresh);
  document.getElementById('btn-new-tab').addEventListener('click', async () => {
    const tab = getActiveTab();
    await newTab(tab ? tab.path : await api.getHome());
  });

  document.getElementById('breadcrumbs').addEventListener('click', showAddressInput);
  document.getElementById('addressbar').addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
      const path = e.target.value.trim();
      navigateTo(path);
      e.target.blur();
    }
    if (e.key === 'Escape') {
      const tab = getActiveTab();
      updateAddressBar(tab ? tab.path : '');
    }
  });
  document.getElementById('addressbar').addEventListener('blur', () => {
    const bc = document.getElementById('breadcrumbs');
    const ab = document.getElementById('addressbar');
    bc.classList.remove('hidden');
    ab.classList.remove('visible');
  });

  document.getElementById('search-input').addEventListener('input', (e) => {
    state.searchQuery = e.target.value;
    renderFiles();
    updateStatus();
  });

  document.getElementById('view-grid').addEventListener('click', () => setView('grid'));
  document.getElementById('view-list').addEventListener('click', () => setView('list'));

  document.querySelectorAll('.sortable').forEach(el => {
    el.addEventListener('click', () => setSort(el.dataset.sort));
  });

  document.getElementById('cm-open').addEventListener('click', () => {
    if (ctxTarget) handleItemDblClick(ctxTarget);
    hideContextMenu();
  });
  document.getElementById('cm-open-tab').addEventListener('click', async () => {
    if (ctxTarget && ctxTarget.isDirectory) await newTab(ctxTarget.path);
    hideContextMenu();
  });
  document.getElementById('cm-rename').addEventListener('click', () => {
    if (ctxTarget) startRename(ctxTarget);
    hideContextMenu();
  });
  document.getElementById('cm-copy').addEventListener('click', () => {
    if (ctxTarget) { state.clipboard = { items: [ctxTarget], op: 'copy' }; renderFiles(); }
    hideContextMenu();
  });
  document.getElementById('cm-delete').addEventListener('click', async () => {
    if (ctxTarget && confirm(`Delete "${ctxTarget.name}"?`)) {
      await api.deleteItem(ctxTarget.path);
      refresh();
    }
    hideContextMenu();
  });
  document.getElementById('cm-new-folder').addEventListener('click', () => {
    startNewFolder();
    hideContextMenu();
  });

  document.addEventListener('click', (e) => {
    if (!e.target.closest('.context-menu')) hideContextMenu();
  });

  document.getElementById('content-area').addEventListener('click', (e) => {
    if (!e.target.closest('.file-item') && !e.target.closest('.list-row')) clearSelection();
  });

  document.getElementById('content-area').addEventListener('contextmenu', (e) => {
    if (!e.target.closest('.file-item') && !e.target.closest('.list-row')) {
      e.preventDefault();
      ctxTarget = null;
      const menu = document.getElementById('context-menu');
      document.getElementById('cm-open').style.display = 'none';
      document.getElementById('cm-open-tab').style.display = 'none';
      document.getElementById('cm-rename').style.display = 'none';
      document.getElementById('cm-copy').style.display = 'none';
      document.getElementById('cm-delete').style.display = 'none';
      menu.classList.add('visible');
      menu.style.left = e.clientX + 'px';
      menu.style.top = e.clientY + 'px';
    } else {
      document.getElementById('cm-open').style.display = '';
      document.getElementById('cm-open-tab').style.display = '';
      document.getElementById('cm-rename').style.display = '';
      document.getElementById('cm-copy').style.display = '';
      document.getElementById('cm-delete').style.display = '';
    }
  });

  document.addEventListener('keydown', (e) => {
    if (e.target.tagName === 'INPUT') return;
    if (e.key === 'F5') { e.preventDefault(); refresh(); }
    if (e.key === 'Backspace') { e.preventDefault(); goBack(); }
    if (e.key === 'Delete' && lastSelected) {
      if (confirm(`Delete "${lastSelected.name}"?`)) {
        api.deleteItem(lastSelected.path).then(() => refresh());
      }
    }
    if (e.key === 'F2' && lastSelected) startRename(lastSelected);
    if ((e.ctrlKey || e.metaKey) && e.key === 't') { e.preventDefault(); document.getElementById('btn-new-tab').click(); }
    if ((e.ctrlKey || e.metaKey) && e.key === 'w') {
      e.preventDefault();
      const tab = getActiveTab();
      if (tab) closeTab(tab.id);
    }
    if (e.key === 'Alt' && e.key === 'ArrowLeft') goBack();
    if (e.key === 'Alt' && e.key === 'ArrowRight') goForward();
    if ((e.ctrlKey || e.metaKey) && e.key === 'v' && state.clipboard) {
      e.preventDefault();
      const tab = getActiveTab();
      const items = state.clipboard.items;
      const dest = tab.path;
      Promise.all(items.map(item => api.copyItem(item.path, dest))).then(() => {
        if (state.clipboard.op === 'cut') state.clipboard = null;
        refresh();
      });
    }
  });

  document.getElementById('rename-input').addEventListener('keydown', (e) => {
    if (e.key === 'Enter') document.getElementById('rename-ok').click();
    if (e.key === 'Escape') closeModal('rename-modal');
  });
  document.getElementById('newfolder-input').addEventListener('keydown', (e) => {
    if (e.key === 'Enter') document.getElementById('newfolder-ok').click();
    if (e.key === 'Escape') closeModal('newfolder-modal');
  });

  setupSidebarResize();
}

function escHtml(str) {
  return String(str).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
}

function formatSize(bytes) {
  if (bytes === 0) return '0 B';
  const k = 1024, sizes = ['B','KB','MB','GB','TB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(1)) + ' ' + sizes[i];
}

function formatDate(date) {
  const d = new Date(date);
  return d.toLocaleDateString(undefined, { year:'numeric', month:'short', day:'numeric' }) + ' ' +
    d.toLocaleTimeString(undefined, { hour:'2-digit', minute:'2-digit' });
}

function getBasename(path) {
  const sep = state.sep;
  const parts = path.split(sep).filter(Boolean);
  return parts[parts.length - 1] || path;
}

const closeSvg   = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2" stroke-linecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>`;
const folderSvg  = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="#f59e0b"           stroke="none"><path d="M3 7C3 5.9 3.9 5 5 5H10L12 7H19C20.1 7 21 7.9 21 9V17C21 18.1 20.1 19 19 19H5C3.9 19 3 18.1 3 17V7Z"/></svg>`;
const homeSvg    = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>`;
const desktopSvg = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>`;
const docsSvg    = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>`;
const downSvg    = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>`;
const picsSvg    = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>`;
const musicSvg   = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><path d="M9 18V5l12-2v13"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/></svg>`;
const vidSvg     = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="2.18"/><line x1="7" y1="2" x2="7" y2="22"/><line x1="17" y1="2" x2="17" y2="22"/><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="7" x2="7" y2="7"/><line x1="2" y1="17" x2="7" y2="17"/><line x1="17" y1="17" x2="22" y2="17"/><line x1="17" y1="7" x2="22" y2="7"/></svg>`;
const driveSvg   = (s) =>  `<svg width="${s}"  height="${s}" viewBox="0 0 24 24" fill="none"                stroke="currentColor" stroke-width="2"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/></svg>`;

init();