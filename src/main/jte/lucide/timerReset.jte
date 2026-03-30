<%-- see https://lucide.dev/icons/timer-reset --%>

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
  class="lucide lucide-timer-reset-icon lucide-timer-reset ${classAppend}"
>
    <path d="M10 2h4" />
  <path d="M12 14v-4" />
  <path d="M4 13a8 8 0 0 1 8-7 8 8 0 1 1-5.3 14L4 17.6" />
  <path d="M9 17H4v5" />
</svg>
