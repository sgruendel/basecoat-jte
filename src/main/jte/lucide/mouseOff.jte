<%-- see https://lucide.dev/icons/mouse-off --%>

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
  class="lucide lucide-mouse-off-icon lucide-mouse-off ${classAppend}"
>
    <path d="M12 6v.343" />
  <path d="M18.218 18.218A7 7 0 0 1 5 15V9a7 7 0 0 1 .782-3.218" />
  <path d="M19 13.343V9A7 7 0 0 0 8.56 2.902" />
  <path d="M22 22 2 2" />
</svg>
