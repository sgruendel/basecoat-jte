<%-- see https://lucide.dev/icons/spell-check --%>

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
  class="lucide lucide-spell-check-icon lucide-spell-check ${classAppend}"
>
  <path d="m6 16 6-12 6 12" />
  <path d="M8 12h8" />
  <path d="m16 20 2 2 4-4" />
</svg>
