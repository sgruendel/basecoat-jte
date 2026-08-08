@import com.basecoatui.jte.examples.model.User
@import java.util.List
@import java.util.Map

@param User user
@param String chartData

<script src="/js/admin-dashboard.js" defer></script>
@template.examples.adminDashboard.components.appSitebar(user = user)
<main id="content" class="min-w-0">
  @template.examples.adminDashboard.components.siteHeader()

  <div class="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
    @template.examples.adminDashboard.components.sectionCards()
    @template.examples.adminDashboard.components.chartAreaInteractive()
    @template.examples.adminDashboard.components.dataTable(data = chartData)
  </div>
</main>
