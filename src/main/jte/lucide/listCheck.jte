<%-- see https://lucide.dev/icons/list-check --%>

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
  class="lucide lucide-list-check-icon lucide-list-check ${classAppend}"
>
  <path d="M16 5H3" />
  <path d="M16 12H3" />
  <path d="M11 19H3" />
  <path d="m15 18 2 2 4-4" />
</svg>
