<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/command.njk --%>

<%--
  Renders a command dialog (modal command palette).

  @param id {string} - Unique identifier for the command dialog.
  @param items {array} [optional] - Array of items to render (alternative to content).
  @param placeholder {string} [optional] [default="Type a command or search..."] - Placeholder text for the search input.
  @param empty_text {string} [optional] [default="No results found."] - Text displayed when no results match the search.
  @param dialog_attrs {object} [optional] - Additional HTML attributes for the dialog element.
  @param input_attrs {object} [optional] - Additional HTML attributes for the search input.
  @param menu_attrs {object} [optional] - Additional HTML attributes for the menu div.
  @param open {boolean} [optional] [default=false] - Whether the command dialog should be open initially.
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
@param Map<?, ?> dialogAttrs = null
@param Map<?, ?> inputAttrs = null
@param Map<?, ?> menuAttrs = null
@param boolean open = false
@param Content content = null

<dialog
  id="${id}"
  class="${JteHelper.classAppend("command-dialog", dialogAttrs)}"
  aria-label="Command menu"
  open="${open}"
  onclick="if (event.target === this) this.close()"
  $unsafe{JteHelper.attrs(dialogAttrs, "class")}
>
  <div class="command">
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
      class="${JteHelper.clazz(menuAttrs)}"
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
</dialog>
