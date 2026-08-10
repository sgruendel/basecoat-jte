import { chart } from "../static/js/chart.js";

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
    labelKey: "date",
  });
};

const syncOutlinePageSelection = (root = document) => {
  const selectPage = root.querySelector?.("[data-select-outline-page]");
  if (selectPage) {
    selectPage.indeterminate = selectPage.getAttribute("aria-checked") === "mixed";
  }
};

document.addEventListener(
  "DOMContentLoaded",
  () => {
    renderVisitorsChart();
    syncOutlinePageSelection();
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
    syncOutlinePageSelection(event.target);
  }
  if (event.target.id === "row-details") {
    event.target.dataset.side = window.matchMedia("(max-width: 767px)").matches ? "bottom" : "right";
    requestAnimationFrame(() => {
      renderDetailChart();
      event.target.showModal();
    });
  }
});
