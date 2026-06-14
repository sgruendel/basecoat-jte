<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/command.njk --%>

<%--
  Renders a list of items for the command component.

  @param items {array} - Array of items to render.
  @param parent_id_prefix {string} [optional] - The prefix for the item id.
--%>

@import java.util.List
@import gg.jte.support.ForSupport
@import com.basecoatui.jte.util.BasecoatCommand.Item
@import com.basecoatui.jte.util.BasecoatCommand.ItemType
@import com.basecoatui.jte.util.JteHelper

@param List<Item> items
@param String parentIdPrefix = "items"


@for(var item : ForSupport.of(items))
  !{var itemId = parentIdPrefix + "-" + item.getIndex();}
  @if(item.get().type() == ItemType.GROUP)
    !{var groupLabelId = item.get().id() != null ? item.get().id() : "group-label-" + itemId;}
    <div
      role="group"
      aria-labelledby="${groupLabelId}"
      $unsafe{JteHelper.attrs(item.get().attrs())}
    >
      <span role="heading" id="${groupLabelId}">${item.get().label()}</span>
      @if(item.get().items() != null)
        @template.basecoat.commandRenderItems(
          items = item.get().items(),
          parentIdPrefix = itemId
        )
      @endif
    </div>
  @elseif(item.get().type() == ItemType.SEPARATOR)
    <hr role="separator" />
  @elseif(item.get().type() == ItemType.ITEM)
    @if(item.get().url() != null)
      <a
        id="${itemId}"
        href="${item.get().url()}"
        role="menuitem"
        data-keywords="${item.get().keywords()}"
        aria-disabled="${item.get().disabled() ? "true" : null}"
        $unsafe{JteHelper.attrs(item.get().attrs(), "href")}
      >
        @if(item.get().icon() != null)
          ${item.get().icon()}
        @endif
        ${item.get().label()}
      </a>
    @else
      <div
        id="${itemId}"
        role="menuitem"
        data-keywords="${item.get().keywords()}"
        aria-disabled="${item.get().disabled() ? "true" : null}"
        $unsafe{JteHelper.attrs(item.get().attrs())}
      >
        @if(item.get().icon() != null)
          ${item.get().icon()}
        @endif
        ${item.get().label()}
      </div>
    @endif
  @endif
@endfor
