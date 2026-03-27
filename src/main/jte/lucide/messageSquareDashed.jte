<%-- see https://lucide.dev/icons/message-square-dashed --%>

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
  class="lucide lucide-message-square-dashed-icon lucide-message-square-dashed ${classAppend}"
>
  <path d="M14 3h2" />
  <path d="M16 19h-2" />
  <path d="M2 12v-2" />
  <path d="M2 16v5.286a.71.71 0 0 0 1.212.502l1.149-1.149" />
  <path d="M20 19a2 2 0 0 0 2-2v-1" />
  <path d="M22 10v2" />
  <path d="M22 6V5a2 2 0 0 0-2-2" />
  <path d="M4 3a2 2 0 0 0-2 2v1" />
  <path d="M8 19h2" />
  <path d="M8 3h2" />
</svg>
