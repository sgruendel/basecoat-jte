<%-- see https://lucide.dev/icons/bluetooth-connected --%>

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
  class="lucide lucide-bluetooth-connected-icon lucide-bluetooth-connected ${classAppend}"
>
  <path d="m7 7 10 10-5 5V2l5 5L7 17" />
  <line x1="18" x2="21" y1="12" y2="12" />
  <line x1="3" x2="6" y1="12" y2="12" />
</svg>
