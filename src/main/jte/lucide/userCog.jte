<%-- see https://lucide.dev/icons/user-cog --%>

@param String classAppend = null
@param int size = 24
@param String color = "currentColor"
@param int strokeWidth = 2
@param boolean absoluteStrokeWidth = false

<%-- see https://github.com/lucide-icons/lucide/blob/main/packages/vue/src/Icon.ts#L50 --%>
!{ final var calculatedStrokeWidth = absoluteStrokeWidth ? Double.toString(strokeWidth * 24.0 / size) : Integer.toString(strokeWidth); }

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
  class="lucide lucide-user-cog-icon lucide-user-cog ${classAppend}"
>
  <path d="M10 15H6a4 4 0 0 0-4 4v2" />
  <path d="m14.305 16.53.923-.382" />
  <path d="m15.228 13.852-.923-.383" />
  <path d="m16.852 12.228-.383-.923" />
  <path d="m16.852 17.772-.383.924" />
  <path d="m19.148 12.228.383-.923" />
  <path d="m19.53 18.696-.382-.924" />
  <path d="m20.772 13.852.924-.383" />
  <path d="m20.772 16.148.924.383" />
  <circle cx="18" cy="15" r="3" />
  <circle cx="9" cy="7" r="4" />
</svg>
