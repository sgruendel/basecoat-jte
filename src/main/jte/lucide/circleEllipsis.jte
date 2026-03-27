<%-- see https://lucide.dev/icons/circle-ellipsis --%>

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
  class="lucide lucide-circle-ellipsis-icon lucide-circle-ellipsis ${classAppend}"
>
  <circle cx="12" cy="12" r="10" />
  <path d="M17 12h.01" />
  <path d="M12 12h.01" />
  <path d="M7 12h.01" />
</svg>
