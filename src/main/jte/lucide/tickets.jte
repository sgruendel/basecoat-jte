<%-- see https://lucide.dev/icons/tickets --%>

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
  class="lucide lucide-tickets-icon lucide-tickets ${classAppend}"
>
  <path d="m3.173 8.18 11-5a2 2 0 0 1 2.647.993L18.56 8" />
  <path d="M6 10V8" />
  <path d="M6 14v1" />
  <path d="M6 19v2" />
  <rect x="2" y="8" width="20" height="13" rx="2" />
</svg>
