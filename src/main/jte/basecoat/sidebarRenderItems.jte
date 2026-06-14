<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/sidebar.njk --%>

<%--
  Renders sidebar content recursively (groups, items, submenus, separators).

  @param items {array} - The array of items to render.
  @param parent_id_prefix {string} [optional] - Prefix for generating element IDs.
--%>

@import java.util.List
@import gg.jte.support.ForSupport
@import com.basecoatui.jte.util.BasecoatSidebar.Item
@import com.basecoatui.jte.util.BasecoatSidebar.ItemType
@import com.basecoatui.jte.util.JteHelper

@param List<Item> items
@param String parentIdPrefix = "content"


@for(var item : ForSupport.of(items))
  !{var itemId = parentIdPrefix + "-" + item.getIndex();}
  @if(item.get().type() == ItemType.GROUP)
    !{var groupLabelId = item.get().id() != null ? item.get().id() : "group-label-" + itemId;}
    <div
      role="group"
      aria-labelledby="${item.get().label() != null ? groupLabelId : null}"
      $unsafe{JteHelper.attrs(item.get().attrs())}
    >
      @if(item.get().label() != null)
        <h3 id="${groupLabelId}">${item.get().label()}</h3>
      @endif
      <ul>
        @if(item.get().items() != null)
          @template.basecoat.sidebarRenderItems(
            items = item.get().items(),
            parentIdPrefix = itemId
          )
        @endif
      </ul>
    </div>
  @elseif(item.get().type() == ItemType.SEPARATOR)
    <hr role="separator" />
  @elseif(item.get().type() == ItemType.SUBMENU)
    <li>
      <details
        id="submenu-${itemId}"
        open="${item.get().open() ? true : null}"
        $unsafe{JteHelper.attrs(item.get().attrs(), "open")}
      >
        <summary aria-controls="submenu-${itemId}-content">
          @if(item.get().icon() != null)
            ${item.get().icon()}
          @endif
          <span>${item.get().label()}</span>
        </summary>
        <ul id="submenu-${itemId}-content">
          @if(item.get().items() != null)
            @template.basecoat.sidebarRenderItems(
              items = item.get().items(),
              parentIdPrefix = itemId
            )
          @endif
        </ul>
      </details>
    </li>
  @elseif(item.get().type() == ItemType.ITEM)
    <li>
      <a
        href="${item.get().url()}"
        aria-current="${item.get().current() ? "page" : null}"
        $unsafe{JteHelper.attrs(item.get().attrs(), List.of("href", "aria-current"))}
      >
        @if(item.get().icon() != null)
          ${item.get().icon()}
        @endif
        <span>${item.get().label()}</span>
      </a>
    </li>
  @endif
@endfor
