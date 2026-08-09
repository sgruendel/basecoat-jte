@import com.basecoatui.jte.examples.models.User
@import com.basecoatui.jte.examples.admindashboard.models.OutlinePage
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import java.util.List

@param User user
@param OutlinePage outlinePage
@param List<Item> pageSizeItems

<script src="/js/admin-dashboard.js" defer></script>
@template.examples.adminDashboard.components.appSitebar(user = user)
<main id="content" class="min-w-0">
  @template.examples.adminDashboard.components.siteHeader()

  <div class="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
    @template.examples.adminDashboard.components.sectionCards()
    @template.examples.adminDashboard.components.chartAreaInteractive()
    @template.examples.adminDashboard.components.dataTable(
      page = outlinePage,
      pageSizeItems = pageSizeItems
    )
  </div>
</main>
