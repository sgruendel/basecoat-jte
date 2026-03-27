<%-- see https://lucide.dev/icons/square-radical --%>

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
  class="lucide lucide-square-radical-icon lucide-square-radical ${classAppend}"
>
  <path d="M7 12h2l2 5 2-10h4" />
  <rect x="3" y="3" width="18" height="18" rx="2" />
</svg>
