<%-- see https://lucide.dev/icons/angry --%>

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
  class="lucide lucide-angry-icon lucide-angry ${classAppend}"
>
    <circle cx="12" cy="12" r="10" />
  <path d="M16 16s-1.5-2-4-2-4 2-4 2" />
  <path d="M7.5 8 10 9" />
  <path d="m14 9 2.5-1" />
  <path d="M9 10h.01" />
  <path d="M15 10h.01" />
</svg>
