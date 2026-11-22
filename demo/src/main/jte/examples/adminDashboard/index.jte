@import io.github.sgruendel.basecoat.jte.BasecoatItem.Option
@import io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.models.OutlinePage
@import io.github.sgruendel.basecoat.jte.demo.examples.admindashboard.models.OutlineSelection
@import io.github.sgruendel.basecoat.jte.demo.examples.models.User

@import java.util.List

@param User user
@param OutlinePage outlinePage
@param OutlineSelection selection
@param String baseUrl
@param List<Option> pageSizeItems

@template.examples.layout(
    pageTitle = "Admin Dashboard",
    content=@`
        @template.examples.adminDashboard.page(
            user = user,
            outlinePage = outlinePage,
            selection = selection,
            baseUrl = baseUrl,
            pageSizeItems = pageSizeItems
        )
    `
)
