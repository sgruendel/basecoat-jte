<%-- see https://lucide.dev/icons/chart-no-axes-gantt --%>

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
  class="lucide lucide-chart-no-axes-gantt-icon lucide-chart-no-axes-gantt ${classAppend}"
>
  <path d="M6 5h12" />
  <path d="M4 12h10" />
  <path d="M12 19h8" />
</svg>
