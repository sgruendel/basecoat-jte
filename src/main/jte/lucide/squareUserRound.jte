<%-- see https://lucide.dev/icons/square-user-round --%>

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
  class="lucide lucide-square-user-round-icon lucide-square-user-round ${classAppend}"
>
  <path d="M18 21a6 6 0 0 0-12 0" />
  <circle cx="12" cy="11" r="4" />
  <rect width="18" height="18" x="3" y="3" rx="2" />
</svg>
