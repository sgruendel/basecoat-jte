<%-- see https://lucide.dev/icons/smartphone-nfc --%>

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
  class="lucide lucide-smartphone-nfc-icon lucide-smartphone-nfc ${classAppend}"
>
  <rect width="7" height="12" x="2" y="6" rx="1" />
  <path d="M13 8.32a7.43 7.43 0 0 1 0 7.36" />
  <path d="M16.46 6.21a11.76 11.76 0 0 1 0 11.58" />
  <path d="M19.91 4.1a15.91 15.91 0 0 1 .01 15.8" />
</svg>
