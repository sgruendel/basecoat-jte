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

<script type="module" src="/js/admin-dashboard.js"></script>
@template.examples.adminDashboard.components.appSitebar(user = user)
<main id="content" class="min-w-0">
  @template.examples.adminDashboard.components.siteHeader()

  <div class="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
    @template.examples.adminDashboard.components.sectionCards()
    @template.examples.adminDashboard.components.chartAreaInteractive()
    @template.examples.adminDashboard.components.dataTable(
      page = outlinePage,
      selection = selection,
      baseUrl = baseUrl,
      pageSizeItems = pageSizeItems
    )
  </div>
</main>
