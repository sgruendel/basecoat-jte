<%-- see https://lucide.dev/icons/scale-3d --%>

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
  class="lucide lucide-scale-3d-icon lucide-scale-3d ${classAppend}"
>
    <path d="M5 7v11a1 1 0 0 0 1 1h11" />
  <path d="M5.293 18.707 11 13" />
  <circle cx="19" cy="19" r="2" />
  <circle cx="5" cy="5" r="2" />
</svg>
