@import gg.jte.Content
@import java.util.List

!{
  record Card(String label, String value, String change, String summary, String description, Content trendIcon) {}

  final var cards = List.of(
    new Card("Total Revenue", "$1,250.00", "+12.5%", "Trending up this month", "Visitors for the last 6 months",
      @`@template.lucide.trendingUp(size = 16)`),
    new Card("New Customers", "1,234", "-20%", "Down 20% this period", "Acquisition needs attention",
      @`@template.lucide.trendingDown(size = 16)`),
    new Card("Active Accounts", "45,678", "+12.5%", "Strong user retention", "Engagement exceed targets",
      @`@template.lucide.trendingUp(size = 16)`),
    new Card("Growth Rate", "4.5%", "+4.5%", "Steady performance increase", "Meets growth projections",
      @`@template.lucide.trendingUp(size = 16)`)
  );
}

<section class="grid grid-cols-1 gap-4 px-4 sm:grid-cols-2 lg:px-6 xl:grid-cols-4" aria-label="Dashboard metrics">
  @for(var card : cards)
    <article class="card metric-card">
      <header>
        <p>${card.label}</p>
        <h2 class="text-2xl font-semibold tabular-nums">${card.value}</h2>
        <div class="card-action">
          <span class="badge" data-variant="outline">${card.trendIcon} ${card.change}</span>
        </div>
      </header>
      <footer class="flex-col items-start gap-1.5 text-sm">
        <div class="flex gap-2 font-medium">${card.summary} ${card.trendIcon}</div>
        <div class="text-muted-foreground">${card.description}</div>
      </footer>
    </article>
  @endfor
</section>
