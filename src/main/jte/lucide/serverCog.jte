<%-- see https://lucide.dev/icons/server-cog --%>

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
  class="lucide lucide-server-cog-icon lucide-server-cog ${classAppend}"
  role="${role}"
  aria-label="${ariaLabel}"
  aria-hidden="${ariaHidden}"
  focusable="${focusable}"
>
    <path d="m10.852 14.772-.383.923" />
  <path d="M13.148 14.772a3 3 0 1 0-2.296-5.544l-.383-.923" />
  <path d="m13.148 9.228.383-.923" />
  <path d="m13.53 15.696-.382-.924a3 3 0 1 1-2.296-5.544" />
  <path d="m14.772 10.852.923-.383" />
  <path d="m14.772 13.148.923.383" />
  <path d="M4.5 10H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v4a2 2 0 0 1-2 2h-.5" />
  <path d="M4.5 14H4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2h-.5" />
  <path d="M6 18h.01" />
  <path d="M6 6h.01" />
  <path d="m9.228 10.852-.923-.383" />
  <path d="m9.228 13.148-.923.383" />
</svg>
