const [rows, visitorData] = await Promise.all([
  fs.readFile(path.join(exampleDirectory, "data.json"), "utf8").then(JSON.parse),
  fs.readFile(path.join(exampleDirectory, "chart-data.json"), "utf8").then(JSON.parse)
]);

const rows = {{ rowsJson | safe }};
const visitorData = {{ visitorDataJson | safe }};

const detailData = [
  { month: "January", desktop: 186, mobile: 80 },
  { month: "February", desktop: 305, mobile: 200 },
  { month: "March", desktop: 237, mobile: 120 },
  { month: "April", desktop: 73, mobile: 190 },
  { month: "May", desktop: 209, mobile: 130 },
  { month: "June", desktop: 214, mobile: 140 }
];

const state = {
  page: 0,
  pageSize: 10,
  selected: new Set(),
  visible: { type: true, status: true, target: true, limit: true, reviewer: true },
  range: window.matchMedia("(max-width: 767px)").matches ? "7d" : "90d",
  draggedId: null,
  visitorsChart: null,
  detailChart: null
};

const escapeHtml = (value) =>
  String(value).replace(
    /[&<>'"]/g,
    (character) =>
      ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", "'": "&#39;", '"': "&quot;" })[character]
  );
const pageCount = () => Math.max(1, Math.ceil(rows.length / state.pageSize));
const currentRows = () =>
  rows.slice(state.page * state.pageSize, (state.page + 1) * state.pageSize);
const reviewerOptions = (selected) =>
  ["Assign reviewer", "Eddie Lake", "Jamik Tashpulatov"]
    .map((name) => `<option${name === selected ? " selected" : ""}>${escapeHtml(name)}</option>`)
    .join("");
const statusIcon = (done) =>
  done
    ? `<svg class="status-icon" data-done="true" viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="m8 12 3 3 5-6" fill="none" stroke="white" stroke-width="2"/></svg>`
    : `<svg class="status-icon animate-spin" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M21 12a9 9 0 1 1-6.2-8.6"/></svg>`;

function notify(title, description) {
  const toaster = document.getElementById("toaster");
  if (typeof toaster.toast === "function") toaster.toast({ title, description });
}

function renderTable() {
  if (state.page >= pageCount()) state.page = pageCount() - 1;
  const visibleRows = currentRows();
  const allPageSelected =
    visibleRows.length > 0 && visibleRows.every((row) => state.selected.has(row.id));
  const somePageSelected = visibleRows.some((row) => state.selected.has(row.id));
  document.getElementById("table-head").innerHTML = `<tr>
    <th class="w-8"><span class="sr-only">Reorder</span></th>
    <th class="w-10 text-center"><input id="select-page" type="checkbox" aria-label="Select all rows on this page" ${allPageSelected ? "checked" : ""}></th>
    <th>Header</th>${state.visible.type ? "<th>Section Type</th>" : ""}${state.visible.status ? "<th>Status</th>" : ""}${state.visible.target ? '<th class="text-right">Target</th>' : ""}${state.visible.limit ? '<th class="text-right">Limit</th>' : ""}${state.visible.reviewer ? "<th>Reviewer</th>" : ""}<th><span class="sr-only">Actions</span></th>
  </tr>`;
  const selectPage = document.getElementById("select-page");
  selectPage.indeterminate = somePageSelected && !allPageSelected;
  selectPage.addEventListener("change", (event) => {
    visibleRows.forEach((row) =>
      event.target.checked ? state.selected.add(row.id) : state.selected.delete(row.id)
    );
    renderTable();
  });

  document.getElementById("table-body").innerHTML = visibleRows
    .map(
      (row) => `<tr draggable="true" data-row-id="${row.id}">
    <td><button type="button" class="btn cursor-grab" data-variant="ghost" data-size="icon-sm" data-drag-handle="${row.id}" aria-label="Drag to reorder ${escapeHtml(row.header)}">⋮⋮</button></td>
    <td class="text-center"><input type="checkbox" data-select-row="${row.id}" aria-label="Select ${escapeHtml(row.header)}" ${state.selected.has(row.id) ? "checked" : ""}></td>
    <td><button type="button" class="btn h-auto justify-start px-0 text-left" data-variant="link" data-open-row="${row.id}">${escapeHtml(row.header)}</button></td>
    ${state.visible.type ? `<td><span class="badge whitespace-nowrap" data-variant="outline">${escapeHtml(row.type)}</span></td>` : ""}
    ${state.visible.status ? `<td><span class="badge whitespace-nowrap" data-variant="outline">${statusIcon(row.status === "Done")}${escapeHtml(row.status)}</span></td>` : ""}
    ${state.visible.target ? `<td><form data-inline-form="${row.id}" data-field="target"><label class="sr-only" for="target-${row.id}">Target for ${escapeHtml(row.header)}</label><input id="target-${row.id}" class="input ml-auto h-8 w-16 border-transparent bg-transparent text-right shadow-none" value="${escapeHtml(row.target)}"></form></td>` : ""}
    ${state.visible.limit ? `<td><form data-inline-form="${row.id}" data-field="limit"><label class="sr-only" for="limit-${row.id}">Limit for ${escapeHtml(row.header)}</label><input id="limit-${row.id}" class="input ml-auto h-8 w-16 border-transparent bg-transparent text-right shadow-none" value="${escapeHtml(row.limit)}"></form></td>` : ""}
    ${state.visible.reviewer ? `<td>${row.reviewer === "Assign reviewer" ? `<label class="sr-only" for="reviewer-${row.id}">Reviewer for ${escapeHtml(row.header)}</label><select id="reviewer-${row.id}" class="select h-8 w-40" data-size="sm" data-reviewer="${row.id}">${reviewerOptions(row.reviewer)}</select>` : escapeHtml(row.reviewer)}</td>` : ""}
    <td><div class="dropdown-menu"><button type="button" id="row-actions-${row.id}-trigger" aria-haspopup="menu" aria-controls="row-actions-${row.id}-menu" aria-expanded="false" class="btn" data-variant="ghost" data-size="icon-sm" aria-label="Open menu for ${escapeHtml(row.header)}">•••</button><div data-popover aria-hidden="true" data-align="end" class="w-32"><div role="menu" id="row-actions-${row.id}-menu" aria-labelledby="row-actions-${row.id}-trigger"><div role="menuitem" data-open-row="${row.id}">Edit</div><div role="menuitem">Make a copy</div><div role="menuitem">Favorite</div><hr role="separator"><div role="menuitem" data-variant="destructive">Delete</div></div></div></div></td>
  </tr>`
    )
    .join("");

  document.getElementById("selection-summary").textContent =
    `${state.selected.size} of ${rows.length} row(s) selected.`;
  document.getElementById("page-summary").textContent = `Page ${state.page + 1} of ${pageCount()}`;
  document.getElementById("first-page").disabled = state.page === 0;
  document.getElementById("previous-page").disabled = state.page === 0;
  document.getElementById("next-page").disabled = state.page >= pageCount() - 1;
  document.getElementById("last-page").disabled = state.page >= pageCount() - 1;
  bindTableEvents();
  window.basecoat?.initAll?.();
}

function bindTableEvents() {
  document.querySelectorAll("[data-select-row]").forEach((input) =>
    input.addEventListener("change", (event) => {
      const id = Number(event.currentTarget.dataset.selectRow);
      event.currentTarget.checked ? state.selected.add(id) : state.selected.delete(id);
      renderTable();
    })
  );
  document
    .querySelectorAll("[data-open-row]")
    .forEach((control) =>
      control.addEventListener("click", () => openDetails(Number(control.dataset.openRow)))
    );
  document.querySelectorAll("[data-reviewer]").forEach((select) =>
    select.addEventListener("change", (event) => {
      rows.find((row) => row.id === Number(event.currentTarget.dataset.reviewer)).reviewer =
        event.currentTarget.value;
      notify("Reviewer assigned", event.currentTarget.value);
      renderTable();
    })
  );
  document.querySelectorAll("[data-inline-form]").forEach((form) =>
    form.addEventListener("submit", (event) => {
      event.preventDefault();
      const row = rows.find((item) => item.id === Number(form.dataset.inlineForm));
      row[form.dataset.field] = form.querySelector("input").value;
      notify(`Saving ${row.header}`, "Done");
    })
  );
  document.querySelectorAll("[data-drag-handle]").forEach((handle) =>
    handle.addEventListener("keydown", (event) => {
      if (!event.altKey || !["ArrowUp", "ArrowDown"].includes(event.key)) return;
      event.preventDefault();
      const id = Number(handle.dataset.dragHandle);
      const from = rows.findIndex((row) => row.id === id);
      const to = Math.max(0, Math.min(rows.length - 1, from + (event.key === "ArrowUp" ? -1 : 1)));
      if (from !== to) {
        rows.splice(to, 0, rows.splice(from, 1)[0]);
        renderTable();
        requestAnimationFrame(() => document.querySelector(`[data-drag-handle="${id}"]`)?.focus());
      }
    })
  );
  document.querySelectorAll("#table-body tr").forEach((tableRow) => {
    tableRow.addEventListener("dragstart", (event) => {
      state.draggedId = Number(tableRow.dataset.rowId);
      tableRow.classList.add("table-row-dragging");
      event.dataTransfer.effectAllowed = "move";
    });
    tableRow.addEventListener("dragend", () => {
      state.draggedId = null;
      tableRow.classList.remove("table-row-dragging");
      document
        .querySelectorAll(".table-row-drop")
        .forEach((row) => row.classList.remove("table-row-drop"));
    });
    tableRow.addEventListener("dragover", (event) => {
      event.preventDefault();
      tableRow.classList.add("table-row-drop");
      event.dataTransfer.dropEffect = "move";
    });
    tableRow.addEventListener("dragleave", () => tableRow.classList.remove("table-row-drop"));
    tableRow.addEventListener("drop", (event) => {
      event.preventDefault();
      const targetId = Number(tableRow.dataset.rowId);
      if (state.draggedId && state.draggedId !== targetId) {
        const from = rows.findIndex((row) => row.id === state.draggedId);
        const to = rows.findIndex((row) => row.id === targetId);
        rows.splice(to, 0, rows.splice(from, 1)[0]);
        renderTable();
      }
    });
  });
}

function setView(view) {
  const tab = document.querySelector(`#document-tabs [role="tab"][data-view="${view}"]`);
  if (tab?.getAttribute("aria-selected") !== "true") tab?.click();
  const viewSelect = document.getElementById("view-selector");
  if (viewSelect?.value !== view) viewSelect.value = view;
}

function chartRows(range) {
  const days = range === "7d" ? 7 : range === "30d" ? 30 : 90;
  const reference = new Date("2024-06-30T00:00:00");
  const start = new Date(reference);
  start.setDate(start.getDate() - days);
  return visitorData.filter((row) => new Date(`${row.date}T00:00:00`) >= start);
}

function setRange(range) {
  state.range = range;
  document
    .querySelectorAll("[data-range]")
    .forEach((button) =>
      button.setAttribute("aria-pressed", String(button.dataset.range === range))
    );
  const rangeSelect = document.getElementById("chart-range");
  if (rangeSelect?.value !== range) rangeSelect.value = range;
  document.getElementById("visitors-description").textContent =
    range === "90d"
      ? "Total for the last 3 months"
      : range === "30d"
        ? "Total for the last 30 days"
        : "Total for the last 7 days";
  const data = chartRows(range);
  if (state.visitorsChart) {
    state.visitorsChart.data.labels = data.map((row) => row.date);
    state.visitorsChart.data.datasets[0].data = data.map((row) => row.mobile);
    state.visitorsChart.data.datasets[1].data = data.map((row) => row.desktop);
    state.visitorsChart.update();
  }
}

function initializeCharts() {
  const data = chartRows(state.range);
  state.visitorsChart = window.basecoat.chart("#visitors-chart", {
    type: "line",
    labelKey: "date",
    data,
    series: {
      mobile: {
        label: "Mobile",
        color: "var(--chart-2)",
        surface: "gradient",
        dataset: { fill: true, tension: 0.35, pointRadius: 0, stack: "visitors" }
      },
      desktop: {
        label: "Desktop",
        color: "var(--chart-1)",
        surface: "gradient",
        dataset: { fill: true, tension: 0.35, pointRadius: 0, stack: "visitors" }
      }
    },
    options: {
      maintainAspectRatio: false,
      interaction: { mode: "index", intersect: false },
      scales: {
        x: { stacked: true, ticks: { maxTicksLimit: 7 } },
        y: { stacked: true, beginAtZero: true }
      }
    }
  });
  state.detailChart = window.basecoat.chart("#detail-chart", {
    type: "line",
    labelKey: "month",
    data: detailData,
    series: {
      mobile: {
        label: "Mobile",
        color: "var(--chart-2)",
        surface: "gradient",
        dataset: { fill: true, tension: 0.35, pointRadius: 0, stack: "visitors" }
      },
      desktop: {
        label: "Desktop",
        color: "var(--chart-1)",
        surface: "gradient",
        dataset: { fill: true, tension: 0.35, pointRadius: 0, stack: "visitors" }
      }
    },
    options: {
      maintainAspectRatio: false,
      scales: { x: { display: false, stacked: true }, y: { display: false, stacked: true } }
    }
  });
}

function openDetails(id) {
  const row = rows.find((item) => item.id === id);
  if (!row) return;
  document.getElementById("detail-id").value = row.id;
  document.getElementById("row-details-title").textContent = row.header;
  document.getElementById("detail-header").value = row.header;
  document.getElementById("detail-type").value = row.type;
  document.getElementById("detail-status").value = row.status;
  document.getElementById("detail-target").value = row.target;
  document.getElementById("detail-limit").value = row.limit;
  document.getElementById("detail-reviewer").value = row.reviewer;
  const dialog = document.getElementById("row-details");
  const mobile = window.matchMedia("(max-width: 767px)").matches;
  dialog.dataset.side = mobile ? "bottom" : "right";
  document.getElementById("detail-chart-section").hidden = mobile;
  dialog.showModal();
  requestAnimationFrame(() => state.detailChart?.resize());
}

document.addEventListener("DOMContentLoaded", () => {
  const sidebar = document.getElementById("dashboard-sidebar");
  const sidebarMedia = window.matchMedia("(max-width: 767px)");
  const syncSidebar = (event) => sidebar.setAttribute("aria-hidden", String(event.matches));
  syncSidebar(sidebarMedia);
  sidebarMedia.addEventListener("change", syncSidebar);

  renderTable();
  setRange(state.range);
  initializeCharts();

  document
    .querySelectorAll("[data-range]")
    .forEach((button) => button.addEventListener("click", () => setRange(button.dataset.range)));
  document
    .getElementById("chart-range")
    .addEventListener("change", (event) => setRange(event.detail.value));
  document
    .getElementById("view-selector")
    .addEventListener("change", (event) => setView(event.detail.value));
  document.querySelectorAll("#document-tabs [role=tab]").forEach((tab) =>
    tab.addEventListener("click", () => {
      const viewSelect = document.getElementById("view-selector");
      if (viewSelect.value !== tab.dataset.view) viewSelect.value = tab.dataset.view;
    })
  );
  document.querySelectorAll("[data-column-toggle]").forEach((item) =>
    item.addEventListener("click", (event) => {
      const column = event.currentTarget.dataset.columnToggle;
      state.visible[column] = !state.visible[column];
      event.currentTarget.setAttribute("aria-checked", String(state.visible[column]));
      renderTable();
    })
  );
  document.getElementById("rows-per-page").addEventListener("change", (event) => {
    state.pageSize = Number(event.detail.value);
    state.page = 0;
    renderTable();
  });
  document.getElementById("first-page").addEventListener("click", () => {
    state.page = 0;
    renderTable();
  });
  document.getElementById("previous-page").addEventListener("click", () => {
    state.page = Math.max(0, state.page - 1);
    renderTable();
  });
  document.getElementById("next-page").addEventListener("click", () => {
    state.page = Math.min(pageCount() - 1, state.page + 1);
    renderTable();
  });
  document.getElementById("last-page").addEventListener("click", () => {
    state.page = pageCount() - 1;
    renderTable();
  });
  document.getElementById("detail-form").addEventListener("submit", (event) => {
    event.preventDefault();
    const row = rows.find((item) => item.id === Number(document.getElementById("detail-id").value));
    Object.assign(row, {
      header: document.getElementById("detail-header").value,
      type: document.getElementById("detail-type").value,
      status: document.getElementById("detail-status").value,
      target: document.getElementById("detail-target").value,
      limit: document.getElementById("detail-limit").value,
      reviewer: document.getElementById("detail-reviewer").value
    });
    document.getElementById("row-details-title").textContent = row.header;
    notify("Document updated", row.header);
    renderTable();
  });
});
