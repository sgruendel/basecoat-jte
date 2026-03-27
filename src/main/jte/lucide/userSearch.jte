<%-- see https://lucide.dev/icons/user-search --%>

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
  class="lucide lucide-user-search-icon lucide-user-search ${classAppend}"
>
  <circle cx="10" cy="7" r="4" />
  <path d="M10.3 15H7a4 4 0 0 0-4 4v2" />
  <circle cx="17" cy="17" r="3" />
  <path d="m21 21-1.9-1.9" />
</svg>
