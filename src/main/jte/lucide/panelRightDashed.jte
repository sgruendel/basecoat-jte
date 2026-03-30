<%-- see https://lucide.dev/icons/panel-right-dashed --%>

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
  class="lucide lucide-panel-right-dashed-icon lucide-panel-right-dashed ${classAppend}"
>
    <rect width="18" height="18" x="3" y="3" rx="2" />
  <path d="M15 14v1" />
  <path d="M15 19v2" />
  <path d="M15 3v2" />
  <path d="M15 9v1" />
</svg>
