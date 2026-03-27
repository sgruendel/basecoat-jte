<%-- see https://lucide.dev/icons/square-arrow-down-left --%>

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
  class="lucide lucide-square-arrow-down-left-icon lucide-square-arrow-down-left ${classAppend}"
>
  <rect width="18" height="18" x="3" y="3" rx="2" />
  <path d="m16 8-8 8" />
  <path d="M16 16H8V8" />
</svg>
