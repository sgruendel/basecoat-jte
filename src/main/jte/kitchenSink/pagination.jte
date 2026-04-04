<section id="pagination"  class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Pagination</h2>
    <a href="https://basecoatui.com/components/pagination" class="text-muted-foreground hover:text-foreground" data-tooltip="See documentation" data-side="left">
      @template.lucide.bookOpen(classAppend = "size-4")
    </a>
  </header>
  <div class="p-4">
    <div class="inline-flex">
      <nav role="navigation" aria-label="pagination" class="mx-auto flex w-full justify-center">
        <ul class="flex flex-row items-center gap-1">
          <li>
            <a href="#" class="btn-ghost">@template.lucide.chevronLeft() Previous</a>
          </li>
          <li>
            <a href="#" class="btn-ghost size-9">1</a>
          </li>
          <li>
            <a href="#" class="btn-outline size-9">2</a>
          </li>
          <li>
            <a href="#" class="btn-ghost size-9">3</a>
          </li>
          <li>
            <a href="#" class="btn-icon-ghost">@template.lucide.ellipsis()</a>
          </li>
          <li>
            <a href="#" class="btn-ghost">Next @template.lucide.chevronRight()</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</section>
