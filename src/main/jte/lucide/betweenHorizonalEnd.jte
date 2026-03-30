<%-- see https://lucide.dev/icons/between-horizontal-end --%>

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
  class="lucide lucide-between-horizontal-end-icon lucide-between-horizontal-end ${classAppend}"
>
    <rect width="13" height="7" x="3" y="3" rx="1" />
  <path d="m22 15-3-3 3-3" />
  <rect width="13" height="7" x="3" y="14" rx="1" />
</svg>
