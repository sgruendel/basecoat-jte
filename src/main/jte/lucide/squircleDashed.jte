<%-- see https://lucide.dev/icons/squircle-dashed --%>

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
  class="lucide lucide-squircle-dashed-icon lucide-squircle-dashed ${classAppend}"
  role="${role}"
  aria-label="${ariaLabel}"
  aria-hidden="${ariaHidden}"
  focusable="${focusable}"
>
    <path d="M13.77 3.043a34 34 0 0 0-3.54 0" />
  <path d="M13.771 20.956a33 33 0 0 1-3.541.001" />
  <path d="M20.18 17.74c-.51 1.15-1.29 1.93-2.439 2.44" />
  <path d="M20.18 6.259c-.51-1.148-1.291-1.929-2.44-2.438" />
  <path d="M20.957 10.23a33 33 0 0 1 0 3.54" />
  <path d="M3.043 10.23a34 34 0 0 0 .001 3.541" />
  <path d="M6.26 20.179c-1.15-.508-1.93-1.29-2.44-2.438" />
  <path d="M6.26 3.82c-1.149.51-1.93 1.291-2.44 2.44" />
</svg>
