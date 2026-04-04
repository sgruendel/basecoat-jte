<%-- see https://github.com/hunvreus/basecoat/blob/main/src/nunjucks/tabs.njk --%>

<%--
  Renders a tabs component.

  @param id {string} - Unique identifier for the tabs component.
  @param tabsets {array} - An array of objects, each representing a tab and its panel.
    Each object should have:
    - id {string}: Unique identifier prefix for the tab and panel.
    - tab {string}: HTML content for the tab button.
    - panel {string} [optional]: HTML content for the tab panel.
    - tab_attrs {object} [optional]: Additional HTML attributes for the tab button.
    - panel_attrs {object} [optional]: Additional HTML attributes for the tab panel div.
  @param main_attrs {object} [optional] - Additional HTML attributes for the main container div.
  @param tablist_attrs {object} [optional] - Additional HTML attributes for the tablist nav element.
  @param default_tab_index {number} [optional] [default=0] - The 0-based index of the tab to be active initially.
--%>

@import java.util.List
@import gg.jte.support.ForSupport
@import com.basecoatui.jte.util.BasecoatTab

@param String id
@param List<BasecoatTab> tabs = null
@param int defaultTabIndex = 0
@param String mainClassAppend = null
@param String tabListClassAppend = null

<div id="${id}" class="tabs ${mainClassAppend}">
  <nav
    class="${tabListClassAppend}"
    role="tablist"
    aria-orientation="horizontal"
  >
    @for(var tab : ForSupport.of(tabs))
      <button
        type="button"
        role="tab"
        id="${id}-tab-${tab.getIndex()}"
        aria-controls="${id}-panel-${tab.getIndex()}"
        aria-selected="${tab.getIndex() == defaultTabIndex ? "true" : "false"}"
        tabindex="0"
      >
        ${tab.get().tab()}
      </button>
    @endfor
  </nav>

  @for(var tab : ForSupport.of(tabs))
    @if(tab.get().panel() != null)
      <div
        role="tabpanel"
        id="${id}-panel-${tab.getIndex()}"
        aria-labelledby="${id}-tab-${tab.getIndex()}"
        tabindex="-1"
        aria-selected="${tab.getIndex() == defaultTabIndex ? "true" : "false"}"
        hidden="${tab.getIndex() != defaultTabIndex}"
      >
        ${tab.get().panel()}
      </div>
    @endif
  @endfor
</div>
