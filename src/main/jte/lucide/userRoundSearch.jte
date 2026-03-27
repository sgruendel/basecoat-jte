<%-- see https://lucide.dev/icons/user-round-search --%>

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
  class="lucide lucide-user-round-search-icon lucide-user-round-search ${classAppend}"
>
  <circle cx="10" cy="8" r="5" />
  <path d="M2 21a8 8 0 0 1 10.434-7.62" />
  <circle cx="18" cy="18" r="3" />
  <path d="m22 22-1.9-1.9" />
</svg>
