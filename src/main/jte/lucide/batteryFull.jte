<%-- see https://lucide.dev/icons/battery-full --%>

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
  class="lucide lucide-battery-full-icon lucide-battery-full ${classAppend}"
>
  <path d="M10 10v4" />
  <path d="M14 10v4" />
  <path d="M22 14v-4" />
  <path d="M6 10v4" />
  <rect x="2" y="6" width="16" height="12" rx="2" />
</svg>
