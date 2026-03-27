<%-- see https://lucide.dev/icons/blinds --%>

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
  class="lucide lucide-blinds-icon lucide-blinds ${classAppend}"
>
  <path d="M3 3h18" />
  <path d="M20 7H8" />
  <path d="M20 11H8" />
  <path d="M10 19h10" />
  <path d="M8 15h12" />
  <path d="M4 3v14" />
  <circle cx="4" cy="19" r="2" />
</svg>
