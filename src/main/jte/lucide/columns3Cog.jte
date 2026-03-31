<%-- see https://lucide.dev/icons/columns-3-cog --%>

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
  class="lucide lucide-columns-3-cog-icon lucide-columns-3-cog ${classAppend}"
  role="${role}"
  aria-label="${ariaLabel}"
  aria-hidden="${ariaHidden}"
  focusable="${focusable}"
>
    <path d="M10.5 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2v5.5" />
  <path d="m14.3 19.6 1-.4" />
  <path d="M15 3v7.5" />
  <path d="m15.2 16.9-.9-.3" />
  <path d="m16.6 21.7.3-.9" />
  <path d="m16.8 15.3-.4-1" />
  <path d="m19.1 15.2.3-.9" />
  <path d="m19.6 21.7-.4-1" />
  <path d="m20.7 16.8 1-.4" />
  <path d="m21.7 19.4-.9-.3" />
  <path d="M9 3v18" />
  <circle cx="18" cy="18" r="3" />
</svg>
