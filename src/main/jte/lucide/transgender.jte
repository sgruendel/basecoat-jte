<%-- see https://lucide.dev/icons/transgender --%>

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
  class="lucide lucide-transgender-icon lucide-transgender ${classAppend}"
>
  <path d="M12 16v6" />
  <path d="M14 20h-4" />
  <path d="M18 2h4v4" />
  <path d="m2 2 7.17 7.17" />
  <path d="M2 5.355V2h3.357" />
  <path d="m22 2-7.17 7.17" />
  <path d="M8 5 5 8" />
  <circle cx="12" cy="12" r="4" />
</svg>
