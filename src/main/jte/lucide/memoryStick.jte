<%-- see https://lucide.dev/icons/memory-stick --%>

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
  class="lucide lucide-memory-stick-icon lucide-memory-stick ${classAppend}"
>
  <path d="M12 12v-2" />
  <path d="M12 18v-2" />
  <path d="M16 12v-2" />
  <path d="M16 18v-2" />
  <path d="M2 11h1.5" />
  <path d="M20 18v-2" />
  <path d="M20.5 11H22" />
  <path d="M4 18v-2" />
  <path d="M8 12v-2" />
  <path d="M8 18v-2" />
  <rect x="2" y="6" width="20" height="10" rx="2" />
</svg>
