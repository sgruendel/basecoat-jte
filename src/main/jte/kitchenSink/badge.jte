@import static io.github.sgruendel.lucide.jte.LucideIcons.*

<section id="badge" class="w-full scroll-mt-14 rounded-lg border">
  <header class="flex items-center justify-between border-b px-4 py-3">
    <h2 class="text-sm font-medium">Badge</h2>
    <a
      href="https://basecoatui.com/components/badge"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-col gap-2">
      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <span class="badge">Primary</span>
        <span class="badge-secondary">Secondary</span>
        <span class="badge-outline">Outline</span>
        <span class="badge-destructive">Destructive</span>
        <span class="badge-outline"> ${lucideCheck()} Badge </span>
        <span class="badge-destructive"> ${lucideCircleAlert()} Alert </span>
        <span class="badge min-w-5 rounded-full px-1">8</span>
        <span class="badge-destructive min-w-5 rounded-full px-1">99</span>
        <span class="badge-outline min-w-5 rounded-full px-1 font-mono tabular-nums">20+</span>
      </div>
      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <a href="#" class="badge"> Link ${lucideArrowRight()} </a>
        <a href="#" class="badge-secondary"> Link ${lucideArrowRight()} </a>
        <a href="#" class="badge-destructive"> Link ${lucideArrowRight()} </a>
        <a href="#" class="badge-outline"> Link ${lucideArrowRight()} </a>
      </div>
    </div>
  </div>
</section>
