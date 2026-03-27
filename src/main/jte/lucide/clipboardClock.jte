<%-- see https://lucide.dev/icons/clipboard-clock --%>

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
  class="lucide lucide-clipboard-clock-icon lucide-clipboard-clock ${classAppend}"
>
  <path d="M16 14v2.2l1.6 1" />
  <path d="M16 4h2a2 2 0 0 1 2 2v.832" />
  <path d="M8 4H6a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h2" />
  <circle cx="16" cy="16" r="6" />
  <rect x="8" y="2" width="8" height="4" rx="1" />
</svg>
