<%-- see https://github.com/hunvreus/basecoat/blob/1.3.0/src/templates/nunjucks/sidebar.njk --%>
<%--
  Renders sidebar content recursively (groups, items, submenus, separators).

  @param items {array} - The array of items to render.
  @param parent_id_prefix {string} [optional] - Prefix for generating element IDs.
--%>

@import gg.jte.support.ForSupport
@import io.github.sgruendel.basecoat.jte.BasecoatItem
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Group
@import io.github.sgruendel.basecoat.jte.BasecoatItem.NavItem
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Separator
@import io.github.sgruendel.basecoat.jte.BasecoatItem.Submenu
@import io.github.sgruendel.basecoat.jte.JteHelper

@import java.util.List

@param List<? extends BasecoatItem> items
@param String parentIdPrefix = "content"

@for(var entry : ForSupport.of(items))
    !{var itemId = parentIdPrefix + "-" + entry.getIndex();}
    @if(entry.get() instanceof Group group)
        !{var groupLabelId = group.id() != null ? group.id() : "group-label-" + itemId;}
        <div
            role="group"
            aria-labelledby="${group.label() != null ? groupLabelId : null}"
            $unsafe{JteHelper.attrs(group.attrs())}
        >
            @if(group.label() != null)
                <h3 id="${groupLabelId}">${group.label()}</h3>
            @endif
            <ul>
                @if(group.items() != null)
                    @template.basecoat.sidebarRenderItems(
                        items = group.items(),
                        parentIdPrefix = itemId
                    )
                @endif
            </ul>
        </div>
    @elseif(entry.get() instanceof Separator)
        <hr role="separator" />
    @elseif(entry.get() instanceof Submenu submenu)
        <li>
            <details id="submenu-${itemId}" open="${submenu.open()}" $unsafe{JteHelper.attrs(submenu.attrs(), "open")}>
                <summary aria-controls="submenu-${itemId}-content">
                    ${submenu.icon()}
                    <span>@if(submenu.content() != null)${submenu.content()}@else${submenu.label()}@endif</span>
                </summary>
                <ul id="submenu-${itemId}-content">
                    @if(submenu.items() != null)
                        @template.basecoat.sidebarRenderItems(
                            items = submenu.items(),
                            parentIdPrefix = itemId
                        )
                    @endif
                </ul>
            </details>
        </li>
    @elseif(entry.get() instanceof NavItem navItem)
        <li>
            <a
                href="${navItem.url()}"
                aria-current="${navItem.current() ? "page" : null}"
                $unsafe{JteHelper.attrs(navItem.attrs(), List.of("href", "aria-current"))}
            >
                ${navItem.icon()}
                <span>@if(navItem.content() != null)${navItem.content()}@else${navItem.label()}@endif</span>
            </a>
        </li>
    @else
        <%-- "if (true)": JTE writes the following template text after this code, which must stay reachable --%>
        !{if (true) throw new IllegalArgumentException("Unsupported sidebar item: " + entry.get());}
    @endif
@endfor
