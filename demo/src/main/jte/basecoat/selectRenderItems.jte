<%-- see https://github.com/hunvreus/basecoat/blob/1.3.0/src/templates/nunjucks/select.njk --%>
<%--
  Renders a list of items for the select component.

  @param items {array} - The array of items to render.
  @param parent_id_prefix {string} [optional] - The prefix for the item id.
--%>

@import gg.jte.support.ForSupport
@import io.github.sgruendel.basecoat.jte.BasecoatItem
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Group
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Option
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Separator
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.util.List

@param List<? extends BasecoatItem> items
@param List<String> selectedArray
@param String parentIdPrefix

@for(var entry : ForSupport.of(items))
    !{var itemId = parentIdPrefix + "-" + entry.getIndex();}
    @if(entry.get() instanceof Group group)
        !{
            if (group.label() == null) {
                throw new IllegalArgumentException("Unsupported select group without label: " + group);
            }
        }
        !{var groupLabelId = group.id() != null ? group.id() : "group-label-" + itemId;}
        <div role="group" aria-labelledby="${groupLabelId}" $unsafe{JteHelper.attrs(group.attrs())}>
            <div role="heading" id="${groupLabelId}">${group.label()}</div>
            @if(group.items() != null)
                @template.basecoat.selectRenderItems(
                    items = group.items(),
                    selectedArray = selectedArray,
                    parentIdPrefix = itemId
                )
            @endif
        </div>
    @elseif(entry.get() instanceof Separator)
        <hr role="separator" />
    @elseif(entry.get() instanceof Option option)
        <div
            id="${itemId}"
            role="option"
            data-value="${option.value()}"
            data-label="${option.content() != null ? option.label() : null}"
            aria-selected="${option.value() != null && selectedArray.contains(option.value()) ? "true" : null}"
            $unsafe{JteHelper.attrs(option.attrs())}
        >
            @if(option.content() != null)
                ${option.content()}
            @else
                ${option.label()}
            @endif
        </div>
    @else
        <%-- "if (true)": JTE writes the following template text after this code, which must stay reachable --%>
        !{if (true) throw new IllegalArgumentException("Unsupported select item: " + entry.get());}
    @endif
@endfor
