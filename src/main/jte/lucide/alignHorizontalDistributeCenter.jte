<%-- see https://lucide.dev/icons/align-horizontal-distribute-center --%>

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
  class="lucide lucide-align-horizontal-distribute-center-icon lucide-align-horizontal-distribute-center ${classAppend}"
>
  <rect width="6" height="14" x="4" y="5" rx="2" />
  <rect width="6" height="10" x="14" y="7" rx="2" />
  <path d="M17 22v-5" />
  <path d="M17 7V2" />
  <path d="M7 22v-3" />
  <path d="M7 5V2" />
</svg>
