<%-- see https://lucide.dev/icons/chevrons-right-left --%>

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
  class="lucide lucide-chevrons-right-left-icon lucide-chevrons-right-left ${classAppend}"
>
  <path d="m20 17-5-5 5-5" />
  <path d="m4 17 5-5-5-5" />
</svg>
