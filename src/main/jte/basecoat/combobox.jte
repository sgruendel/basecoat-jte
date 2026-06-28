<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/combobox.njk --%>

<%--
  Renders an input-first combobox component.

  @param id {string} [optional] - Unique identifier for the combobox component.
  @param selected {string|array} [optional] - The initially selected value(s).
  @param name {string} [optional] - The name attribute for the hidden input storing the selected value.
  @param multiple {boolean} [optional] [default=false] - Enables multiple selection mode with chips.
  @param placeholder {string} [optional] - Placeholder text for the visible input.
  @param close_on_select {boolean} [optional] [default=false] - Closes the popover when selecting an option in multiple mode.
  @param clear {boolean} [optional] [default=false] - Shows a clear button in single-select mode.
  @param auto_highlight {boolean} [optional] [default=false] - Highlights the first matching option while filtering.
  @param main_attrs {object} [optional] - Additional HTML attributes for the root div.
  @param input_attrs {object} [optional] - Additional HTML attributes for the visible input.
  @param popover_attrs {object} [optional] - Additional HTML attributes for the popover div.
  @param listbox_attrs {object} [optional] - Additional HTML attributes for the listbox div.
  @param hidden_input_attrs {object} [optional] - Additional HTML attributes for the hidden input.
--%>

@import java.util.List
@import java.util.Map
@import gg.jte.Content
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.util.JteHelper

@param String id
@param String selected = null
@param List<String> selectedList = null
@param String name = null
@param boolean multiple = false
@param String placeholder = null
@param boolean closeOnSelect = false
@param boolean clear = false
@param boolean autoHighlight = false
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> inputAttrs = null
@param Map<?, ?> popoverAttrs = null
@param Map<?, ?> listboxAttrs = null
@param Map<?, ?> hiddenInputAttrs = null
@param List<Item> items = null
@param Content options = null

!{
  final List<String> selectedArray;
  if (selected != null && selectedList != null) {
    throw new IllegalArgumentException("only one of selected and selectedList must be specified");
  }

  if (selected != null) {
    selectedArray = List.of(selected);
  } else if (selectedList != null) {
    selectedArray = selectedList;
  } else {
    selectedArray = List.of();
  }

  final String hiddenValue;
  if (multiple) {
    hiddenValue = String.join(",", selectedArray);
  } else if (!selectedArray.isEmpty()) {
    hiddenValue = selectedArray.getFirst();
  } else {
    hiddenValue = "";
  }
}

<div
  id="${id}"
  class="${JteHelper.classAppend("combobox", mainAttrs)}"
  data-close-on-select="${(multiple && closeOnSelect) ? "true" : null}"
  data-auto-highlight="${autoHighlight ? "true" : null}"
  $unsafe{JteHelper.attrs(mainAttrs, "class")}
>
  @if(multiple)
    <input
      type="text"
      role="combobox"
      class="${JteHelper.clazz(inputAttrs)}"
      placeholder="${placeholder}"
      autocomplete="off"
      spellcheck="false"
      aria-autocomplete="list"
      aria-expanded="false"
      aria-controls="${id}-listbox"
      $unsafe{JteHelper.attrs(inputAttrs, "class")}
    />
  @elseif(clear)
    <div class="${JteHelper.classAppend("input-group", inputAttrs)}">
      <input
        type="text"
        role="combobox"
        placeholder="${placeholder}"
        autocomplete="off"
        spellcheck="false"
        aria-autocomplete="list"
        aria-expanded="false"
        aria-controls="${id}-listbox"
        $unsafe{JteHelper.attrs(inputAttrs, "class")}
      />
      <span role="group" data-align="inline-end">
        <button type="button" data-clear aria-label="Clear selection">
          <svg
            class="size-4"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <path d="M18 6 6 18" />
            <path d="m6 6 12 12" />
          </svg>
        </button>
        <button
          type="button"
          class="btn"
          data-variant="ghost"
          data-size="icon-xs"
          aria-label="Open suggestions"
          aria-haspopup="listbox"
          aria-expanded="false"
          aria-controls="${id}-listbox"
        >
          <svg
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <path d="m6 9 6 6 6-6" />
          </svg>
        </button>
      </span>
    </div>
  @else
    <input
      type="text"
      role="combobox"
      class="${JteHelper.clazz(inputAttrs)}"
      placeholder="${placeholder}"
      autocomplete="off"
      spellcheck="false"
      aria-autocomplete="list"
      aria-expanded="false"
      aria-controls="${id}-listbox"
      $unsafe{JteHelper.attrs(inputAttrs, "class")}
    />
    <svg
      aria-hidden="true"
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      class="combobox-trigger-icon"
    >
      <path d="m6 9 6 6 6-6" />
    </svg>
  @endif
  <div
    id="${id}-popover"
    data-popover
    aria-hidden="true"
    $unsafe{JteHelper.attrs(popoverAttrs)}
  >
    <div
      role="listbox"
      id="${id}-listbox"
      aria-orientation="vertical"
      aria-multiselectable="${multiple ? "true" : null}"
      $unsafe{JteHelper.attrs(listboxAttrs)}
    >
      ${options}
    </div>
  </div>
  <input
    type="hidden"
    name="${name != null ? name : (id + "-value")}"
    value="${hiddenValue}"
    $unsafe{JteHelper.attrs(hiddenInputAttrs, List.of("name", "value"))}
  />
</div>
