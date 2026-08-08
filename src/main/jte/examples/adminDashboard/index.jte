@import com.basecoatui.jte.examples.model.User
@import java.util.List
@import java.util.Map

@param User user
@param String chartData

@template.examples.layout(
  pageTitle = "Admin Dashboard",
  content=@`@template.examples.adminDashboard.page(user = user, chartData = chartData)`
)
