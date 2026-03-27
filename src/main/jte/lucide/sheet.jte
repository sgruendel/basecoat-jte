<%-- see https://lucide.dev/icons/sheet --%>

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
  class="lucide lucide-sheet-icon lucide-sheet ${classAppend}"
>
  <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
  <line x1="3" x2="21" y1="9" y2="9" />
  <line x1="3" x2="21" y1="15" y2="15" />
  <line x1="9" x2="9" y1="9" y2="21" />
  <line x1="15" x2="15" y1="9" y2="21" />
</svg>
