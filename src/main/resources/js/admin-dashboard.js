import { chart } from "../static/js/chart.js";

const selectedOutlineRows = new Set();
const visibleOutlineColumns = new Set(["type", "status", "target", "limit", "reviewer"]);

const renderVisitorsChart = () => {
  const visitorsChart = document.querySelector("#visitors-chart");
  if (!visitorsChart) return;

  chart(visitorsChart, {
    type: "bar",
    labelKey: "date",
    series: {
      desktop: { label: "Desktop", color: "var(--chart-1)" },
      mobile: { label: "Mobile", color: "var(--chart-2)" },
    },
  });
};

const renderDetailChart = () => {
  const detailChart = document.querySelector("#detail-chart");
  if (!detailChart) return;

  chart(detailChart, {
    type: "line",
    labelKey: "month",
  });
};

const syncOutlineTable = () => {
  const results = document.querySelector("#outline-results");
  if (!results) return;

  const rowCheckboxes = [...results.querySelectorAll("[data-select-outline-row]")];
  rowCheckboxes.forEach((checkbox) => {
    checkbox.checked = selectedOutlineRows.has(Number(checkbox.dataset.selectOutlineRow));
  });

  const selectPage = results.querySelector("[data-select-outline-page]");
  if (selectPage) {
    const selectedOnPage = rowCheckboxes.filter((checkbox) => checkbox.checked).length;
    selectPage.checked = rowCheckboxes.length > 0 && selectedOnPage === rowCheckboxes.length;
    selectPage.indeterminate = selectedOnPage > 0 && selectedOnPage < rowCheckboxes.length;
  }

  const summary = results.querySelector("[data-selection-summary]");
  if (summary) {
    summary.textContent = `${selectedOutlineRows.size} of ${results.dataset.totalElements} row(s) selected.`;
  }

  document.querySelectorAll("[data-column-toggle]").forEach((toggle) => {
    const visible = visibleOutlineColumns.has(toggle.dataset.columnToggle);
    toggle.setAttribute("aria-checked", String(visible));
  });

  results.querySelectorAll("[data-column]").forEach((cell) => {
    const column = cell.dataset.column;
    cell.hidden = column !== "header" && !visibleOutlineColumns.has(column);
  });
};

const toggleOutlineColumn = (toggle) => {
  const column = toggle.dataset.columnToggle;
  if (!column) return;
  if (visibleOutlineColumns.has(column)) {
    visibleOutlineColumns.delete(column);
  } else {
    visibleOutlineColumns.add(column);
  }
  syncOutlineTable();
};

document.addEventListener("change", (event) => {
  const rowCheckbox = event.target.closest?.("[data-select-outline-row]");
  if (rowCheckbox) {
    const id = Number(rowCheckbox.dataset.selectOutlineRow);
    rowCheckbox.checked ? selectedOutlineRows.add(id) : selectedOutlineRows.delete(id);
    syncOutlineTable();
    return;
  }

  if (event.target.matches?.("[data-select-outline-page]")) {
    document.querySelectorAll("[data-select-outline-row]").forEach((checkbox) => {
      const id = Number(checkbox.dataset.selectOutlineRow);
      event.target.checked ? selectedOutlineRows.add(id) : selectedOutlineRows.delete(id);
    });
    syncOutlineTable();
  }
});

document.addEventListener("click", (event) => {
  const toggle = event.target.closest?.("[data-column-toggle]");
  if (toggle) toggleOutlineColumn(toggle);
});

document.addEventListener(
  "DOMContentLoaded",
  () => {
    renderVisitorsChart();
    syncOutlineTable();
  },
  { once: true },
);

document.body.addEventListener("htmx:beforeSwap", (event) => {
  event.target.querySelector?.("#visitors-chart")?._destroy?.();
  if (event.target.id === "row-details") {
    event.target.querySelector?.("#detail-chart")?._destroy?.();
  }
});

document.body.addEventListener("htmx:afterSwap", (event) => {
  if (event.target.querySelector?.("#visitors-chart")) {
    requestAnimationFrame(renderVisitorsChart);
  }
  if (event.target.id === "outline-results") {
    syncOutlineTable();
  }
  if (event.target.id === "row-details") {
    event.target.dataset.side = window.matchMedia("(max-width: 767px)").matches ? "bottom" : "right";
    requestAnimationFrame(() => {
      window.basecoat?.initAll?.();
      renderDetailChart();
      event.target.showModal();
    });
  }
});
