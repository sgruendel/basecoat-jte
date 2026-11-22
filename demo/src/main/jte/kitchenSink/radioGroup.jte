@import static io.github.sgruendel.lucide.jte.LucideIcons.*

<section id="radio-group" class="w-full scroll-mt-14 rounded-lg border">
  <header class="flex items-center justify-between border-b px-4 py-3">
    <h2 class="text-sm font-medium">Radio Group</h2>
    <a
      href="https://basecoatui.com/components/radio-group"
      class="text-muted-foreground hover:text-foreground"
      data-tooltip="See documentation"
      data-side="left"
    >
      ${lucideBookOpen().cssClass("size-4")}
    </a>
  </header>
  <div class="p-4">
    <div class="flex flex-col gap-y-6">
      <fieldset class="grid gap-3">
        <label class="label"><input type="radio" name="demo-radio-group" value="default" class="input" />Default</label>
        <label class="label"
          ><input type="radio" name="demo-radio-group" value="comfortable" class="input" />Comfortable</label
        >
        <label class="label"><input type="radio" name="demo-radio-group" value="compact" class="input" />Compact</label>
      </fieldset>
      <fieldset class="grid max-w-sm gap-3">
        <label
          class="label hover:bg-accent/50 items-start gap-3 rounded-lg border p-4 has-[input[type='radio']:checked]:border-green-600 has-[input[type='radio']:checked]:bg-green-50 dark:has-[input[type='radio']:checked]:border-green-900 dark:has-[input[type='radio']:checked]:bg-green-950"
        >
          <input
            type="radio"
            name="demo-radio-group-styled"
            value="no"
            class="input dark:checked:bg-input/30 checked:before:bg-background dark:checked:before:bg-primary checked:border-green-600 checked:bg-green-600"
          />
          <div class="grid gap-1 font-normal">
            <h2 class="font-medium">Starter Plan</h2>
            <p class="text-muted-foreground leading-snug">
              Perfect for small businesses getting started with our platform
            </p>
          </div>
        </label>
        <label
          class="label hover:bg-accent/50 items-start gap-3 rounded-lg border p-4 has-[input[type='radio']:checked]:border-green-600 has-[input[type='radio']:checked]:bg-green-50 dark:has-[input[type='radio']:checked]:border-green-900 dark:has-[input[type='radio']:checked]:bg-green-950"
        >
          <input
            type="radio"
            name="demo-radio-group-styled"
            value="no"
            class="input dark:checked:bg-input/30 checked:before:bg-background dark:checked:before:bg-primary checked:border-green-600 checked:bg-green-600"
          />
          <div class="grid gap-1 font-normal">
            <h2 class="font-medium">Pro Plan</h2>
            <p class="text-muted-foreground leading-snug">
              Advanced features for growing businesses with higher demands
            </p>
          </div>
        </label>
      </fieldset>
    </div>
  </div>
</section>
