<%-- see https://lucide.dev/icons/square-split-vertical --%>

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
  class="lucide lucide-square-split-vertical-icon lucide-square-split-vertical ${classAppend}"
>
    <path d="M5 8V5c0-1 1-2 2-2h10c1 0 2 1 2 2v3" />
  <path d="M19 16v3c0 1-1 2-2 2H7c-1 0-2-1-2-2v-3" />
  <line x1="4" x2="20" y1="12" y2="12" />
</svg>
