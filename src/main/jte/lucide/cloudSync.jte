<%-- see https://lucide.dev/icons/cloud-sync --%>

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
  class="lucide lucide-cloud-sync-icon lucide-cloud-sync ${classAppend}"
>
    <path d="m17 18-1.535 1.605a5 5 0 0 1-8-1.5" />
  <path d="M17 22v-4h-4" />
  <path d="M20.996 15.251A4.5 4.5 0 0 0 17.495 8h-1.79a7 7 0 1 0-12.709 5.607" />
  <path d="M7 10v4h4" />
  <path d="m7 14 1.535-1.605a5 5 0 0 1 8 1.5" />
</svg>
