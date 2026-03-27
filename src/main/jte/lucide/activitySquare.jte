<%-- see https://lucide.dev/icons/square-activity --%>

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
  class="lucide lucide-square-activity-icon lucide-square-activity ${classAppend}"
>
  <rect width="18" height="18" x="3" y="3" rx="2" />
  <path d="M17 12h-2l-2 5-2-10-2 5H7" />
</svg>
