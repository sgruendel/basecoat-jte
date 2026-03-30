package com.basecoatui.jte.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


@Component
public class JteContextInterceptor implements HandlerInterceptor {

    @Override
    public void postHandle(final HttpServletRequest request, final HttpServletResponse response,
            final Object handler, final ModelAndView modelAndView) {
        if (modelAndView != null) {
            JteContext.init(modelAndView.getModelMap());
        }
    }

    @Override
    public void afterCompletion(final HttpServletRequest request,
            final HttpServletResponse response, final Object handler, final Exception ex) {
        JteContext.reset();
    }

}
