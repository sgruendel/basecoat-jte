<%-- see https://lucide.dev/icons/person-standing --%>

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
  class="lucide lucide-person-standing-icon lucide-person-standing ${classAppend}"
>
  <circle cx="12" cy="5" r="1" />
  <path d="m9 20 3-6 3 6" />
  <path d="m6 8 6 2 6-2" />
  <path d="M12 10v4" />
</svg>
