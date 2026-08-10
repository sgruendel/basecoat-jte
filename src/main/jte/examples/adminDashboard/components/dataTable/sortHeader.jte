@import com.basecoatui.jte.examples.admindashboard.models.OutlinePage
@import com.basecoatui.jte.examples.admindashboard.models.OutlineSort
@import com.basecoatui.jte.examples.admindashboard.models.SortDirection
@import java.util.Map

@param OutlinePage page
@param OutlineSort field
@param String label
@param String column
@param String alignClass = ""

!{
  final boolean active = page.sort() == field;
  final SortDirection nextDirection = active ? page.direction().reverse() : SortDirection.ASC;
  final String url = "/examples/admin-dashboard/outlines?page=0&size=" + page.size()
    + "&sort=" + field.queryValue() + "," + nextDirection.queryValue();
}

<th
  data-column="${column}"
  class="${alignClass}"
  aria-sort="${active ? (page.direction() == SortDirection.ASC ? "ascending" : "descending") : "none"}"
>
  <button
    type="button"
    class="btn justify-${alignClass.equals("text-right") ? "end" : "start"} h-auto w-full px-0 font-medium"
    data-variant="ghost"
    hx-get="${url}"
    hx-include="#outline-results [name='selected']"
    hx-target="#outline-results"
    hx-swap="outerHTML"
  >
    ${label}
    @if(active && page.direction() == SortDirection.ASC)
      @template.lucide.arrowUp(attrs = Map.of("class", "size-3.5", "aria-hidden", "true"))
    @elseif(active)
      @template.lucide.arrowDown(attrs = Map.of("class", "size-3.5", "aria-hidden", "true"))
    @else
      @template.lucide.arrowUpDown(attrs = Map.of("class", "text-muted-foreground size-3.5", "aria-hidden", "true"))
    @endif
  </button>
</th>
