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

}
