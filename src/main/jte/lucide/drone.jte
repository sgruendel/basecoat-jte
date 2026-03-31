<%-- see https://lucide.dev/icons/drone --%>

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
  class="lucide lucide-drone-icon lucide-drone ${classAppend}"
  role="${role}"
  aria-label="${ariaLabel}"
  aria-hidden="${ariaHidden}"
  focusable="${focusable}"
>
    <path d="M10 10 7 7" />
  <path d="m10 14-3 3" />
  <path d="m14 10 3-3" />
  <path d="m14 14 3 3" />
  <path d="M14.205 4.139a4 4 0 1 1 5.439 5.863" />
  <path d="M19.637 14a4 4 0 1 1-5.432 5.868" />
  <path d="M4.367 10a4 4 0 1 1 5.438-5.862" />
  <path d="M9.795 19.862a4 4 0 1 1-5.429-5.873" />
  <rect x="10" y="8" width="4" height="8" rx="1" />
</svg>
