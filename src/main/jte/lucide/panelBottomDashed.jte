<%-- see https://lucide.dev/icons/panel-bottom-dashed --%>

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
  class="lucide lucide-panel-bottom-dashed-icon lucide-panel-bottom-dashed ${classAppend}"
>
    <rect width="18" height="18" x="3" y="3" rx="2" />
  <path d="M14 15h1" />
  <path d="M19 15h2" />
  <path d="M3 15h2" />
  <path d="M9 15h1" />
</svg>
