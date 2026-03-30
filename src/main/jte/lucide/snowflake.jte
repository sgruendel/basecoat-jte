<%-- see https://lucide.dev/icons/snowflake --%>

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
  class="lucide lucide-snowflake-icon lucide-snowflake ${classAppend}"
>
    <path d="m10 20-1.25-2.5L6 18" />
  <path d="M10 4 8.75 6.5 6 6" />
  <path d="m14 20 1.25-2.5L18 18" />
  <path d="m14 4 1.25 2.5L18 6" />
  <path d="m17 21-3-6h-4" />
  <path d="m17 3-3 6 1.5 3" />
  <path d="M2 12h6.5L10 9" />
  <path d="m20 10-1.5 2 1.5 2" />
  <path d="M22 12h-6.5L14 15" />
  <path d="m4 10 1.5 2L4 14" />
  <path d="m7 21 3-6-1.5-3" />
  <path d="m7 3 3 6h4" />
</svg>
