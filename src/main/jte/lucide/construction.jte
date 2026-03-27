<%-- see https://lucide.dev/icons/construction --%>

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
  class="lucide lucide-construction-icon lucide-construction ${classAppend}"
>
  <rect x="2" y="6" width="20" height="8" rx="1" />
  <path d="M17 14v7" />
  <path d="M7 14v7" />
  <path d="M17 3v3" />
  <path d="M7 3v3" />
  <path d="M10 14 2.3 6.3" />
  <path d="m14 6 7.7 7.7" />
  <path d="m8 6 8 8" />
</svg>
