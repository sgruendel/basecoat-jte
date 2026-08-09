@import com.basecoatui.jte.examples.models.OutlineRow
@import com.basecoatui.jte.util.JsonHelper
@import java.util.List
@import java.util.Map

@param OutlineRow row

!{
  // TODO request server side data
  final List<Map<String, Object>> detailData = List.of(
    Map.of("month", "January", "desktop", 186, "mobile", 80),
    Map.of("month", "February", "desktop", 305, "mobile", 200),
    Map.of("month", "March", "desktop", 237, "mobile", 120),
    Map.of("month", "April", "desktop", 73, "mobile", 190),
    Map.of("month", "May", "desktop", 209, "mobile", 130),
    Map.of("month", "June", "desktop", 214, "mobile", 140)
  );
  // TODO server side enum
  final Map<String, Object> detailSeries = Map.of(
    "desktop", Map.of("label", "Desktop", "color", "var(--chart-1)", "surface", "gradient"),
    "mobile", Map.of("label", "Mobile", "color", "var(--chart-2)", "surface", "gradient")
  );
}

<article>
  <%-- TODO this is currently populated via JavaScript, should be an htmx request--%>
  <header>
    <h2 id="row-details-title">${row.header()}</h2>
    <p>Document outline details</p>
  </header>
  <section class="scrollbar px-4">
    <div class="hidden md:block">
      <div class="relative h-44">
        <canvas
          id="detail-chart"
          data-chart-type="line"
          data-chart-label-key="month"
          data-chart-data="${JsonHelper.write(detailData)}"
          data-chart-series="${JsonHelper.write(detailSeries)}"
          aria-label="Sample visitors for ${row.header()}"
        ></canvas>
      </div>
      <hr class="my-4" />
      <div class="grid gap-2 text-sm">
        <div class="font-medium">Trending up by 5.2% this month ↗</div>
        <p class="text-muted-foreground">Showing sample visitor data for the last six months.</p>
      </div>
      <hr class="my-4" />
    </div>

    <dl class="grid grid-cols-[minmax(7rem,auto)_1fr] gap-x-4 gap-y-3 text-sm">
      <dt class="text-muted-foreground">Header</dt><dd>${row.header()}</dd>
      <dt class="text-muted-foreground">Section Type</dt><dd>${row.type()}</dd>
      <dt class="text-muted-foreground">Status</dt><dd>${row.status()}</dd>
      <dt class="text-muted-foreground">Target</dt><dd>${row.target()}</dd>
      <dt class="text-muted-foreground">Limit</dt><dd>${row.limit()}</dd>
      <dt class="text-muted-foreground">Reviewer</dt><dd>${row.reviewer()}</dd>
    </dl>
  </section>
  <footer>
    <button type="button" class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Done</button>
  </footer>
</article>
