@import static io.github.sgruendel.lucide.jte.LucideIcons.*
<section id="button" class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Button</h2>
    <a
      href="https://basecoatui.com/components/button"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-col gap-6">
      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <button class="btn-primary">Primary</button>
        <button class="btn-outline">Outline</button>
        <button class="btn-ghost">Ghost</button>
        <button class="btn-destructive">${lucideSend()} Danger</button>
        <button class="btn-secondary">Secondary</button>
        <button class="btn-link">Link</button>
        <button class="btn-outline">${lucideSend()} Send</button>
        <button class="btn-outline">
          Learn more ${lucideArrowRight()}
        </button>
        <button class="btn-outline" disabled>
          ${lucideLoader().cssClass("animate-spin")}
          Loading
        </button>
      </div>

      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <button class="btn-sm-primary">Primary</button>
        <button class="btn-sm-outline">Outline</button>
        <button class="btn-sm-ghost">Ghost</button>
        <button class="btn-sm-destructive">Danger</button>
        <button class="btn-sm-secondary">Secondary</button>
        <button class="btn-sm-link">Link</button>
        <button class="btn-sm-outline">${lucideSend()} Send</button>
        <button class="btn-sm-outline">
          Learn more ${lucideArrowRight()}
        </button>
        <button class="btn-sm-outline" disabled>
          ${lucideLoader().cssClass("animate-spin")}
          Loading
        </button>
      </div>

      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <button class="btn-lg-primary">Primary</button>
        <button class="btn-lg-outline">Outline</button>
        <button class="btn-lg-ghost">Ghost</button>
        <button class="btn-lg-destructive">
          ${lucideSend()} Danger
        </button>
        <button class="btn-lg-secondary">Secondary</button>
        <button class="btn-lg-link">Link</button>
        <button class="btn-lg-outline">${lucideSend()} Send</button>
        <button class="btn-lg-outline">
          Learn more ${lucideArrowRight()}
        </button>
        <button class="btn-lg-outline" disabled>
          ${lucideLoader().cssClass("animate-spin")}
          Loading
        </button>
      </div>

      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <button class="btn-icon-primary">${lucideDownload()}</button>
        <button class="btn-icon-secondary">${lucideUpload()}</button>
        <button class="btn-icon-outline">${lucideArrowRight()}</button>
        <button class="btn-icon-ghost">${lucideEllipsis()}</button>
        <button class="btn-icon-destructive">${lucideTrash()}</button>
        <button class="btn-icon-outline" disabled>
          ${lucideLoader().cssClass("animate-spin")}
        </button>
      </div>
    </div>
  </div>
</section>
