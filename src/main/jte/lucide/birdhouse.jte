<%-- see https://lucide.dev/icons/birdhouse --%>

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
  class="lucide lucide-birdhouse-icon lucide-birdhouse ${classAppend}"
>
  <path d="M12 18v4" />
  <path d="m17 18 1.956-11.468" />
  <path d="m3 8 7.82-5.615a2 2 0 0 1 2.36 0L21 8" />
  <path d="M4 18h16" />
  <path d="M7 18 5.044 6.532" />
  <circle cx="12" cy="10" r="2" />
</svg>
