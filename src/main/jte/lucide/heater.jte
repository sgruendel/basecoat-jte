<%-- see https://lucide.dev/icons/heater --%>

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
  class="lucide lucide-heater-icon lucide-heater ${classAppend}"
>
  <path d="M11 8c2-3-2-3 0-6" />
  <path d="M15.5 8c2-3-2-3 0-6" />
  <path d="M6 10h.01" />
  <path d="M6 14h.01" />
  <path d="M10 16v-4" />
  <path d="M14 16v-4" />
  <path d="M18 16v-4" />
  <path d="M20 6a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h3" />
  <path d="M5 20v2" />
  <path d="M19 20v2" />
</svg>
