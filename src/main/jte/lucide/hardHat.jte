<%-- see https://lucide.dev/icons/hard-hat --%>

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
  class="lucide lucide-hard-hat-icon lucide-hard-hat ${classAppend}"
>
  <path d="M10 10V5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v5" />
  <path d="M14 6a6 6 0 0 1 6 6v3" />
  <path d="M4 15v-3a6 6 0 0 1 6-6" />
  <rect x="2" y="15" width="20" height="4" rx="1" />
</svg>
