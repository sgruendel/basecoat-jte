<%-- see https://lucide.dev/icons/laptop-minimal-check --%>

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
  class="lucide lucide-laptop-minimal-check-icon lucide-laptop-minimal-check ${classAppend}"
>
  <path d="M2 20h20" />
  <path d="m9 10 2 2 4-4" />
  <rect x="3" y="4" width="18" height="12" rx="2" />
</svg>
