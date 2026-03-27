<%-- see https://lucide.dev/icons/corner-up-right --%>

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
  class="lucide lucide-corner-up-right-icon lucide-corner-up-right ${classAppend}"
>
  <path d="m15 14 5-5-5-5" />
  <path d="M4 20v-7a4 4 0 0 1 4-4h12" />
</svg>
