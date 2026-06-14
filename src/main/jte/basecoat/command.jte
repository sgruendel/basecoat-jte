<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/command.njk --%>

<%--
  Renders a standalone command menu component with search and keyboard navigation.

  @param id {string} - Unique identifier for the command component.
  @param items {array} [optional] - Array of items to render (alternative to content).
  @param placeholder {string} [optional] [default="Type a command or search..."] - Placeholder text for the search input.
  @param empty_text {string} [optional] [default="No results found."] - Text displayed when no results match the search.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param input_attrs {object} [optional] - Additional HTML attributes for the search input.
  @param menu_attrs {object} [optional] - Additional HTML attributes for the menu div.
--%>

@import java.util.List
@import java.util.Map
@import gg.jte.Content
@import com.basecoatui.jte.util.BasecoatCommand.Item
@import com.basecoatui.jte.util.JteHelper

@param String id
@param List<Item> items = null
@param String placeholder = "Type a command or search..."
@param String emptyText = "No results found."
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> inputAttrs = null
@param Map<?, ?> menuAttrs = null
@param Content content = null

<div
  id="${id}"
  class="${JteHelper.classAppend("command", mainAttrs)}"
  aria-label="Command menu"
  $unsafe{JteHelper.attrs(mainAttrs, "class")}
>
  @template.basecoat.commandInput(
    id = id,
    placeholder = placeholder,
    inputAttrs = inputAttrs
  )
  <div
    role="menu"
    id="${id}-menu"
    aria-orientation="vertical"
    data-empty="${emptyText}"
    class="${JteHelper.classAppend("scrollbar", menuAttrs)}"
    $unsafe{JteHelper.attrs(menuAttrs, "class")}
  >
    @if(items != null && !items.isEmpty())
      @template.basecoat.commandRenderItems(
        items = items,
        parentIdPrefix = id + "-items"
      )
    @else
      ${content}
    @endif
  </div>
</div>
