<%-- see https://lucide.dev/icons/cigarette-off --%>

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
  class="lucide lucide-cigarette-off-icon lucide-cigarette-off ${classAppend}"
>
  <path d="M12 12H3a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h13" />
  <path d="M18 8c0-2.5-2-2.5-2-5" />
  <path d="m2 2 20 20" />
  <path d="M21 12a1 1 0 0 1 1 1v2a1 1 0 0 1-.5.866" />
  <path d="M22 8c0-2.5-2-2.5-2-5" />
  <path d="M7 12v4" />
</svg>
