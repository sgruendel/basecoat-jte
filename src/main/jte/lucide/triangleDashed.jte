<%-- see https://lucide.dev/icons/triangle-dashed --%>

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
  class="lucide lucide-triangle-dashed-icon lucide-triangle-dashed ${classAppend}"
>
    <path d="M10.17 4.193a2 2 0 0 1 3.666.013" />
  <path d="M14 21h2" />
  <path d="m15.874 7.743 1 1.732" />
  <path d="m18.849 12.952 1 1.732" />
  <path d="M21.824 18.18a2 2 0 0 1-1.835 2.824" />
  <path d="M4.024 21a2 2 0 0 1-1.839-2.839" />
  <path d="m5.136 12.952-1 1.732" />
  <path d="M8 21h2" />
  <path d="m8.102 7.743-1 1.732" />
</svg>
