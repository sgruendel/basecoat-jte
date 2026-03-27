<%-- see https://lucide.dev/icons/ungroup --%>

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
  class="lucide lucide-ungroup-icon lucide-ungroup ${classAppend}"
>
  <rect width="8" height="6" x="5" y="4" rx="1" />
  <rect width="8" height="6" x="11" y="14" rx="1" />
</svg>
