package com.basecoatui.jte.util;

import gg.jte.Content;

import java.util.Map;


public record BasecoatToast(Category category, String title, String description, Button action,
                            Button cancel, Map<?, ?> attrs, Content content) {

    public enum Category {
        SUCCESS, INFO, WARNING, ERROR
    }

    public record Button(String href, String label, String onclick) {

        public static Button of(final String label) {

            return new Button(null, label, null);
        }

        public static Button of(final String label, final String onclick) {

            return new Button(null, label, onclick);
        }

    }

}
