@import com.basecoatui.jte.examples.models.User
@import com.basecoatui.jte.examples.admindashboard.models.OutlinePage
@import com.basecoatui.jte.examples.admindashboard.models.OutlineSelection
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import java.util.List

@param User user
@param OutlinePage outlinePage
@param OutlineSelection selection
@param String baseUrl
@param List<Item> pageSizeItems

@template.examples.layout(
  pageTitle = "Admin Dashboard",
  content=@`@template.examples.adminDashboard.page(
    user = user,
    outlinePage = outlinePage,
    selection = selection,
    baseUrl = baseUrl,
    pageSizeItems = pageSizeItems
  )`
)
