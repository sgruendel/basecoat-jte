<%-- see https://lucide.dev/icons/text-search --%>

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
  class="lucide lucide-text-search-icon lucide-text-search ${classAppend}"
>
  <path d="M21 5H3" />
  <path d="M10 12H3" />
  <path d="M10 19H3" />
  <circle cx="17" cy="15" r="3" />
  <path d="m21 19-1.9-1.9" />
</svg>
