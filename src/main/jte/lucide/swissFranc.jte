<%-- see https://lucide.dev/icons/swiss-franc --%>

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
  class="lucide lucide-swiss-franc-icon lucide-swiss-franc ${classAppend}"
>
  <path d="M10 21V3h8" />
  <path d="M6 16h9" />
  <path d="M10 9.5h7" />
</svg>
