<%-- see https://lucide.dev/icons/turntable --%>

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
  class="lucide lucide-turntable-icon lucide-turntable ${classAppend}"
>
  <path d="M10 12.01h.01" />
  <path d="M18 8v4a8 8 0 0 1-1.07 4" />
  <circle cx="10" cy="12" r="4" />
  <rect x="2" y="4" width="20" height="16" rx="2" />
</svg>
