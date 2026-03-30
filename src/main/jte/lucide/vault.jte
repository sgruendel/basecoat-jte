<%-- see https://lucide.dev/icons/vault --%>

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
  class="lucide lucide-vault-icon lucide-vault ${classAppend}"
>
    <rect width="18" height="18" x="3" y="3" rx="2" />
  <circle cx="7.5" cy="7.5" r=".5" fill="currentColor" />
  <path d="m7.9 7.9 2.7 2.7" />
  <circle cx="16.5" cy="7.5" r=".5" fill="currentColor" />
  <path d="m13.4 10.6 2.7-2.7" />
  <circle cx="7.5" cy="16.5" r=".5" fill="currentColor" />
  <path d="m7.9 16.1 2.7-2.7" />
  <circle cx="16.5" cy="16.5" r=".5" fill="currentColor" />
  <path d="m13.4 13.4 2.7 2.7" />
  <circle cx="12" cy="12" r="2" />
</svg>
