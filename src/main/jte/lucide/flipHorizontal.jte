<%-- see https://lucide.dev/icons/square-centerline-dashed-horizontal --%>

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
  class="lucide lucide-square-centerline-dashed-horizontal-icon lucide-square-centerline-dashed-horizontal ${classAppend}"
>
    <path d="M8 3H5a2 2 0 0 0-2 2v14c0 1.1.9 2 2 2h3" />
  <path d="M16 3h3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-3" />
  <path d="M12 20v2" />
  <path d="M12 14v2" />
  <path d="M12 8v2" />
  <path d="M12 2v2" />
</svg>
