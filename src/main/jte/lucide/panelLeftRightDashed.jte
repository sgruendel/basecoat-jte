<%-- see https://lucide.dev/icons/panel-left-right-dashed --%>

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
  class="lucide lucide-panel-left-right-dashed-icon lucide-panel-left-right-dashed ${classAppend}"
>
  <path d="M15 10V9" />
  <path d="M15 15v-1" />
  <path d="M15 21v-2" />
  <path d="M15 5V3" />
  <path d="M9 10V9" />
  <path d="M9 15v-1" />
  <path d="M9 21v-2" />
  <path d="M9 5V3" />
  <rect x="3" y="3" width="18" height="18" rx="2" />
</svg>
