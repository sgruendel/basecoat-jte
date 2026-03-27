<%-- see https://lucide.dev/icons/align-vertical-space-around --%>

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
  class="lucide lucide-align-vertical-space-around-icon lucide-align-vertical-space-around ${classAppend}"
>
  <rect width="10" height="6" x="7" y="9" rx="2" />
  <path d="M22 20H2" />
  <path d="M22 4H2" />
</svg>
