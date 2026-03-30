<%-- see https://lucide.dev/icons/baggage-claim --%>

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
  class="lucide lucide-baggage-claim-icon lucide-baggage-claim ${classAppend}"
>
    <path d="M22 18H6a2 2 0 0 1-2-2V7a2 2 0 0 0-2-2" />
  <path d="M17 14V4a2 2 0 0 0-2-2h-1a2 2 0 0 0-2 2v10" />
  <rect width="13" height="8" x="8" y="6" rx="1" />
  <circle cx="18" cy="20" r="2" />
  <circle cx="9" cy="20" r="2" />
</svg>
