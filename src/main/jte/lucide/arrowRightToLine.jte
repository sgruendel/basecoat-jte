<%-- see https://lucide.dev/icons/arrow-right-to-line --%>

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
  class="lucide lucide-arrow-right-to-line-icon lucide-arrow-right-to-line ${classAppend}"
>
  <path d="M17 12H3" />
  <path d="m11 18 6-6-6-6" />
  <path d="M21 5v14" />
</svg>
