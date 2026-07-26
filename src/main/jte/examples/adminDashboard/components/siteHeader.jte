<header
  class="bg-background/90 sticky top-0 z-10 flex h-(--header-height) shrink-0 items-center gap-2 border-b transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-(--header-height)"
>
  <div class="flex w-full items-center gap-1 px-4 lg:gap-2 lg:px-6">
    <h1 class="text-base font-medium">Documents</h1>
    <div class="ml-auto flex items-center gap-2">
      <button class="btn" data-size="sm" class="hidden h-7 sm:flex">
        @template.lucide.circlePlus()
        @template.lucide.circlePlus(fill = "white", color = "black")
        <%-- TODO simulate filled icon using fill/color, what about dark mode? --%>
        <span>Quick Create</span>
    </button>
    </div>
  </div>
</header>
