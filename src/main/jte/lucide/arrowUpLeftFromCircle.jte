<%-- see https://lucide.dev/icons/circle-arrow-out-up-left --%>

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
  class="lucide lucide-circle-arrow-out-up-left-icon lucide-circle-arrow-out-up-left ${classAppend}"
>
  <path d="M2 8V2h6" />
  <path d="m2 2 10 10" />
  <path d="M12 2A10 10 0 1 1 2 12" />
</svg>
