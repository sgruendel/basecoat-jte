<%-- see https://lucide.dev/icons/power-off --%>

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
  class="lucide lucide-power-off-icon lucide-power-off ${classAppend}"
>
    <path d="M18.36 6.64A9 9 0 0 1 20.77 15" />
  <path d="M6.16 6.16a9 9 0 1 0 12.68 12.68" />
  <path d="M12 2v4" />
  <path d="m2 2 20 20" />
</svg>
