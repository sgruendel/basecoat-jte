<%-- see https://lucide.dev/icons/utility-pole --%>

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
  class="lucide lucide-utility-pole-icon lucide-utility-pole ${classAppend}"
>
  <path d="M12 2v20" />
  <path d="M2 5h20" />
  <path d="M3 3v2" />
  <path d="M7 3v2" />
  <path d="M17 3v2" />
  <path d="M21 3v2" />
  <path d="m19 5-7 7-7-7" />
</svg>
