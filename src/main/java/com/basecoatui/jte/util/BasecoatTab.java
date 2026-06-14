package com.basecoatui.jte.util;

import gg.jte.Content;

import java.util.Map;


public record BasecoatTab(String tabText, Content tabContent, Map<?, ?> tabAttrs, Content panel, Map<?, ?> panelAttrs) {

    public static BasecoatTab of(final String tabText) {

        return new BasecoatTab(tabText, null, null, null, null);
    }

    public static BasecoatTab of(final Content tabContent) {

        return new BasecoatTab(null, tabContent, null, null, null);
    }

    public static BasecoatTab of(final String tabText, final Map<?, ?> tabAttrs) {

        return new BasecoatTab(tabText, null, tabAttrs, null, null);
    }

    public static BasecoatTab of(final String tabText, final Content panel) {

        return new BasecoatTab(tabText, null, null, panel, null);
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
