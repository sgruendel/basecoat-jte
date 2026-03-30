<%-- see https://basecoatui.com/components/combobox/ --%>

@import gg.jte.Content

@param String id
@param String btnClassAppend = null
@param String placeholderText = "Search …"
@param String noResultsText = "No results found."
@param Content options

<div id="${id}" class="select">
  <button
    type="button"
    class="btn-outline ${btnClassAppend}"
    id="${id}-trigger"
    aria-haspopup="listbox"
    aria-expanded="false"
    aria-controls="${id}-listbox"
  >
    <span class="bg-teal-300 truncate"></span>

    @template.lucide.chevronsUpDown(
      classAppend = "bg-teal-300 text-muted-foreground opacity-50 shrink-0"
    )
  </button>
  <div id="${id}-popover" data-popover aria-hidden="true">
    <header>
      @template.lucide.search()
      <input
        id="${id}-input"
        type="text"
        value=""
        placeholder="${placeholderText}"
        autocomplete="off"
        aria-autocomplete="list"
        role="combobox"
        aria-expanded="false"
        aria-controls="${id}-listbox"
        aria-labelledby="${id}-trigger"
      />
    </header>

    <div
      role="listbox"
      id="${id}-listbox"
      aria-orientation="vertical"
      aria-labelledby="${id}-trigger"
      data-empty="${noResultsText}"
    >
      ${options}
    </div>
  </div>
  <input type="hidden" name="${id}-value" value="" />
</div>
