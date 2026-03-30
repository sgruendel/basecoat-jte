<%-- see https://lucide.dev/icons/send-to-back --%>

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
  class="lucide lucide-send-to-back-icon lucide-send-to-back ${classAppend}"
>
    <rect x="14" y="14" width="8" height="8" rx="2" />
  <rect x="2" y="2" width="8" height="8" rx="2" />
  <path d="M7 14v1a2 2 0 0 0 2 2h1" />
  <path d="M14 7h1a2 2 0 0 1 2 2v1" />
</svg>
