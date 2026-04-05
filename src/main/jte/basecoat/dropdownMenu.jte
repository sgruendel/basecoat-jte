<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/dropdown-menu.njk --%>

<%--
  Renders a dropdown menu component.

  @param id {string} [optional] - Unique identifier for the dropdown component.
  @param trigger {string} [optional] - HTML content for the button that triggers the dropdown.
  @param triggerClass {String} [optional] - Additional classes for the trigger button.
--%>

@import java.util.List
@import java.util.Map
@import gg.jte.Content
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.util.JteHelper

@param String id
@param String triggerText = null
@param Content triggerContent = null
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> triggerAttrs = null
@param Map<?, ?> popoverAttrs = null
@param Map<?, ?> menuAttrs = null
@param List<Item> items = null
@param Content content = null

<div
  id="${id}"
  class="${JteHelper.classAppend("dropdown-menu", mainAttrs)}"
  $unsafe{JteHelper.attrs(mainAttrs, "class")}
>
  <button
    type="button"
    id="${id}-trigger"
    aria-haspopup="menu"
    aria-controls="${id}-menu"
    aria-expanded="false"
    $unsafe{JteHelper.attrs(triggerAttrs)}
  >
    ${triggerText}
    ${triggerContent}
  </button>
  <div
    id="${id}-popover"
    data-popover
    aria-hidden="true"
    $unsafe{JteHelper.attrs(popoverAttrs)}
  >
    <div
      role="menu"
      id="${id}-menu"
      aria-labelledby="${id}-trigger"
      $unsafe{JteHelper.attrs(menuAttrs)}
    >
      @if(items != null)
        @template.basecoat.dropdownRenderItems(
          items = items,
          parentIdPrefix = id + "-items"
        )
      @else
        ${content}
      @endif
    </div>
  </div>
</div>
