<%-- see https://lucide.dev/icons/message-circle-dashed --%>

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
  class="lucide lucide-message-circle-dashed-icon lucide-message-circle-dashed ${classAppend}"
>
    <path d="M10.1 2.182a10 10 0 0 1 3.8 0" />
  <path d="M13.9 21.818a10 10 0 0 1-3.8 0" />
  <path d="M17.609 3.72a10 10 0 0 1 2.69 2.7" />
  <path d="M2.182 13.9a10 10 0 0 1 0-3.8" />
  <path d="M20.28 17.61a10 10 0 0 1-2.7 2.69" />
  <path d="M21.818 10.1a10 10 0 0 1 0 3.8" />
  <path d="M3.721 6.391a10 10 0 0 1 2.7-2.69" />
  <path d="m6.163 21.117-2.906.85a1 1 0 0 1-1.236-1.169l.965-2.98" />
</svg>
