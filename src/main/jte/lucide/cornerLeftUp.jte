<%-- see https://lucide.dev/icons/corner-left-up --%>

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
  class="lucide lucide-corner-left-up-icon lucide-corner-left-up ${classAppend}"
>
  <path d="M14 9 9 4 4 9" />
  <path d="M20 20h-7a4 4 0 0 1-4-4V4" />
</svg>
