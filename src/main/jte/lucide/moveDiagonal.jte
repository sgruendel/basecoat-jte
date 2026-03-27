<%-- see https://lucide.dev/icons/move-diagonal --%>

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
  class="lucide lucide-move-diagonal-icon lucide-move-diagonal ${classAppend}"
>
  <path d="M11 19H5v-6" />
  <path d="M13 5h6v6" />
  <path d="M19 5 5 19" />
</svg>
