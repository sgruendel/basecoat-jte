<%-- see https://lucide.dev/icons/zodiac-sagittarius --%>

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
  class="lucide lucide-zodiac-sagittarius-icon lucide-zodiac-sagittarius ${classAppend}"
>
  <path d="M15 3h6v6" />
  <path d="M21 3 3 21" />
  <path d="m9 9 6 6" />
</svg>
