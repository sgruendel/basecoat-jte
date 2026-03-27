<%-- see https://lucide.dev/icons/tangent --%>

@import static LucideUtils.calculatedStrokeWidth

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<svg
  xmlns="http://www.w3.org/2000/svg"
  width="${size}"
  height="${size}"
  viewBox="0 0 24 24"
  fill="none"
  stroke="${color}"
  stroke-width="${calculatedStrokeWidth(size, strokeWidth, absoluteStrokeWidth)}"
  stroke-linecap="round"
  stroke-linejoin="round"
  class="lucide lucide-tangent-icon lucide-tangent ${classAppend}"
>
  <circle cx="17" cy="4" r="2" />
  <path d="M15.59 5.41 5.41 15.59" />
  <circle cx="4" cy="17" r="2" />
  <path d="M12 22s-4-9-1.5-11.5S22 12 22 12" />
</svg>
