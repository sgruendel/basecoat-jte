<%-- see https://lucide.dev/icons/gallery-horizontal-end --%>

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
  class="lucide lucide-gallery-horizontal-end-icon lucide-gallery-horizontal-end ${classAppend}"
>
  <path d="M2 7v10" />
  <path d="M6 5v14" />
  <rect width="12" height="18" x="10" y="3" rx="2" />
</svg>
