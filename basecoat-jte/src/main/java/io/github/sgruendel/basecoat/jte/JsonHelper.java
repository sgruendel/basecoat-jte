package io.github.sgruendel.basecoat.jte;

import tools.jackson.core.JacksonException;
import tools.jackson.databind.json.JsonMapper;

/**
 * Serializes values to JSON, for example for the hidden input of a multiple select, which Basecoat's script reads as a
 * JSON array.
 *
 * <p>Requires Jackson 3 ({@code tools.jackson.core:jackson-databind}) at runtime, which Spring Boot 4 web applications
 * include; Spring Boot 3 and earlier include Jackson 2 instead. It is kept out of {@link JteHelper}, so the other
 * helpers work without Jackson.
 */
public final class JsonHelper {

    private static final JsonMapper JSON_MAPPER = new JsonMapper();

    private JsonHelper() {}

    /**
     * Serializes a value to JSON.
     *
     * @param value the value to serialize
     * @return the JSON representation of {@code value}
     * @throws IllegalStateException if the value cannot be serialized
     */
    public static String write(final Object value) {

        try {
            return JSON_MAPPER.writeValueAsString(value);
        } catch (final JacksonException exception) {
            throw new IllegalStateException("Unable to serialize JSON", exception);
        }
    }
}
