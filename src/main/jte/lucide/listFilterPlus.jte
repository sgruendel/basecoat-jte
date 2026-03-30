<%-- see https://lucide.dev/icons/list-filter-plus --%>

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
  class="lucide lucide-list-filter-plus-icon lucide-list-filter-plus ${classAppend}"
>
  <path d="M12 5H2" />
  <path d="M6 12h12" />
  <path d="M9 19h6" />
  <path d="M16 5h6" />
  <path d="M19 8V2" />
</svg>
