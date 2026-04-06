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

@import java.util.ArrayList
@import java.util.List
@import java.util.Map
@import gg.jte.Content
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.util.BasecoatSelect.ItemType
@import com.basecoatui.jte.util.JteHelper

@param String id
@param String name = null
@param String selected = null
@param List<String> selectedList = null
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> triggerAttrs = null
@param Map<?, ?> popoverAttrs = null
@param Map<?, ?> listboxAttrs = null
@param Map<?, ?> inputAttrs = null
@param String placeholderText = "Search …"
@param boolean multiple = false
@param boolean closeOnSelect = false
@param boolean isCombobox = false
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

  Item firstOption = null;
  final List<Item> selectedOptions = new ArrayList<>();
  if (items != null) {
    for (var item : items) {
      if (item.type() == ItemType.GROUP && item.items() != null) {
        for (var subItem : item.items()) {
          if (firstOption == null) {
            firstOption = subItem;
          }
          if (selectedArray.contains(subItem.value())) {
            selectedOptions.add(subItem);
          }
        }
      } else if (item.type() == ItemType.ITEM) {
        if (firstOption == null) {
          firstOption = item;
        }
        if (selectedArray.contains(item.value())) {
          selectedOptions.add(item);
        }
      }
    }
  }

  final Item defaultOption = selectedOptions.isEmpty() ? firstOption : selectedOptions.getFirst();
  final List<String> labels = new ArrayList<>();
  final String defaultLabel;
  if (multiple && !selectedOptions.isEmpty()) {
    selectedOptions.forEach(si -> labels.add(si.value()));
    defaultLabel = String.join(",", labels);
  } else if (multiple) {
    defaultLabel = placeholderText;
  } else if (defaultOption != null) {
    defaultLabel = defaultOption.label();
  } else {
    defaultLabel = "";
  }

  final String value;
  if (multiple) {
    value = String.join(",", selectedArray);
  } else if (defaultOption != null) {
    value = defaultOption.value();
  } else {
    value = "";
  }
}

<div
  id="${id}"
  class="${JteHelper.classAppend("select", mainAttrs)}"
  data-placeholder="${(multiple && placeholderText != null) ? placeholderText : null}"
  data-close-on-select="${multiple && closeOnSelect}"
  $unsafe{JteHelper.attrs(mainAttrs, "class")}
>
  <button
    type="button"
    class="${JteHelper.classAppend("btn-outline", triggerAttrs)}"
    id="${id}-trigger"
    aria-haspopup="listbox"
    aria-expanded="false"
    aria-controls="${id}-listbox"
    $unsafe{JteHelper.attrs(triggerAttrs, "class")}
  >
    <span class="truncate">${defaultLabel}</span>

    @if(isCombobox)
      @template.lucide.chevronsUpDown(attrs = Map.of("class", "text-muted-foreground opacity-50 shrink-0"))
    @else
      @template.lucide.chevronDown(attrs = Map.of("class", "text-muted-foreground opacity-50 shrink-0"))
    @endif
  </button>
  <div
    id="${id}-popover"
    data-popover
    aria-hidden="true"
    $unsafe{JteHelper.attrs(popoverAttrs)}
  >
    @if(isCombobox)
      <header>
        @template.lucide.search()
        <input
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
      $unsafe{JteHelper.attrs(listboxAttrs)}
    >
      @if(items != null)
        @template.basecoat.selectRenderItems(
          items = items,
          selectedArray = selectedArray,
          parentIdPrefix = id + "-items"
        )
      @else
        ${options}
      @endif
    </div>
  </div>
  <input
    type="hidden"
    name="${name != null ? name : (id + "-value")}"
    value="${value}"
    $unsafe{JteHelper.attrs(inputAttrs, List.of("name", "value"))}
  />
</div>
