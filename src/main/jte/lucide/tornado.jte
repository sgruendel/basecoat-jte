<%-- see https://lucide.dev/icons/tornado --%>

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
  class="lucide lucide-tornado-icon lucide-tornado ${classAppend}"
>
  <path d="M21 4H3" />
  <path d="M18 8H6" />
  <path d="M19 12H9" />
  <path d="M16 16h-6" />
  <path d="M11 20H9" />
</svg>
