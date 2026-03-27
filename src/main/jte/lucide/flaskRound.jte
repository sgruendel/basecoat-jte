<%-- see https://lucide.dev/icons/flask-round --%>

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
  class="lucide lucide-flask-round-icon lucide-flask-round ${classAppend}"
>
  <path d="M10 2v6.292a7 7 0 1 0 4 0V2" />
  <path d="M5 15h14" />
  <path d="M8.5 2h7" />
</svg>
