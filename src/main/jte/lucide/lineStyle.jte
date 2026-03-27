<%-- see https://lucide.dev/icons/line-style --%>

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
  class="lucide lucide-line-style-icon lucide-line-style ${classAppend}"
>
  <path d="M11 5h2" />
  <path d="M15 12h6" />
  <path d="M19 5h2" />
  <path d="M3 12h6" />
  <path d="M3 19h18" />
  <path d="M3 5h2" />
</svg>
