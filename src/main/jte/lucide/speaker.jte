<%-- see https://lucide.dev/icons/speaker --%>

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
  class="lucide lucide-speaker-icon lucide-speaker ${classAppend}"
>
  <rect width="16" height="20" x="4" y="2" rx="2" />
  <path d="M12 6h.01" />
  <circle cx="12" cy="14" r="4" />
  <path d="M12 14h.01" />
</svg>
