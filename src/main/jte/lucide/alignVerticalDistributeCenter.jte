<%-- see https://lucide.dev/icons/align-vertical-distribute-center --%>

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
  class="lucide lucide-align-vertical-distribute-center-icon lucide-align-vertical-distribute-center ${classAppend}"
>
    <path d="M22 17h-3" />
  <path d="M22 7h-5" />
  <path d="M5 17H2" />
  <path d="M7 7H2" />
  <rect x="5" y="14" width="14" height="6" rx="2" />
  <rect x="7" y="4" width="10" height="6" rx="2" />
</svg>
