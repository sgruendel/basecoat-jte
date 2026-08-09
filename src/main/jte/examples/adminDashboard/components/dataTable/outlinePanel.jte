@import java.util.List
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.examples.admindashboard.models.OutlinePage

@param OutlinePage page
@param List<Item> pageSizeItems

<div class="flex flex-col gap-4 overflow-auto">
  @template.examples.adminDashboard.components.dataTable.outlineResults(
    page = page,
    pageSizeItems = pageSizeItems
  )
</div>
