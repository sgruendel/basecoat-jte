<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/command.njk --%>
<%--
  Renders a list of items for the command component.

  @param items {array} - Array of items to render.
  @param parent_id_prefix {string} [optional] - The prefix for the item id.
--%>

@import gg.jte.support.ForSupport
@import io.github.sgruendel.basecoat.jte.BasecoatItem
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Group
@import io.github.sgruendel.basecoat.jte.BasecoatItem.MenuItem
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Separator
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.util.List

@param List<? extends BasecoatItem> items
@param String parentIdPrefix = "items"

@for(var entry : ForSupport.of(items))
  !{var itemId = parentIdPrefix + "-" + entry.getIndex();}
  @if(entry.get() instanceof Group group)
    !{var groupLabelId = group.id() != null ? group.id() : "group-label-" + itemId;}
    <div role="group" aria-labelledby="${groupLabelId}" $unsafe{JteHelper.attrs(group.attrs())}>
      <span role="heading" id="${groupLabelId}">${group.label()}</span>
      @if(group.items() != null)
        @template.basecoat.commandRenderItems(
          items = group.items(),
          parentIdPrefix = itemId
        )
      @endif
    </div>
  @elseif(entry.get() instanceof Separator)
    <hr role="separator" />
  @elseif(entry.get() instanceof MenuItem menuItem)
    @if(menuItem.url() != null)
      <a
        id="${itemId}"
        role="menuitem"
        href="${menuItem.url()}"
        data-keywords="${menuItem.keywords()}"
        aria-disabled="${menuItem.disabled() ? "true" : null}"
        $unsafe{JteHelper.attrs(menuItem.attrs(), "href")}
      >
        ${menuItem.icon()}
        @if(menuItem.content() != null)
          ${menuItem.content()}
        @else
          ${menuItem.label()}
        @endif
      </a>
    @else
      <div
        id="${itemId}"
        role="menuitem"
        data-keywords="${menuItem.keywords()}"
        aria-disabled="${menuItem.disabled() ? "true" : null}"
        $unsafe{JteHelper.attrs(menuItem.attrs())}
      >
        ${menuItem.icon()}
        @if(menuItem.content() != null)
          ${menuItem.content()}
        @else
          ${menuItem.label()}
        @endif
      </div>
    @endif
  @else
    <%-- "if (true)": JTE writes the following template text after this code, which must stay reachable --%>
    !{if (true) throw new IllegalArgumentException("Unsupported command item: " + entry.get());}
  @endif
@endfor
