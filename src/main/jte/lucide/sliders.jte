<%-- see https://lucide.dev/icons/sliders-vertical --%>

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
  class="lucide lucide-sliders-vertical-icon lucide-sliders-vertical ${classAppend}"
>
  <path d="M10 8h4" />
  <path d="M12 21v-9" />
  <path d="M12 8V3" />
  <path d="M17 16h4" />
  <path d="M19 12V3" />
  <path d="M19 21v-5" />
  <path d="M3 14h4" />
  <path d="M5 10V3" />
  <path d="M5 21v-7" />
</svg>
