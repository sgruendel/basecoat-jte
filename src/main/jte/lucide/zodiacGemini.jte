<%-- see https://lucide.dev/icons/zodiac-gemini --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<%-- see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50 --%>
!{ final var calculatedStrokeWidth = absoluteStrokeWidth ? Double.toString(strokeWidth * 24.0 / size) : Integer.toString(strokeWidth); }

<svg
  xmlns="http://www.w3.org/2000/svg"
  width="${size}"
  height="${size}"
  viewBox="0 0 24 24"
  fill="none"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="lucide lucide-zodiac-gemini-icon lucide-zodiac-gemini ${classAppend}"
>
  <path d="M16 4.525v14.948" />
  <path d="M20 3A17 17 0 0 1 4 3" />
  <path d="M4 21a17 17 0 0 1 16 0" />
  <path d="M8 4.525v14.948" />
</svg>
