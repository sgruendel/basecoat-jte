<%-- see https://lucide.dev/icons/castle --%>

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
  class="lucide lucide-castle-icon lucide-castle ${classAppend}"
>
  <path d="M10 5V3" />
  <path d="M14 5V3" />
  <path d="M15 21v-3a3 3 0 0 0-6 0v3" />
  <path d="M18 3v8" />
  <path d="M18 5H6" />
  <path d="M22 11H2" />
  <path d="M22 9v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V9" />
  <path d="M6 3v8" />
</svg>
