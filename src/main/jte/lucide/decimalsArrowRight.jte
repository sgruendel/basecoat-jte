<%-- see https://lucide.dev/icons/decimals-arrow-right --%>

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
  class="lucide lucide-decimals-arrow-right-icon lucide-decimals-arrow-right ${classAppend}"
>
  <path d="M10 18h10" />
  <path d="m17 21 3-3-3-3" />
  <path d="M3 11h.01" />
  <rect x="15" y="3" width="5" height="8" rx="2.5" />
  <rect x="6" y="3" width="5" height="8" rx="2.5" />
</svg>
