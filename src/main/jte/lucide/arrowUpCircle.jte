<%-- see https://lucide.dev/icons/circle-arrow-up --%>

@import static LucideUtils.calculatedStrokeWidth

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<svg
  xmlns="http://www.w3.org/2000/svg"
  width="${size}"
  height="${size}"
  viewBox="0 0 24 24"
  fill="none"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth(size, strokeWidth, absoluteStrokeWidth)}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="lucide lucide-circle-arrow-up-icon lucide-circle-arrow-up ${classAppend}"
>
  <circle cx="12" cy="12" r="10" />
  <path d="m16 12-4-4-4 4" />
  <path d="M12 16V8" />
</svg>
