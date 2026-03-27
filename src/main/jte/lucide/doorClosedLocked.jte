<%-- see https://lucide.dev/icons/door-closed-locked --%>

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
  class="lucide lucide-door-closed-locked-icon lucide-door-closed-locked ${classAppend}"
>
  <path d="M10 12h.01" />
  <path d="M18 9V6a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v14" />
  <path d="M2 20h8" />
  <path d="M20 17v-2a2 2 0 1 0-4 0v2" />
  <rect x="14" y="17" width="8" height="5" rx="1" />
</svg>
