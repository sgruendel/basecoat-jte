<%-- see https://lucide.dev/icons/currency --%>

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
  class="lucide lucide-currency-icon lucide-currency ${classAppend}"
>
  <circle cx="12" cy="12" r="8" />
  <line x1="3" x2="6" y1="3" y2="6" />
  <line x1="21" x2="18" y1="3" y2="6" />
  <line x1="3" x2="6" y1="21" y2="18" />
  <line x1="21" x2="18" y1="21" y2="18" />
</svg>
