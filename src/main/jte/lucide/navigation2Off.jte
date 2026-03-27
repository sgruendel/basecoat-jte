<%-- see https://lucide.dev/icons/navigation-2-off --%>

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
  class="lucide lucide-navigation-2-off-icon lucide-navigation-2-off ${classAppend}"
>
  <path d="M9.31 9.31 5 21l7-4 7 4-1.17-3.17" />
  <path d="M14.53 8.88 12 2l-1.17 3.17" />
  <line x1="2" x2="22" y1="2" y2="22" />
</svg>
