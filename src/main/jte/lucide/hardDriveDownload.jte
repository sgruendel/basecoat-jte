<%-- see https://lucide.dev/icons/hard-drive-download --%>

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
  class="lucide lucide-hard-drive-download-icon lucide-hard-drive-download ${classAppend}"
>
  <path d="M12 2v8" />
  <path d="m16 6-4 4-4-4" />
  <rect width="20" height="8" x="2" y="14" rx="2" />
  <path d="M6 18h.01" />
  <path d="M10 18h.01" />
</svg>
