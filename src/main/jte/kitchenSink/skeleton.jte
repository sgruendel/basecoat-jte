@import static io.github.sgruendel.lucide.jte.LucideIcons.*

<section id="skeleton" class="w-full scroll-mt-14 rounded-lg border">
  <header class="flex items-center justify-between border-b px-4 py-3">
    <h2 class="text-sm font-medium">Skeleton</h2>
    <a
      href="https://basecoatui.com/components/skeleton"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-col gap-4">
      <div class="flex items-center gap-4">
        <div class="bg-accent size-10 shrink-0 animate-pulse rounded-full"></div>
        <div class="grid gap-2">
          <div class="bg-accent h-4 w-[150px] animate-pulse rounded-md"></div>
          <div class="bg-accent h-4 w-[100px] animate-pulse rounded-md"></div>
        </div>
      </div>

      <div class="flex w-full gap-4 max-sm:flex-col">
        <div class="card w-full @md:w-auto @md:min-w-sm">
          <header>
            <div class="bg-accent h-4 w-2/3 animate-pulse rounded-md"></div>
            <div class="bg-accent h-4 w-1/2 animate-pulse rounded-md"></div>
          </header>
          <section>
            <div class="bg-accent aspect-square w-full animate-pulse rounded-md"></div>
          </section>
        </div>

        <div class="card w-full @md:w-auto @md:min-w-sm">
          <header>
            <div class="bg-accent h-4 w-2/3 animate-pulse rounded-md"></div>
            <div class="bg-accent h-4 w-1/2 animate-pulse rounded-md"></div>
          </header>
          <section>
            <div class="bg-accent aspect-square w-full animate-pulse rounded-md"></div>
          </section>
        </div>
      </div>
    </div>
  </div>
</section>
