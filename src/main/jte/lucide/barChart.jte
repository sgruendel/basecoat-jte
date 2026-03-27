<%-- see https://lucide.dev/icons/chart-no-axes-column-increasing --%>

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
  class="lucide lucide-chart-no-axes-column-increasing-icon lucide-chart-no-axes-column-increasing ${classAppend}"
>
  <path d="M5 21v-6" />
  <path d="M12 21V9" />
  <path d="M19 21V3" />
</svg>
