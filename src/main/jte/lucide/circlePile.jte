<%-- see https://lucide.dev/icons/circle-pile --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false
@param String role = null
@param String ariaLabel = null
@param Boolean ariaHidden = null
@param Boolean focusable = null

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
  class="lucide lucide-circle-pile-icon lucide-circle-pile ${classAppend}"
  role="${role}"
  aria-label="${ariaLabel}"
  aria-hidden="${ariaHidden}"
  focusable="${focusable}"
>
    <circle cx="12" cy="19" r="2" />
  <circle cx="12" cy="5" r="2" />
  <circle cx="16" cy="12" r="2" />
  <circle cx="20" cy="19" r="2" />
  <circle cx="4" cy="19" r="2" />
  <circle cx="8" cy="12" r="2" />
</svg>
