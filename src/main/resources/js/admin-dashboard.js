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

document.addEventListener("DOMContentLoaded", renderVisitorsChart, { once: true });

document.body.addEventListener("htmx:beforeSwap", (event) => {
  event.target.querySelector?.("#visitors-chart")?._destroy?.();
});

document.body.addEventListener("htmx:afterSwap", (event) => {
  if (event.target.querySelector?.("#visitors-chart")) {
    requestAnimationFrame(renderVisitorsChart);
  }
});
