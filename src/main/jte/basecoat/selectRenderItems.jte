<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/select.njk --%>

<%--
  Renders a list of items for the select component.

  @param items {array} - The array of items to render.
  @param parent_id_prefix {string} [optional] - The prefix for the item id.
--%>

@import java.util.List
@import gg.jte.support.ForSupport
@import com.basecoatui.jte.util.BasecoatSelect.Item
@import com.basecoatui.jte.util.BasecoatSelect.ItemType
@import com.basecoatui.jte.util.JteHelper

@param List<Item> items
@param List<String> selectedArray
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
      <div role="heading" id="${groupLabelId}">${item.get().label()}</div>
      @if(item.get().items() != null)
        @template.basecoat.selectRenderItems(
          items = item.get().items(),
          selectedArray = selectedArray,
          parentIdPrefix = itemId
        )
      @endif
    </div>
  @elseif(item.get().type() == ItemType.SEPARATOR)
    <hr role="separator" />
  @elseif(item.get().type() == ItemType.ITEM)
    <div
      id="${itemId}"
      role="option"
      data-value="${item.get().value()}"
      aria-selected="${selectedArray.contains(item.get().value())}"
      $unsafe{JteHelper.attrs(item.get().attrs())}
    >
      ${item.get().label()}
    </div>
  @endif
@endfor
