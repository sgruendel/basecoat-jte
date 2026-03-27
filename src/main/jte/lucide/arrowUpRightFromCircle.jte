<%-- see https://lucide.dev/icons/circle-arrow-out-up-right --%>

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
  class="lucide lucide-circle-arrow-out-up-right-icon lucide-circle-arrow-out-up-right ${classAppend}"
>
  <path d="M22 12A10 10 0 1 1 12 2" />
  <path d="M22 2 12 12" />
  <path d="M16 2h6v6" />
</svg>
