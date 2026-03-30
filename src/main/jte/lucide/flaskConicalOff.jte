<%-- see https://lucide.dev/icons/flask-conical-off --%>

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
  class="lucide lucide-flask-conical-off-icon lucide-flask-conical-off ${classAppend}"
>
    <path d="M10 2v2.343" />
  <path d="M14 2v6.343" />
  <path d="m2 2 20 20" />
  <path d="M20 20a2 2 0 0 1-2 2H6a2 2 0 0 1-1.755-2.96l5.227-9.563" />
  <path d="M6.453 15H15" />
  <path d="M8.5 2h7" />
</svg>
