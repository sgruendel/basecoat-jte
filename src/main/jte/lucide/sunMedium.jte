<%-- see https://lucide.dev/icons/sun-medium --%>

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
  class="lucide lucide-sun-medium-icon lucide-sun-medium ${classAppend}"
  role="${role}"
  aria-label="${ariaLabel}"
  aria-hidden="${ariaHidden}"
  focusable="${focusable}"
>
    <circle cx="12" cy="12" r="4" />
  <path d="M12 3v1" />
  <path d="M12 20v1" />
  <path d="M3 12h1" />
  <path d="M20 12h1" />
  <path d="m18.364 5.636-.707.707" />
  <path d="m6.343 17.657-.707.707" />
  <path d="m5.636 5.636.707.707" />
  <path d="m17.657 17.657.707.707" />
</svg>
