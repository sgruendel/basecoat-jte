<%-- see https://lucide.dev/icons/georgian-lari --%>

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
  class="lucide lucide-georgian-lari-icon lucide-georgian-lari ${classAppend}"
>
  <path d="M11.5 21a7.5 7.5 0 1 1 7.35-9" />
  <path d="M13 12V3" />
  <path d="M4 21h16" />
  <path d="M9 12V3" />
</svg>
