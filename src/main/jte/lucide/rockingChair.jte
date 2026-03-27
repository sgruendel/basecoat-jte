<%-- see https://lucide.dev/icons/rocking-chair --%>

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
  class="lucide lucide-rocking-chair-icon lucide-rocking-chair ${classAppend}"
>
  <path d="m15 13 3.708 7.416" />
  <path d="M3 19a15 15 0 0 0 18 0" />
  <path d="m3 2 3.21 9.633A2 2 0 0 0 8.109 13H18" />
  <path d="m9 13-3.708 7.416" />
</svg>
