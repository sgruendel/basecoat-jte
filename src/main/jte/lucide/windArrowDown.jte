<%-- see https://lucide.dev/icons/wind-arrow-down --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<%-- see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50 --%>
!{ final var calculatedStrokeWidth = absoluteStrokeWidth ? Double.toString(strokeWidth * 24.0 / size) : Integer.toString(strokeWidth); }

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
  class="lucide lucide-wind-arrow-down-icon lucide-wind-arrow-down ${classAppend}"
>
  <path d="M10 2v8" />
  <path d="M12.8 21.6A2 2 0 1 0 14 18H2" />
  <path d="M17.5 10a2.5 2.5 0 1 1 2 4H2" />
  <path d="m6 6 4 4 4-4" />
</svg>
