<%-- see https://lucide.dev/icons/link-2-off --%>

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
  class="lucide lucide-link-2-off-icon lucide-link-2-off ${classAppend}"
>
  <path d="M9 17H7A5 5 0 0 1 7 7" />
  <path d="M15 7h2a5 5 0 0 1 4 8" />
  <line x1="8" x2="12" y1="12" y2="12" />
  <line x1="2" x2="22" y1="2" y2="22" />
</svg>
