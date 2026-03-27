<%-- see https://lucide.dev/icons/arrow-left-to-line --%>

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
  class="lucide lucide-arrow-left-to-line-icon lucide-arrow-left-to-line ${classAppend}"
>
  <path d="M3 19V5" />
  <path d="m13 6-6 6 6 6" />
  <path d="M7 12h14" />
</svg>
