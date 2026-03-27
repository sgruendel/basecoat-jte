<%-- see https://lucide.dev/icons/podcast --%>

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
  class="lucide lucide-podcast-icon lucide-podcast ${classAppend}"
>
  <path d="M13 17a1 1 0 1 0-2 0l.5 4.5a0.5 0.5 0 0 0 1 0z" fill="currentColor" />
  <path d="M16.85 18.58a9 9 0 1 0-9.7 0" />
  <path d="M8 14a5 5 0 1 1 8 0" />
  <circle cx="12" cy="11" r="1" fill="currentColor" />
</svg>
