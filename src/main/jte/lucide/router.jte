<%-- see https://lucide.dev/icons/router --%>

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
  class="lucide lucide-router-icon lucide-router ${classAppend}"
>
  <rect width="20" height="8" x="2" y="14" rx="2" />
  <path d="M6.01 18H6" />
  <path d="M10.01 18H10" />
  <path d="M15 10v4" />
  <path d="M17.84 7.17a4 4 0 0 0-5.66 0" />
  <path d="M20.66 4.34a8 8 0 0 0-11.31 0" />
</svg>
