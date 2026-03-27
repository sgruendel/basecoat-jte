<%-- see https://lucide.dev/icons/building --%>

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
  class="lucide lucide-building-icon lucide-building ${classAppend}"
>
  <path d="M12 10h.01" />
  <path d="M12 14h.01" />
  <path d="M12 6h.01" />
  <path d="M16 10h.01" />
  <path d="M16 14h.01" />
  <path d="M16 6h.01" />
  <path d="M8 10h.01" />
  <path d="M8 14h.01" />
  <path d="M8 6h.01" />
  <path d="M9 22v-3a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v3" />
  <rect x="4" y="2" width="16" height="20" rx="2" />
</svg>
