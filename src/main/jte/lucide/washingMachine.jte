<%-- see https://lucide.dev/icons/washing-machine --%>

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
  class="lucide lucide-washing-machine-icon lucide-washing-machine ${classAppend}"
>
    <path d="M3 6h3" />
  <path d="M17 6h.01" />
  <rect width="18" height="20" x="3" y="2" rx="2" />
  <circle cx="12" cy="13" r="5" />
  <path d="M12 18a2.5 2.5 0 0 0 0-5 2.5 2.5 0 0 1 0-5" />
</svg>
