<%-- see https://lucide.dev/icons/zodiac-taurus --%>

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
  class="lucide lucide-zodiac-taurus-icon lucide-zodiac-taurus ${classAppend}"
>
  <circle cx="12" cy="15" r="6" />
  <path d="M18 3A6 6 0 0 1 6 3" />
</svg>
