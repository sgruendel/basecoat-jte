<%-- see https://lucide.dev/icons/microchip --%>

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
  class="lucide lucide-microchip-icon lucide-microchip ${classAppend}"
>
  <path d="M10 12h4" />
  <path d="M10 17h4" />
  <path d="M10 7h4" />
  <path d="M18 12h2" />
  <path d="M18 18h2" />
  <path d="M18 6h2" />
  <path d="M4 12h2" />
  <path d="M4 18h2" />
  <path d="M4 6h2" />
  <rect x="6" y="2" width="12" height="20" rx="2" />
</svg>
