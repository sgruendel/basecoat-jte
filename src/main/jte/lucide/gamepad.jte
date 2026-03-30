<%-- see https://lucide.dev/icons/gamepad --%>

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
  class="lucide lucide-gamepad-icon lucide-gamepad ${classAppend}"
>
  <line x1="6" x2="10" y1="12" y2="12" />
  <line x1="8" x2="8" y1="10" y2="14" />
  <line x1="15" x2="15.01" y1="13" y2="13" />
  <line x1="18" x2="18.01" y1="11" y2="11" />
  <rect width="20" height="12" x="2" y="6" rx="2" />
</svg>
