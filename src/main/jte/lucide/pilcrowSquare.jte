<%-- see https://lucide.dev/icons/square-pilcrow --%>

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
  class="lucide lucide-square-pilcrow-icon lucide-square-pilcrow ${classAppend}"
>
    <rect width="18" height="18" x="3" y="3" rx="2" />
  <path d="M12 12H9.5a2.5 2.5 0 0 1 0-5H17" />
  <path d="M12 7v10" />
  <path d="M16 7v10" />
</svg>
