<%-- see https://github.com/hunvreus/basecoat/blob/1.3.0/src/templates/nunjucks/dropdown-menu.njk --%>
<%--
  Renders a dropdown menu component.

  @param id {string} [optional] - Unique identifier for the dropdown component.
  @param trigger {string} [optional] - HTML content for the button that triggers the dropdown.
  @param items {array} [optional] - Array of menu items for the dropdown.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param trigger_attrs {object} [optional] - Additional HTML attributes for the trigger button.
  @param popover_attrs {object} [optional] - Additional HTML attributes for the dropdown content div.
  @param menu_attrs {object} [optional] - Additional HTML attributes for the menu div.
--%>

@import gg.jte.Content
@import io.github.sgruendel.basecoat.jte.BasecoatItem
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.util.List
@import java.util.Map

@param String id
@param String triggerText = null
@param Content triggerContent = null
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> triggerAttrs = null
@param Map<?, ?> popoverAttrs = null
@param Map<?, ?> menuAttrs = null
@param List<? extends BasecoatItem> items = null
@param Content content = null

!{
    if (triggerText != null && triggerContent != null) {
        throw new IllegalArgumentException("triggerText and triggerContent are exclusive");
    }
}

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
        @if(triggerContent != null)
            ${triggerContent}
        @else
            ${triggerText}
        @endif
    </button>
    <div id="${id}-popover" data-popover aria-hidden="true" $unsafe{JteHelper.attrs(popoverAttrs)}>
        <div role="menu" id="${id}-menu" aria-labelledby="${id}-trigger" $unsafe{JteHelper.attrs(menuAttrs)}>
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
