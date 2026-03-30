<%-- see https://lucide.dev/icons/clock-alert --%>

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
  class="lucide lucide-clock-alert-icon lucide-clock-alert ${classAppend}"
>
  <path d="M12 6v6l4 2" />
  <path d="M20 12v5" />
  <path d="M20 21h.01" />
  <path d="M21.25 8.2A10 10 0 1 0 16 21.16" />
</svg>
