<%-- see https://lucide.dev/icons/layout-dashboard --%>

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
  class="lucide lucide-layout-dashboard-icon lucide-layout-dashboard ${classAppend}"
>
    <rect width="7" height="9" x="3" y="3" rx="1" />
  <rect width="7" height="5" x="14" y="3" rx="1" />
  <rect width="7" height="9" x="14" y="12" rx="1" />
  <rect width="7" height="5" x="3" y="16" rx="1" />
</svg>
