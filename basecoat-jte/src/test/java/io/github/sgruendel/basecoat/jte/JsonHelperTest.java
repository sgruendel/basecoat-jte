package io.github.sgruendel.basecoat.jte;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.LinkedHashMap;
import java.util.List;
import org.junit.jupiter.api.Test;

class JsonHelperTest {

    @Test
    void writesListsAsJsonArrays() {

        assertEquals("[\"a\",\"b \\\"c\\\"\"]", JsonHelper.write(List.of("a", "b \"c\"")));
        assertEquals("[]", JsonHelper.write(List.of()));
    }

    @Test
    void writesMapsAndNull() {

        final var map = new LinkedHashMap<String, Object>();
        map.put("size", 10);
        map.put("sort", "id");

        assertEquals("{\"size\":10,\"sort\":\"id\"}", JsonHelper.write(map));
        assertEquals("null", JsonHelper.write(null));
    }
}
