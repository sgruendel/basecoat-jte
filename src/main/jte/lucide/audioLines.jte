<%-- see https://lucide.dev/icons/audio-lines --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<%-- see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50 --%>
!{final var calculatedStrokeWidth = absoluteStrokeWidth ? Double.toString(strokeWidth * 24.0 / size) : Integer.toString(strokeWidth);}

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
  class="lucide lucide-audio-lines-icon lucide-audio-lines ${classAppend}"
>
    <path d="M2 10v3" />
  <path d="M6 6v11" />
  <path d="M10 3v18" />
  <path d="M14 8v7" />
  <path d="M18 5v13" />
  <path d="M22 10v3" />
</svg>
