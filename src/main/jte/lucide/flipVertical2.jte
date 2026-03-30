<%-- see https://lucide.dev/icons/flip-vertical-2 --%>

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
  class="lucide lucide-flip-vertical-2-icon lucide-flip-vertical-2 ${classAppend}"
>
    <path d="m17 3-5 5-5-5h10" />
  <path d="m17 21-5-5-5 5h10" />
  <path d="M4 12H2" />
  <path d="M10 12H8" />
  <path d="M16 12h-2" />
  <path d="M22 12h-2" />
</svg>
