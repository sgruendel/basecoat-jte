<%-- see https://lucide.dev/icons/arrow-up-from-dot --%>

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
  class="lucide lucide-arrow-up-from-dot-icon lucide-arrow-up-from-dot ${classAppend}"
>
  <path d="m5 9 7-7 7 7" />
  <path d="M12 16V2" />
  <circle cx="12" cy="21" r="1" />
</svg>
