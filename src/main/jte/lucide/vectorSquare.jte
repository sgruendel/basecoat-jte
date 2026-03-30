<%-- see https://lucide.dev/icons/vector-square --%>

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
  class="lucide lucide-vector-square-icon lucide-vector-square ${classAppend}"
>
    <path d="M19.5 7a24 24 0 0 1 0 10" />
  <path d="M4.5 7a24 24 0 0 0 0 10" />
  <path d="M7 19.5a24 24 0 0 0 10 0" />
  <path d="M7 4.5a24 24 0 0 1 10 0" />
  <rect x="17" y="17" width="5" height="5" rx="1" />
  <rect x="17" y="2" width="5" height="5" rx="1" />
  <rect x="2" y="17" width="5" height="5" rx="1" />
  <rect x="2" y="2" width="5" height="5" rx="1" />
</svg>
