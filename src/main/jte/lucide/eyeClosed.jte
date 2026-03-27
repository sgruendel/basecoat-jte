<%-- see https://lucide.dev/icons/eye-closed --%>

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
  class="lucide lucide-eye-closed-icon lucide-eye-closed ${classAppend}"
>
  <path d="m15 18-.722-3.25" />
  <path d="M2 8a10.645 10.645 0 0 0 20 0" />
  <path d="m20 15-1.726-2.05" />
  <path d="m4 15 1.726-2.05" />
  <path d="m9 18 .722-3.25" />
</svg>
