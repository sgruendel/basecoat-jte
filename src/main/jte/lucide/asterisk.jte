<%-- see https://lucide.dev/icons/asterisk --%>

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
  class="lucide lucide-asterisk-icon lucide-asterisk ${classAppend}"
>
  <path d="M12 6v12" />
  <path d="M17.196 9 6.804 15" />
  <path d="m6.804 9 10.392 6" />
</svg>
