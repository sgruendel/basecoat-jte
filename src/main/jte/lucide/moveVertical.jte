<%-- see https://lucide.dev/icons/move-vertical --%>

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
  class="lucide lucide-move-vertical-icon lucide-move-vertical ${classAppend}"
>
  <path d="M12 2v20" />
  <path d="m8 18 4 4 4-4" />
  <path d="m8 6 4-4 4 4" />
</svg>
