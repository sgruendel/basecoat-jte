<section id="button"  class="w-full rounded-lg border scroll-mt-14">
  <header class="border-b px-4 py-3 flex items-center justify-between">
    <h2 class="text-sm font-medium">Button</h2>
    <a href="https://basecoatui.com/components/button" class="text-muted-foreground hover:text-foreground" data-tooltip="See documentation" data-side="left">
      @template.lucide.bookOpen(classAppend = "size-4")
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-col gap-6">
      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <button class="btn-primary">Primary</button>
        <button class="btn-outline">Outline</button>
        <button class="btn-ghost">Ghost</button>
        <button class="btn-destructive">
          @template.lucide.send()
          Danger
        </button>
        <button class="btn-secondary">Secondary</button>
        <button class="btn-link">Link</button>
        <button class="btn-outline">
          @template.lucide.send()
          Send
        </button>
        <button class="btn-outline">
          Learn more
          @template.lucide.arrowRight()
        </button>
        <button class="btn-outline" disabled>
          @template.lucide.loader(classAppend = "animate-spin")
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
        <button class="btn-sm-outline">
          @template.lucide.send()
          Send
        </button>
        <button class="btn-sm-outline">
          Learn more
          @template.lucide.arrowRight()
        </button>
        <button class="btn-sm-outline" disabled>
          @template.lucide.loader(classAppend = "animate-spin")
          Loading
        </button>
      </div>

      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <button class="btn-lg-primary">Primary</button>
        <button class="btn-lg-outline">Outline</button>
        <button class="btn-lg-ghost">Ghost</button>
        <button class="btn-lg-destructive">
          @template.lucide.send()
          Danger
        </button>
        <button class="btn-lg-secondary">Secondary</button>
        <button class="btn-lg-link">Link</button>
        <button class="btn-lg-outline">
          @template.lucide.send()
          Send
        </button>
        <button class="btn-lg-outline">
          Learn more
          @template.lucide.arrowRight()
        </button>
        <button class="btn-lg-outline" disabled>
          @template.lucide.loader(classAppend = "animate-spin")
          Loading
        </button>
      </div>

      <div class="flex flex-wrap items-center gap-2 md:flex-row">
        <button class="btn-icon-primary">
          @template.lucide.download()
        </button>
        <button class="btn-icon-secondary">
          @template.lucide.upload()
        </button>
        <button class="btn-icon-outline">
          @template.lucide.arrowRight()
        </button>
        <button class="btn-icon-ghost">
          @template.lucide.ellipsis()
        </button>
        <button class="btn-icon-destructive">
          @template.lucide.trash2()
        </button>
        <button class="btn-icon-outline" disabled>
          @template.lucide.loader(classAppend = "animate-spin")
        </button>
      </div>
    </div>
  </div>
</section>
