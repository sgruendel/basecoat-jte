<%-- see https://lucide.dev/icons/gallery-vertical-end --%>

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
  class="lucide lucide-gallery-vertical-end-icon lucide-gallery-vertical-end ${classAppend}"
>
  <path d="M7 2h10" />
  <path d="M5 6h14" />
  <rect width="18" height="12" x="3" y="10" rx="2" />
</svg>
