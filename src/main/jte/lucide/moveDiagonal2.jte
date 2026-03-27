<%-- see https://lucide.dev/icons/move-diagonal-2 --%>

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
  class="lucide lucide-move-diagonal-2-icon lucide-move-diagonal-2 ${classAppend}"
>
  <path d="M19 13v6h-6" />
  <path d="M5 11V5h6" />
  <path d="m5 5 14 14" />
</svg>
