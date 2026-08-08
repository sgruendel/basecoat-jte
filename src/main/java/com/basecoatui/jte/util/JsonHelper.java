package com.basecoatui.jte.util;

import tools.jackson.core.JacksonException;
import tools.jackson.databind.ObjectMapper;

// TODO integrate into JteHelper
public final class JsonHelper {

    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    private JsonHelper() {
    }

    public static String write(final Object value) {

        try {
            return OBJECT_MAPPER.writeValueAsString(value);
        } catch (final JacksonException exception) {
            throw new IllegalStateException("Unable to serialize JSON", exception);
        }
    }

}
