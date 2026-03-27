<%-- see https://lucide.dev/icons/expand --%>

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
  class="lucide lucide-expand-icon lucide-expand ${classAppend}"
>
  <path d="m15 15 6 6" />
  <path d="m15 9 6-6" />
  <path d="M21 16v5h-5" />
  <path d="M21 8V3h-5" />
  <path d="M3 16v5h5" />
  <path d="m3 21 6-6" />
  <path d="M3 8V3h5" />
  <path d="M9 9 3 3" />
</svg>
