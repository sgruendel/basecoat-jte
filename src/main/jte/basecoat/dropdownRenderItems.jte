<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/dropdown-menu.njk --%>

<%--
  Renders dropdown menu items recursively.

  @param items {array} - The array of items to render.
  @param parent_id_prefix {string} [optional] - Prefix for generating element IDs.
--%>

@import java.util.List
@import gg.jte.support.ForSupport
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.util.BasecoatSelect.ItemType
@import com.basecoatui.jte.util.JteHelper

@param List<Item> items
@param String parentIdPrefix


@for(var item : ForSupport.of(items))
  !{var itemId = parentIdPrefix + "-" + item.getIndex();}
  @if(item.get().type() == ItemType.GROUP)
    !{var groupLabelId = "group-label-" + item.getIndex();}
    <div
      role="group"
      aria-labelledby="${groupLabelId}"
      $unsafe{JteHelper.attrs(item.get().attrs())}
    >
      <div role="heading" id="${groupLabelId}}">${item.get().label()}</div>
      @if(item.get().items() != null)
        @template.basecoat.dropdownRenderItems(
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
        role="menuitem"
        href="${item.get().url()}"
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
