@import static io.github.sgruendel.lucide.jte.LucideIcons.*

<section id="avatar" class="w-full scroll-mt-14 rounded-lg border">
  <header class="flex items-center justify-between border-b px-4 py-3">
    <h2 class="text-sm font-medium">Avatar</h2>
    <a
      href="https://basecoatui.com/components/avatar"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-row flex-wrap items-center gap-4">
      <img class="size-8 shrink-0 rounded-full object-cover" alt="@hunvreus" src="https://github.com/hunvreus.png" />

      <span class="bg-muted flex size-8 shrink-0 items-center justify-center rounded-full">CN</span>

      <img class="size-12 shrink-0 rounded-full object-cover" alt="@hunvreus" src="https://github.com/hunvreus.png" />

      <img class="size-8 shrink-0 rounded-lg object-cover" alt="@hunvreus" src="https://github.com/hunvreus.png" />

      <div
        class="[&_img]:ring-background flex -space-x-2 [&_img]:size-8 [&_img]:shrink-0 [&_img]:rounded-full [&_img]:object-cover [&_img]:ring-2 [&_img]:grayscale"
      >
        <img alt="@hunvreus" src="https://github.com/hunvreus.png" />
        <img alt="@shadcn" src="https://github.com/shadcn.png" />
        <img alt="@adamwathan" src="https://github.com/adamwathan.png" />
      </div>

      <div
        class="[&_img]:ring-background flex -space-x-2 [&_img]:size-12 [&_img]:shrink-0 [&_img]:rounded-full [&_img]:object-cover [&_img]:ring-2 [&_img]:grayscale"
      >
        <img alt="@hunvreus" src="https://github.com/hunvreus.png" />
        <img alt="@shadcn" src="https://github.com/shadcn.png" />
        <img alt="@adamwathan" src="https://github.com/adamwathan.png" />
      </div>

      <div
        class="[&_img]:ring-background flex -space-x-2 hover:space-x-1 [&_img]:size-12 [&_img]:shrink-0 [&_img]:rounded-full [&_img]:object-cover [&_img]:ring-2 [&_img]:grayscale [&_img]:transition-all [&_img]:duration-300 [&_img]:ease-in-out"
      >
        <img alt="@hunvreus" src="https://github.com/hunvreus.png" />
        <img alt="@shadcn" src="https://github.com/shadcn.png" />
        <img alt="@adamwathan" src="https://github.com/adamwathan.png" />
      </div>
    </div>
  </div>
</section>
