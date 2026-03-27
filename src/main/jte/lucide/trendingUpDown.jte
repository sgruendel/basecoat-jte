<%-- see https://lucide.dev/icons/trending-up-down --%>

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
  class="lucide lucide-trending-up-down-icon lucide-trending-up-down ${classAppend}"
>
  <path d="M14.828 14.828 21 21" />
  <path d="M21 16v5h-5" />
  <path d="m21 3-9 9-4-4-6 6" />
  <path d="M21 8V3h-5" />
</svg>
