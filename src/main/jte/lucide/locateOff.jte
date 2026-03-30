<%-- see https://lucide.dev/icons/locate-off --%>

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
  class="lucide lucide-locate-off-icon lucide-locate-off ${classAppend}"
>
  <path d="M12 19v3" />
  <path d="M12 2v3" />
  <path d="M18.89 13.24a7 7 0 0 0-8.13-8.13" />
  <path d="M19 12h3" />
  <path d="M2 12h3" />
  <path d="m2 2 20 20" />
  <path d="M7.05 7.05a7 7 0 0 0 9.9 9.9" />
</svg>
