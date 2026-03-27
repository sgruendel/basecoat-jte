<%-- see https://lucide.dev/icons/tally-3 --%>

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
  class="lucide lucide-tally-3-icon lucide-tally-3 ${classAppend}"
>
  <path d="M4 4v16" />
  <path d="M9 4v16" />
  <path d="M14 4v16" />
</svg>
