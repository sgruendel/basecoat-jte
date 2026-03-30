<%-- see https://lucide.dev/icons/keyboard-off --%>

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
  class="lucide lucide-keyboard-off-icon lucide-keyboard-off ${classAppend}"
>
  <path d="M 20 4 A2 2 0 0 1 22 6" />
  <path d="M 22 6 L 22 16.41" />
  <path d="M 7 16 L 16 16" />
  <path d="M 9.69 4 L 20 4" />
  <path d="M14 8h.01" />
  <path d="M18 8h.01" />
  <path d="m2 2 20 20" />
  <path d="M20 20H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2" />
  <path d="M6 8h.01" />
  <path d="M8 12h.01" />
</svg>
