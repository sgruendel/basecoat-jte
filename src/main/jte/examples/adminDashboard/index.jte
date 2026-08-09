@import com.basecoatui.jte.examples.models.User
@import com.basecoatui.jte.examples.models.OutlinePage

@param User user
@param OutlinePage outlinePage

@template.examples.layout(
  pageTitle = "Admin Dashboard",
  content=@`@template.examples.adminDashboard.page(user = user, outlinePage = outlinePage)`
)
