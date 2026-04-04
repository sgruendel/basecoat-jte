<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/select.njk --%>

<%--
  Renders a select or combobox component.

  @param id {string} [optional] - Unique identifier for the select component.
  @param selected {string|array} [optional] - The initially selected value(s).
  @param name {string} [optional] - The name attribute for the hidden input storing the selected value.
  @param multiple {boolean} [optional] [default=false] - Enables multiple selection mode.
  @param placeholder {string} [optional] - Placeholder text shown when no options are selected (multiple mode only).
  @param close_on_select {boolean} [optional] [default=false] - Closes the popover when selecting an option in multiple mode.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param trigger_attrs {object} [optional] - Additional HTML attributes for the trigger button.
  @param popover_attrs {object} [optional] - Additional HTML attributes for the popover content div.
  @param listbox_attrs {object} [optional] - Additional HTML attributes for the listbox div.
  @param input_attrs {object} [optional] - Additional HTML attributes for the hidden input.
  @param search_placeholder {string} [optional] [default="Search entries..."] - Placeholder text for the search input (combobox only).
  @param is_combobox {boolean} [optional] [default=false] - Renders a combobox with search functionality if true.
--%>

@import gg.jte.Content

@param String id
@param String selectClassAppend = null
@param String btnClassAppend = null
@param String placeholderText = "Search …"
@param String noResultsText = "No results found."
@param boolean multiple = false
@param boolean closeOnSelect = false
@param boolean isCombobox = false
@param Content options

!{

  // TODO items and render_select_items
  Object selectedOptions = null; // TODO
  String defaultOption = null; // TODO
  String labels = null; // TODO
  var defaultLabel = "";
  if (multiple && selectedOptions != null) {
    defaultLabel = labels;
  } else if (multiple) {
    defaultLabel = placeholderText;
  } else if (defaultOption != null) {
    defaultLabel = defaultOption; // TODO .label;
  }

}

<div
  id="${id}"
  class="select ${selectClassAppend}"
  data-placeholder="${(multiple && placeholderText != null) ? placeholderText : null}"
  data-close-on-select="${multiple && closeOnSelect}"
>
  <button
    type="button"
    class="btn-outline ${btnClassAppend}"
    id="${id}-trigger"
    aria-haspopup="listbox"
    aria-expanded="false"
    aria-controls="${id}-listbox"
  >
    <span class="truncate">${defaultLabel}</span>

    @if(isCombobox)
      @template.lucide.chevronsUpDown(
        classAppend = "text-muted-foreground opacity-50 shrink-0"
      )
    @else
      @template.lucide.chevronDown(
        classAppend = "text-muted-foreground opacity-50 shrink-0"
      )
    @endif
  </button>
  <div id="${id}-popover" data-popover aria-hidden="true">
    @if(isCombobox)
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
    @endif

    <div
      role="listbox"
      id="${id}-listbox"
      aria-orientation="vertical"
      aria-labelledby="${id}-trigger"
      aria-multiselectable="${multiple}"
      data-empty="${noResultsText}"
    >
      ${options}
    </div>
  </div>
  <input type="hidden" name="${id}-value" value="" />
</div>
