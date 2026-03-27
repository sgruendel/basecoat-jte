<%-- see https://lucide.dev/icons/zodiac-virgo --%>

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
  class="lucide lucide-zodiac-virgo-icon lucide-zodiac-virgo ${classAppend}"
>
  <path d="M11 5.5a1 1 0 0 1 5 0V16a5 5 0 0 0 5 5" />
  <path d="M16 11.5a1 1 0 0 1 5 0V16a5 5 0 0 1-5 5" />
  <path d="M6 19V6a3 3 0 0 0-3-3h0" />
  <path d="M6 5.5a1 1 0 0 1 5 0V19" />
</svg>
