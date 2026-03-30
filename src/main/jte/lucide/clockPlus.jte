<%-- see https://lucide.dev/icons/clock-plus --%>

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
  class="lucide lucide-clock-plus-icon lucide-clock-plus ${classAppend}"
>
    <path d="M12 6v6l3.644 1.822" />
  <path d="M16 19h6" />
  <path d="M19 16v6" />
  <path d="M21.92 13.267a10 10 0 1 0-8.653 8.653" />
</svg>
