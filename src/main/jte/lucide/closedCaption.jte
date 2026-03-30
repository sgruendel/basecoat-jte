<%-- see https://lucide.dev/icons/closed-caption --%>

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
  class="lucide lucide-closed-caption-icon lucide-closed-caption ${classAppend}"
>
    <path d="M10 9.17a3 3 0 1 0 0 5.66" />
  <path d="M17 9.17a3 3 0 1 0 0 5.66" />
  <rect x="2" y="5" width="20" height="14" rx="2" />
</svg>
