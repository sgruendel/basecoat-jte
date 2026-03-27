<%-- see https://lucide.dev/icons/chart-scatter --%>

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
  class="lucide lucide-chart-scatter-icon lucide-chart-scatter ${classAppend}"
>
  <circle cx="7.5" cy="7.5" r=".5" fill="currentColor" />
  <circle cx="18.5" cy="5.5" r=".5" fill="currentColor" />
  <circle cx="11.5" cy="11.5" r=".5" fill="currentColor" />
  <circle cx="7.5" cy="16.5" r=".5" fill="currentColor" />
  <circle cx="17.5" cy="14.5" r=".5" fill="currentColor" />
  <path d="M3 3v16a2 2 0 0 0 2 2h16" />
</svg>
