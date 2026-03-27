<%-- see https://lucide.dev/icons/indian-rupee --%>

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
  class="lucide lucide-indian-rupee-icon lucide-indian-rupee ${classAppend}"
>
  <path d="M6 3h12" />
  <path d="M6 8h12" />
  <path d="m6 13 8.5 8" />
  <path d="M6 13h3" />
  <path d="M9 13c6.667 0 6.667-10 0-10" />
</svg>
