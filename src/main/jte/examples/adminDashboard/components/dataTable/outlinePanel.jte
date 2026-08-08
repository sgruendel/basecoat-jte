@import java.util.List
@import java.util.Map
@import com.basecoatui.jte.util.BasecoatSelect.Item

@param List<Item> pageSizeItems

<div class="overflow-hidden rounded-lg border">
  <div class="table-container">
    <table class="table">
      <caption class="sr-only">
        Document outline
      </caption>
      <thead id="table-head"></thead>
      <tbody id="table-body"></tbody>
    </table>
  </div>
</div>
<div class="mt-4 flex flex-col gap-4 px-2 lg:flex-row lg:items-center">
  <div id="selection-summary" class="text-muted-foreground hidden flex-1 text-sm lg:block">
    0 of 68 row(s) selected.
  </div>
  <div class="flex flex-wrap items-center gap-4 lg:gap-8">
    <div class="hidden items-center gap-2 lg:flex">
      <span id="rows-per-page-label" class="text-sm font-medium">Rows per page</span>
      @template.basecoat.select(
        id = "rows-per-page",
        selected = pageSizeItems.getFirst().value(),
        items = pageSizeItems,
        mainAttrs = Map.of("class", "w-20"),
        triggerAttrs = Map.of("class", "h-8 w-20", "aria-labelledby", "rows-per-page-label rows-per-page-trigger"),
        popoverAttrs = Map.of("data-side", "top")
      )
    </div>
    <div id="page-summary" class="text-sm font-medium">Page 1 of 7</div>
    <div class="ml-auto flex items-center gap-2">
      <button
        id="first-page"
        type="button"
        class="btn hidden lg:flex"
        data-variant="outline"
        data-size="icon-sm"
        aria-label="Go to first page"
      >
        «
      </button>
      <button
        id="previous-page"
        type="button"
        class="btn"
        data-variant="outline"
        data-size="icon-sm"
        aria-label="Go to previous page"
      >
        ‹
      </button>
      <button
        id="next-page"
        type="button"
        class="btn"
        data-variant="outline"
        data-size="icon-sm"
        aria-label="Go to next page"
      >
        ›
      </button>
      <button
        id="last-page"
        type="button"
        class="btn hidden lg:flex"
        data-variant="outline"
        data-size="icon-sm"
        aria-label="Go to last page"
      >
        »
      </button>
    </div>
  </div>
</div>
