<%-- see https://lucide.dev/icons/venus-and-mars --%>

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
  class="lucide lucide-venus-and-mars-icon lucide-venus-and-mars ${classAppend}"
>
  <path d="M10 20h4" />
  <path d="M12 16v6" />
  <path d="M17 2h4v4" />
  <path d="m21 2-5.46 5.46" />
  <circle cx="12" cy="11" r="5" />
</svg>
