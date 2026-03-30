<%-- see https://lucide.dev/icons/locate-fixed --%>

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
  class="lucide lucide-locate-fixed-icon lucide-locate-fixed ${classAppend}"
>
    <line x1="2" x2="5" y1="12" y2="12" />
  <line x1="19" x2="22" y1="12" y2="12" />
  <line x1="12" x2="12" y1="2" y2="5" />
  <line x1="12" x2="12" y1="19" y2="22" />
  <circle cx="12" cy="12" r="7" />
  <circle cx="12" cy="12" r="3" />
</svg>
