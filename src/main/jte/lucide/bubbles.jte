<%-- see https://lucide.dev/icons/bubbles --%>

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
  class="lucide lucide-bubbles-icon lucide-bubbles ${classAppend}"
>
    <path d="M7.001 15.085A1.5 1.5 0 0 1 9 16.5" />
  <circle cx="18.5" cy="8.5" r="3.5" />
  <circle cx="7.5" cy="16.5" r="5.5" />
  <circle cx="7.5" cy="4.5" r="2.5" />
</svg>
