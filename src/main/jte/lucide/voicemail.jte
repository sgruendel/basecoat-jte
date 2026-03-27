<%-- see https://lucide.dev/icons/voicemail --%>

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
  class="lucide lucide-voicemail-icon lucide-voicemail ${classAppend}"
>
  <circle cx="6" cy="12" r="4" />
  <circle cx="18" cy="12" r="4" />
  <line x1="6" x2="18" y1="16" y2="16" />
</svg>
