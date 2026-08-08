@import gg.jte.support.ForSupport
@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.util.JsonHelper

@param List<Map<String, Object>> data = null
@param String range = "90d"
<%-- TODO derive default value from enum, also check Controller for default value --%>

!{
  // TODO add Java enum for this, inject values as model attribute, and use that in the template to generate the buttons
  final List<Item> rangeItems = List.of(
    Item.of("Last 3 months", "90d"),
    Item.of("Last 30 days", "30d"),
    Item.of("Last 7 days", "7d")
  );
  final String description = switch (range) {
    case "7d" -> "Total for the last 7 days";
    case "30d" -> "Total for the last 30 days";
    default -> "Total for the last 3 months";
  };
  final List<String> skeletonBarHeights = List.of(
    "h-[45%]", "h-[62%]", "h-[38%]", "h-[74%]", "h-[55%]", "h-[82%]", "h-[48%]",
    "h-[66%]", "h-[35%]", "h-[70%]", "h-[58%]", "h-[88%]", "h-[42%]", "h-[60%]"
  );
}

<section class="px-4 lg:px-6" id="chart-area-section" aria-labelledby="visitors-title">
  <article class="card">
    <header class="gap-1 sm:flex-row sm:items-start">
      <h2 id="visitors-title">Total Visitors</h2>
      <p id="visitors-description">${description}</p>
      <div class="card-action">
        <div class="range-group hidden rounded-md border md:flex" role="group" aria-label="Chart date range">
          @for(var itemLoop : ForSupport.of(rangeItems))
            <button
              type="button"
              class="btn rounded-none border-0"
              data-variant="ghost"
              data-size="sm"
              data-range="${itemLoop.get().value()}"
              aria-pressed="${Boolean.toString(itemLoop.get().value().equals(range))}"
              hx-get="/examples/admin-dashboard/chart-area-interactive"
              hx-vals='{"range": "${itemLoop.get().value()}"}'
              hx-target="#chart-area-section"
              hx-swap="outerHTML"
            >
              ${itemLoop.get().label()}
            </button>
          @endfor
        </div>
        <span class="sr-only" id="chart-range-label">Chart date range</span>
        @template.basecoat.select(
          id = "chart-range",
          name = "range",
          selected = range,
          mainAttrs = Map.of(
            "class",
            "w-40 md:hidden",
            "hx-get",
            "/examples/admin-dashboard/chart-area-interactive",
            "hx-trigger",
            "change",
            "hx-include",
            "#chart-range input",
            "hx-target",
            "#chart-area-section",
            "hx-swap",
            "outerHTML"
          ),
          triggerAttrs = Map.of("class", "w-40", "aria-labelledby", "chart-range-label chart-range-trigger"),
          popoverAttrs = Map.of("data-align", "end"),
          items = rangeItems
        )
      </div>
    </header>
    <section class="px-2 pt-4 sm:px-6 sm:pt-6">
      <div class="chart-box">
        @if(data == null)
          <div
            class="flex aspect-video items-end gap-1 sm:gap-2"
            role="status"
            aria-label="Loading chart"
            hx-trigger="load delay:1000ms"
            hx-get="/examples/admin-dashboard/chart-area-interactive"
            hx-vals='{"range": "${range}"}'
            hx-target="#chart-area-section"
            hx-swap="outerHTML"
          >
            @for(var barLoop : ForSupport.of(skeletonBarHeights))
              <div class="bg-accent ${barLoop.get()} flex-1 animate-pulse rounded-t-md">&nbsp;</div>
            @endfor
          </div>
        @else
          <canvas
            id="visitors-chart"
            data-chart-data="${JsonHelper.write(data)}"
            aria-label="Desktop and mobile visitors over time"
          ></canvas>
        @endif
      </div>
    </section>
  </article>
</section>
