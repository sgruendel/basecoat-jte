<%-- see https://lucide.dev/icons/image-upscale --%>

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
  class="lucide lucide-image-upscale-icon lucide-image-upscale ${classAppend}"
>
  <path d="M16 3h5v5" />
  <path d="M17 21h2a2 2 0 0 0 2-2" />
  <path d="M21 12v3" />
  <path d="m21 3-5 5" />
  <path d="M3 7V5a2 2 0 0 1 2-2" />
  <path d="m5 21 4.144-4.144a1.21 1.21 0 0 1 1.712 0L13 19" />
  <path d="M9 3h3" />
  <rect x="3" y="11" width="10" height="10" rx="1" />
</svg>
