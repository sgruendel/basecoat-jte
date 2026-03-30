<%-- see https://lucide.dev/icons/table-of-contents --%>

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
  class="lucide lucide-table-of-contents-icon lucide-table-of-contents ${classAppend}"
>
    <path d="M16 5H3" />
  <path d="M16 12H3" />
  <path d="M16 19H3" />
  <path d="M21 5h.01" />
  <path d="M21 12h.01" />
  <path d="M21 19h.01" />
</svg>
