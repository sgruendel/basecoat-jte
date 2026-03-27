<%-- see https://lucide.dev/icons/arrow-up-z-a --%>

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
  class="lucide lucide-arrow-up-z-a-icon lucide-arrow-up-z-a ${classAppend}"
>
  <path d="m3 8 4-4 4 4" />
  <path d="M7 4v16" />
  <path d="M15 4h5l-5 6h5" />
  <path d="M15 20v-3.5a2.5 2.5 0 0 1 5 0V20" />
  <path d="M20 18h-5" />
</svg>
