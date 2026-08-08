package com.basecoatui.jte.util;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


public class JteContext {

    private static final ThreadLocal<ModelMap> model = new ThreadLocal<>();

    public static void init(final ModelMap model) {
        JteContext.model.set(model);
    }

    public static void reset() {
        JteContext.model.remove();
    }

    public static boolean isDevserver() {
        return "1".equals(getRequest().getHeader("X-Devserver"));
    }

    public static HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

}
