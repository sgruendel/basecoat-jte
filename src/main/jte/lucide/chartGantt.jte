<%-- see https://lucide.dev/icons/chart-gantt --%>

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
  class="lucide lucide-chart-gantt-icon lucide-chart-gantt ${classAppend}"
>
  <path d="M10 6h8" />
  <path d="M12 16h6" />
  <path d="M3 3v16a2 2 0 0 0 2 2h16" />
  <path d="M8 11h7" />
</svg>
