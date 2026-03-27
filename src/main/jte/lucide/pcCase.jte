<%-- see https://lucide.dev/icons/pc-case --%>

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
  class="lucide lucide-pc-case-icon lucide-pc-case ${classAppend}"
>
  <rect width="14" height="20" x="5" y="2" rx="2" />
  <path d="M15 14h.01" />
  <path d="M9 6h6" />
  <path d="M9 10h6" />
</svg>
