<%-- see https://lucide.dev/icons/route-off --%>

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
  class="lucide lucide-route-off-icon lucide-route-off ${classAppend}"
>
    <circle cx="6" cy="19" r="3" />
  <path d="M9 19h8.5c.4 0 .9-.1 1.3-.2" />
  <path d="M5.2 5.2A3.5 3.53 0 0 0 6.5 12H12" />
  <path d="m2 2 20 20" />
  <path d="M21 15.3a3.5 3.5 0 0 0-3.3-3.3" />
  <path d="M15 5h-4.3" />
  <circle cx="18" cy="5" r="3" />
</svg>
