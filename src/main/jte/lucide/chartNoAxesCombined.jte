<%-- see https://lucide.dev/icons/chart-no-axes-combined --%>

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
  class="lucide lucide-chart-no-axes-combined-icon lucide-chart-no-axes-combined ${classAppend}"
>
  <path d="M12 16v5" />
  <path d="M16 14v7" />
  <path d="M20 10v11" />
  <path d="m22 3-8.646 8.646a.5.5 0 0 1-.708 0L9.354 8.354a.5.5 0 0 0-.707 0L2 15" />
  <path d="M4 18v3" />
  <path d="M8 14v7" />
</svg>
