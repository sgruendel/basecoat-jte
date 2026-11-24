package io.github.sgruendel.basecoat.jte;

import gg.jte.Content;
import java.util.Map;

/**
 * A tab of the tabs template, consisting of the tab button and an optional panel. The tab button shows either plain
 * text, which is HTML-escaped, or rich content, so exactly one of {@code tabText} and {@code tabContent} must be set.
 * Optional fields are set with {@code with*} methods, each returning a new tab.
 *
 * @param tabText the tab button text; {@code null} if {@code tabContent} is set
 * @param tabContent rich tab button content; {@code null} if {@code tabText} is set
 * @param tabAttrs additional HTML attributes for the tab button; set {@code disabled} or {@code aria-disabled} to
 *     disable the tab, see {@link #isDisabled()}
 * @param panel the panel content; no panel if {@code null}
 * @param panelAttrs additional HTML attributes for the panel element
 */
public record BasecoatTab(String tabText, Content tabContent, Map<?, ?> tabAttrs, Content panel, Map<?, ?> panelAttrs) {

    /**
     * Creates a tab.
     *
     * @throws IllegalArgumentException unless exactly one of {@code tabText} and {@code tabContent} is set
     */
    public BasecoatTab {

        if ((tabText == null) == (tabContent == null)) {
            throw new IllegalArgumentException("exactly one of tabText and tabContent is required");
        }
    }

    /**
     * Creates a tab with a text button and no panel.
     *
     * @param tabText the tab button text
     * @return the tab
     * @throws IllegalArgumentException if {@code tabText} is {@code null}
     */
    public static BasecoatTab of(final String tabText) {

        return new BasecoatTab(tabText, null, null, null, null);
    }

    /**
     * Creates a tab with a rich content button and no panel.
     *
     * @param tabContent the tab button content
     * @return the tab
     * @throws IllegalArgumentException if {@code tabContent} is {@code null}
     */
    public static BasecoatTab of(final Content tabContent) {

        return new BasecoatTab(null, tabContent, null, null, null);
    }

    /**
     * Returns a copy of this tab with the given additional HTML attributes for the tab button, replacing
     * any set before.
     *
     * @param tabAttrs the attributes for the tab button, rendered by {@link JteHelper#attrs(Map)}; set
     *     {@code disabled} or {@code aria-disabled} to disable the tab
     * @return the new tab
     */
    public BasecoatTab withTabAttrs(final Map<?, ?> tabAttrs) {

        return new BasecoatTab(tabText, tabContent, tabAttrs, panel, panelAttrs);
    }

    /**
     * Returns a copy of this tab with the given additional HTML attribute for the tab button set, keeping the others.
     *
     * @param attrName the attribute name
     * @param attrValue the attribute value, rendered by {@link JteHelper#attrs(Map)}, or {@code null} to remove the
     *     attribute
     * @return the new tab
     * @throws IllegalArgumentException if {@code attrName} is not a valid HTML attribute name
     */
    public BasecoatTab withTabAttr(final String attrName, final Object attrValue) {

        return new BasecoatTab(
                tabText, tabContent, JteHelper.withAttr(tabAttrs, attrName, attrValue), panel, panelAttrs);
    }

    /**
     * Returns a copy of this tab with the given panel.
     *
     * @param panel the panel content, or {@code null} for no panel
     * @return the new tab
     */
    public BasecoatTab withPanel(final Content panel) {

        return new BasecoatTab(tabText, tabContent, tabAttrs, panel, panelAttrs);
    }

    /**
     * Returns a copy of this tab with the given additional HTML attributes for the panel, replacing any set before.
     *
     * @param panelAttrs the attributes for the panel element, rendered by {@link JteHelper#attrs(Map)}
     * @return the new tab
     */
    public BasecoatTab withPanelAttrs(final Map<?, ?> panelAttrs) {

        return new BasecoatTab(tabText, tabContent, tabAttrs, panel, panelAttrs);
    }

    /**
     * Returns a copy of this tab with the given additional HTML attribute for the panel set, keeping the others.
     *
     * @param attrName the attribute name
     * @param attrValue the attribute value, rendered by {@link JteHelper#attrs(Map)}, or {@code null} to remove the
     *     attribute
     * @return the new tab
     * @throws IllegalArgumentException if {@code attrName} is not a valid HTML attribute name
     */
    public BasecoatTab withPanelAttr(final String attrName, final Object attrValue) {

        return new BasecoatTab(
                tabText, tabContent, tabAttrs, panel, JteHelper.withAttr(panelAttrs, attrName, attrValue));
    }

    /**
     * Checks if the tab is disabled based on the presence of "disabled" or "aria-disabled" attributes in the tabAttrs
     * map.
     *
     * @return {@code true} if the tab is disabled, {@code false} otherwise.
     */
    public boolean isDisabled() {

        if (tabAttrs != null) {
            final Object disabled = tabAttrs.get("disabled");
            final Object ariaDisabled = tabAttrs.get("aria-disabled");
            return Boolean.TRUE.equals(disabled) || "true".equals(disabled) || "true".equals(ariaDisabled);
        }
        return false;
    }
}
