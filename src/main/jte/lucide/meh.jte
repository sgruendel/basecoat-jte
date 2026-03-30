<%-- see https://lucide.dev/icons/meh --%>

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
  class="lucide lucide-meh-icon lucide-meh ${classAppend}"
>
    <circle cx="12" cy="12" r="10" />
  <line x1="8" x2="16" y1="15" y2="15" />
  <line x1="9" x2="9.01" y1="9" y2="9" />
  <line x1="15" x2="15.01" y1="9" y2="9" />
</svg>
