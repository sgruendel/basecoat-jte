<%-- see https://lucide.dev/icons/list-chevrons-up-down --%>

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
  class="lucide lucide-list-chevrons-up-down-icon lucide-list-chevrons-up-down ${classAppend}"
>
  <path d="M3 5h8" />
  <path d="M3 12h8" />
  <path d="M3 19h8" />
  <path d="m15 8 3-3 3 3" />
  <path d="m15 16 3 3 3-3" />
</svg>
