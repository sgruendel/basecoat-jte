<%-- see https://lucide.dev/icons/bike --%>

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
  class="lucide lucide-bike-icon lucide-bike ${classAppend}"
>
    <circle cx="18.5" cy="17.5" r="3.5" />
  <circle cx="5.5" cy="17.5" r="3.5" />
  <circle cx="15" cy="5" r="1" />
  <path d="M12 17.5V14l-3-3 4-3 2 3h2" />
</svg>
