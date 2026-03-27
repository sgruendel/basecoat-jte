<%-- see https://lucide.dev/icons/mirror-round --%>

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
  class="lucide lucide-mirror-round-icon lucide-mirror-round ${classAppend}"
>
  <path d="M10 6.6 8.6 8" />
  <path d="M12 18v4" />
  <path d="M15 7.5 9.5 13" />
  <path d="M7 22h10" />
  <circle cx="12" cy="10" r="8" />
</svg>
