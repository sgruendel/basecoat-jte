<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/select.njk --%>
<%--
  Renders a select component.

  @param id {string} [optional] - Unique identifier for the select component.
  @param selected {string|array} [optional] - The initially selected value(s).
  @param name {string} [optional] - The name attribute for the hidden input storing the selected value.
  @param multiple {boolean} [optional] [default=false] - Enables multiple selection mode.
  @param placeholder {string} [optional] - Placeholder text shown when no option is selected.
  @param close_on_select {boolean} [optional] [default=false] - Closes the popover when selecting an option in multiple mode.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param trigger_attrs {object} [optional] - Additional HTML attributes for the trigger button.
  @param popover_attrs {object} [optional] - Additional HTML attributes for the popover content div.
  @param listbox_attrs {object} [optional] - Additional HTML attributes for the listbox div.
  @param input_attrs {object} [optional] - Additional HTML attributes for the hidden input.
--%>

@import gg.jte.Content
@import io.github.sgruendel.basecoat.jte.BasecoatItem
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Group
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Option
@import io.github.sgruendel.basecoat.jte.JsonHelper
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.util.ArrayDeque
@import java.util.ArrayList
@import java.util.Deque
@import java.util.Iterator
@import java.util.List
@import java.util.Map

@import static io.github.sgruendel.lucide.jte.LucideIcons.*

@param String id
@param String selected = null
@param List<String> selectedList = null
@param String name = null
@param boolean multiple = false
@param String placeholder = null
@param boolean closeOnSelect = false
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> triggerAttrs = null
@param Map<?, ?> popoverAttrs = null
@param Map<?, ?> listboxAttrs = null
@param Map<?, ?> inputAttrs = null
@param List<? extends BasecoatItem> items = null
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

  // collect options depth-first in document order, like selectRenderItems renders nested groups
  final List<Option> allOptions = new ArrayList<>();
  if (items != null) {
    final Deque<Iterator<? extends BasecoatItem>> pending = new ArrayDeque<>();
    pending.push(items.iterator());
    while (!pending.isEmpty()) {
      final var iterator = pending.peek();
      if (!iterator.hasNext()) {
        pending.pop();
        continue;
      }
      final var item = iterator.next();
      if (item instanceof Option option) {
        allOptions.add(option);
      } else if (item instanceof Group group && group.items() != null) {
        pending.push(group.items().iterator());
      }
    }
  }
  final Option firstOption = allOptions.isEmpty() ? null : allOptions.getFirst();
  final List<Option> selectedOptions = allOptions.stream()
    .filter(option -> option.value() != null && selectedArray.contains(option.value()))
    .toList();

  final Option defaultOption;
  if (!selectedOptions.isEmpty()) {
    defaultOption = selectedOptions.getFirst();
  } else if (placeholder != null) {
    // show the placeholder, like a native select without a selected option
    defaultOption = null;
  } else {
    defaultOption = firstOption;
  }

  final List<String> labels = new ArrayList<>();
  final String defaultLabel;
  // like Basecoat's select script, show the option content if there is no text label
  Content defaultContent = null;
  if (multiple && !selectedOptions.isEmpty()) {
    selectedOptions.forEach(so -> labels.add(so.label() != null ? so.label() : so.value()));
    defaultLabel = String.join(", ", labels);
  } else if (placeholder != null && selectedOptions.isEmpty()) {
    defaultLabel = placeholder;
  } else if (defaultOption != null) {
    defaultLabel = defaultOption.label();
    if (defaultLabel == null) {
      defaultContent = defaultOption.content();
    }
  } else {
    defaultLabel = "";
  }

  final String value;
  if (multiple) {
    // Basecoat's select script reads and writes multiple values as a JSON array
    value = JsonHelper.write(selectedArray);
  } else if (defaultOption != null && defaultOption.value() != null) {
    value = defaultOption.value();
  } else {
    value = "";
  }
}

<div
  id="${id}"
  class="${JteHelper.classAppend("select", mainAttrs)}"
  data-placeholder="${placeholder}"
  data-close-on-select="${(multiple && closeOnSelect) ? "true" : null}"
  $unsafe{JteHelper.attrs(mainAttrs, "class")}
>
  <button
    type="button"
    class="${JteHelper.clazz(triggerAttrs)}"
    id="${id}-trigger"
    aria-haspopup="listbox"
    aria-expanded="false"
    aria-controls="${id}-listbox"
    $unsafe{JteHelper.attrs(triggerAttrs, "class")}
  >
    <span class="truncate">@if(defaultContent != null)${defaultContent}@else${defaultLabel}@endif</span>
    ${lucideChevronDown().cssClass("text-muted-foreground opacity-50 shrink-0")}
  </button>
  <div id="${id}-popover" data-popover aria-hidden="true" $unsafe{JteHelper.attrs(popoverAttrs)}>
    <div
      role="listbox"
      id="${id}-listbox"
      aria-orientation="vertical"
      aria-labelledby="${id}-trigger"
      aria-multiselectable="${multiple ? "true" : null}"
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
