<%-- see https://lucide.dev/icons/list-start --%>

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
  class="lucide lucide-list-start-icon lucide-list-start ${classAppend}"
>
    <path d="M3 5h6" />
  <path d="M3 12h13" />
  <path d="M3 19h13" />
  <path d="m16 8-3-3 3-3" />
  <path d="M21 19V7a2 2 0 0 0-2-2h-6" />
</svg>
