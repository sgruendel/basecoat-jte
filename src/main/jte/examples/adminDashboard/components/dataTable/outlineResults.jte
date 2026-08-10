@import com.basecoatui.jte.examples.admindashboard.models.OutlinePage
@import com.basecoatui.jte.examples.admindashboard.models.OutlineSelection
@import com.basecoatui.jte.examples.admindashboard.models.OutlineSort
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.util.JsonHelper
@import java.util.List
@import java.util.Map

@param OutlinePage page
@param OutlineSelection selection
@param String baseUrl
@param List<Item> pageSizeItems

!{
  final String pageSizeValues = JsonHelper.write(Map.of(
    "page", "0",
    "sort", page.sort().queryValue() + "," + page.direction().queryValue()
  ));
  final String togglePageValues = JsonHelper.write(Map.of("togglePage", "true"));
}

<div id="outline-results">
  @for(var selectedId : selection.offPageIds())
    <input type="hidden" name="selected" value="${selectedId}" />
  @endfor
  <div class="overflow-hidden rounded-lg border">
    <div class="table-container">
      <table class="table">
        <caption class="sr-only">
          Document outline
        </caption>
        <thead class="bg-muted sticky top-0 z-10">
          <tr>
            <th class="w-10 text-center">
              <input
                id="select-outline-page"
                type="checkbox"
                class="input"
                aria-label="Select all rows on this page"
                aria-checked="${selection.pageSelectionIndeterminate() ? "mixed" : Boolean.toString(selection.allPageRowsSelected())}"
                data-select-outline-page
                checked="${selection.allPageRowsSelected()}"
                hx-get="${baseUrl}&page=${page.page()}"
                hx-trigger="change"
                hx-vals="${togglePageValues}"
                hx-include="#outline-results [name='selected']"
                hx-target="#outline-results"
                hx-swap="outerHTML"
              />
            </th>
            @template.examples.adminDashboard.components.dataTable.sortHeader(
              page = page,
              field = OutlineSort.HEADER,
              label = "Header",
              column = "header"
            )
            @template.examples.adminDashboard.components.dataTable.sortHeader(
              page = page,
              field = OutlineSort.TYPE,
              label = "Section Type",
              column = "type"
            )
            @template.examples.adminDashboard.components.dataTable.sortHeader(
              page = page,
              field = OutlineSort.STATUS,
              label = "Status",
              column = "status"
            )
            @template.examples.adminDashboard.components.dataTable.sortHeader(
              page = page,
              field = OutlineSort.TARGET,
              label = "Target",
              column = "target",
              alignClass = "text-right"
            )
            @template.examples.adminDashboard.components.dataTable.sortHeader(
              page = page,
              field = OutlineSort.LIMIT,
              label = "Limit",
              column = "limit",
              alignClass = "text-right"
            )
            @template.examples.adminDashboard.components.dataTable.sortHeader(
              page = page,
              field = OutlineSort.REVIEWER,
              label = "Reviewer",
              column = "reviewer"
            )
          </tr>
        </thead>
        <tbody>
          @if(page.rows().isEmpty())
            <tr>
              <td colspan="7" class="h-24 text-center">No results.</td>
            </tr>
          @else
            @for(var row : page.rows())
              <tr>
                <td class="text-center">
                  <input
                    type="checkbox"
                    class="input"
                    aria-label="Select ${row.header()}"
                    name="selected"
                    value="${row.id()}"
                    checked="${selection.isSelected(row.id())}"
                    hx-get="${baseUrl}&page=${page.page()}"
                    hx-trigger="change"
                    hx-include="#outline-results [name='selected']"
                    hx-target="#outline-results"
                    hx-swap="outerHTML"
                  />
                </td>
                <td data-column="header">
                  <button
                    type="button"
                    class="btn h-auto justify-start px-0 text-left"
                    data-variant="link"
                    hx-get="/examples/admin-dashboard/outlines/${row.id()}"
                    hx-target="#row-details"
                    hx-swap="innerHTML"
                  >
                    ${row.header()}
                  </button>
                </td>
                <td data-column="type">
                  <span class="badge whitespace-nowrap" data-variant="outline">${row.type()}</span>
                </td>
                <td data-column="status">
                  <span class="badge whitespace-nowrap" data-variant="outline">
                    @if(row.status().equals("Done"))
                      @template.lucide.circleCheckBig(
                        attrs = Map.of("class", "size-3.5 fill-green-500 text-white dark:fill-green-400")
                      )
                    @else
                      @template.lucide.loader(attrs = Map.of("class", "size-3.5 animate-spin"))
                    @endif
                    ${row.status()}
                  </span>
                </td>
                <td data-column="target" class="text-right">${row.target()}</td>
                <td data-column="limit" class="text-right">${row.limit()}</td>
                <td data-column="reviewer">${row.reviewer()}</td>
              </tr>
            @endfor
          @endif
        </tbody>
      </table>
    </div>
  </div>

  <div class="mt-4 flex flex-col gap-4 px-2 lg:flex-row lg:items-center">
    <div class="text-muted-foreground hidden flex-1 text-sm lg:block">
      ${selection.count()} of ${page.totalElements()} row(s) selected.
    </div>
    <div class="flex flex-wrap items-center gap-4 lg:gap-8">
      <div class="hidden items-center gap-2 lg:flex">
        <span id="rows-per-page-label" class="text-sm font-medium">Rows per page</span>
        @template.basecoat.select(
          id = "rows-per-page",
          name = "size",
          selected = Integer.toString(page.size()),
          items = pageSizeItems,
          mainAttrs = Map.of(
            "class", "w-20",
            "hx-get", "/examples/admin-dashboard/outlines",
            "hx-trigger", "change",
            "hx-include", "#rows-per-page input, #outline-results [name='selected']",
            "hx-vals", pageSizeValues,
            "hx-target", "#outline-results",
            "hx-swap", "outerHTML"
          ),
          triggerAttrs = Map.of("class", "h-8 w-20", "aria-labelledby", "rows-per-page-label rows-per-page-trigger"),
          popoverAttrs = Map.of("data-side", "top")
        )
      </div>
      <div class="text-sm font-medium">Page ${page.page() + 1} of ${page.totalPages()}</div>
      <nav class="ml-auto flex items-center gap-2" aria-label="Outline pagination">
        @if(page.hasPrevious())
          <button
            type="button"
            class="btn hidden lg:flex"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to first page"
            hx-get="${baseUrl}&page=0"
            hx-include="#outline-results [name='selected']"
            hx-target="#outline-results"
            hx-swap="outerHTML"
          >
            @template.lucide.chevronFirst()
          </button>
          <button
            type="button"
            class="btn"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to previous page"
            hx-get="${baseUrl}&page=${page.page() - 1}"
            hx-include="#outline-results [name='selected']"
            hx-target="#outline-results"
            hx-swap="outerHTML"
          >
            @template.lucide.chevronLeft()
          </button>
        @else
          <button
            type="button"
            class="btn hidden lg:flex"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to first page"
            disabled
          >
            @template.lucide.chevronFirst()
          </button>
          <button
            type="button"
            class="btn"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to previous page"
            disabled
          >
            @template.lucide.chevronLeft()
          </button>
        @endif


        @if(page.hasNext())
          <button
            type="button"
            class="btn"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to next page"
            hx-get="${baseUrl}&page=${page.page() + 1}"
            hx-include="#outline-results [name='selected']"
            hx-target="#outline-results"
            hx-swap="outerHTML"
          >
            @template.lucide.chevronRight()
          </button>
          <button
            type="button"
            class="btn hidden lg:flex"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to last page"
            hx-get="${baseUrl}&page=${page.totalPages() - 1}"
            hx-include="#outline-results [name='selected']"
            hx-target="#outline-results"
            hx-swap="outerHTML"
          >
            @template.lucide.chevronLast()
          </button>
        @else
          <button
            type="button"
            class="btn"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to next page"
            disabled
          >
            @template.lucide.chevronRight()
          </button>
          <button
            type="button"
            class="btn hidden lg:flex"
            data-variant="outline"
            data-size="icon-sm"
            aria-label="Go to last page"
            disabled
          >
            @template.lucide.chevronLast()
          </button>
        @endif
      </nav>
    </div>
  </div>
</div>
