<%-- see https://lucide.dev/icons/equal-approximately --%>

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
  class="lucide lucide-equal-approximately-icon lucide-equal-approximately ${classAppend}"
>
    <path d="M5 15a6.5 6.5 0 0 1 7 0 6.5 6.5 0 0 0 7 0" />
  <path d="M5 9a6.5 6.5 0 0 1 7 0 6.5 6.5 0 0 0 7 0" />
</svg>
