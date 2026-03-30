package com.basecoatui.jte.util;

import org.springframework.ui.ModelMap;


public class JteContext {

    private static final ThreadLocal<ModelMap> model = new ThreadLocal<>();

    public static void init(final ModelMap model) {
        JteContext.model.set(model);
    }

    public static void reset() {
        JteContext.model.remove();
    }

}
