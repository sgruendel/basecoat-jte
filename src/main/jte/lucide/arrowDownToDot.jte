<%-- see https://lucide.dev/icons/arrow-down-to-dot --%>

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
  class="lucide lucide-arrow-down-to-dot-icon lucide-arrow-down-to-dot ${classAppend}"
>
  <path d="M12 2v14" />
  <path d="m19 9-7 7-7-7" />
  <circle cx="12" cy="21" r="1" />
</svg>
