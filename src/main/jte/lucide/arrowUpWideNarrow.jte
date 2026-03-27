<%-- see https://lucide.dev/icons/arrow-up-wide-narrow --%>

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
  class="lucide lucide-arrow-up-wide-narrow-icon lucide-arrow-up-wide-narrow ${classAppend}"
>
  <path d="m3 8 4-4 4 4" />
  <path d="M7 4v16" />
  <path d="M11 12h10" />
  <path d="M11 16h7" />
  <path d="M11 20h4" />
</svg>
