<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/sidebar.njk --%>

<%--
  Renders a sidebar component.

  @param id {string} [optional] - Unique identifier for the sidebar component.
  @param label {string} [optional] - Label for the sidebar navigation.
  @param open {boolean} [optional] - Whether the sidebar is open.
  @param side {string} [optional] - Side of the sidebar to display.
  @param header {string} [optional] - Header content for the sidebar.
  @param footer {string} [optional] - Footer content for the sidebar.
  @param menu {array} [optional] - Array of menu items for the sidebar.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param header_attrs {object} [optional] - Additional HTML attributes for the header element.
  @param content_attrs {object} [optional] - Additional HTML attributes for the content section.
  @param footer_attrs {object} [optional] - Additional HTML attributes for the footer element.
--%>

@import java.util.List
@import java.util.Map
@import gg.jte.Content
@import com.basecoatui.jte.util.BasecoatSidebar.Item
@import com.basecoatui.jte.util.JteHelper

@param String id
@param String label = "Sidebar navigation"
@param boolean open = true
@param String side = "left"
@param Content header = null
@param Content footer = null
@param List<Item> menu = null
@param Map<?, ?> mainAttrs = null
@param Map<?, ?> headerAttrs = null
@param Map<?, ?> contentAttrs = null
@param Map<?, ?> footerAttrs = null
@param Content content = null

<aside
  id="${id}"
  class="${JteHelper.classAppend("sidebar", mainAttrs)}"
  data-side="${side}"
  aria-hidden="${Boolean.toString(!open)}"
  inert="${!open}"
  $unsafe{JteHelper.attrs(mainAttrs, "class")}
>
  <nav aria-label="${label}">
    @if(header != null)
      <header $unsafe{JteHelper.attrs(headerAttrs)}>${header}</header>
    @endif

    <section $unsafe{JteHelper.attrs(contentAttrs)}>
      @if(menu != null)
        @template.basecoat.sidebarRenderItems(
          items = menu,
          parentIdPrefix = id + "-content"
        )
      @else
        ${content}
      @endif
    </section>

    @if(footer != null)
      <footer $unsafe{JteHelper.attrs(footerAttrs)}>${footer}</footer>
    @endif
  </nav>
</aside>
