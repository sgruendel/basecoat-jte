@import io.github.sgruendel.basecoat.jte.BasecoatItem.Option
@import io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.models.OutlinePage
@import io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.models.OutlineSelection

@import java.util.List

@param OutlinePage page
@param OutlineSelection selection
@param String baseUrl
@param List<Option> pageSizeItems

<div class="flex flex-col gap-4 overflow-auto">
  @template.examples.adminDashboard.components.dataTable.outlineResults(
    page = page,
    selection = selection,
    baseUrl = baseUrl,
    pageSizeItems = pageSizeItems
  )
</div>
