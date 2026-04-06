package com.basecoatui.jte.util;

import org.junit.jupiter.api.Test;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;


class JteHelperTest {

    @Test
    void attrsReturnsNullForNullOrEmptyMap() {

        assertNull(JteHelper.attrs(null));
        assertNull(JteHelper.attrs(Map.of()));
    }

    @Test
    void attrsRendersValidHtmlAttributeNames() {

        assertEquals(" data-test=\"value\"", JteHelper.attrs(Map.of("data-test", "value")));
        assertEquals(" aria-label=\"Close\"", JteHelper.attrs(Map.of("aria-label", "Close")));
        assertEquals(" x-on:click=\"toggle\"", JteHelper.attrs(Map.of("x-on:click", "toggle")));
        assertEquals(" DATA-COUNT=\"1\"", JteHelper.attrs(Map.of("DATA-COUNT", "1")));
    }

    @Test
    void attrsRejectsInvalidHtmlAttributeNames() {

        final var invalidNames = List.of(
                "",
                "data slot",
                "data/slot",
                "data=slot",
                "data>slot",
                "data\"slot",
                "data'slot",
                "\u0000data",
                "data\uFDD0slot"
        );

        invalidNames.forEach(name -> assertThrows(
                IllegalArgumentException.class,
                () -> JteHelper.attrs(Map.of(name, "value"))
        ));
    }

    @Test
    void attrsEscapesRegularHtmlAttributeValues() {

        assertEquals(" title=\"Tom &amp; Jerry\"", JteHelper.attrs(Map.of("title", "Tom & Jerry")));
        assertEquals(" data-text=\"&lt;quoted &#34;text&#34;>\"", JteHelper.attrs(Map.of("data-text", "<quoted \"text\">") ));
        assertEquals(" data-space=\"a\u00A0b\"", JteHelper.attrs(Map.of("data-space", "a\u00A0b")));
    }

    @Test
    void attrsEscapesJavaScriptEventHandlerAttributeValues() {

        assertEquals(
                " onclick=\"alert(\\x27x\\x27)\"",
                JteHelper.attrs(Map.of("onclick", "alert('x')"))
        );
    }

    @Test
    void attrsHandlesBooleanAndNullValues() {

        final Map<String, Object> attrs = new LinkedHashMap<>();
        attrs.put("disabled", true);
        attrs.put("hidden", false);
        attrs.put("title", null);
        attrs.put("id", "primary");

        assertEquals(" disabled id=\"primary\"", JteHelper.attrs(attrs));
    }

    @Test
    void attrsSkipsSingleKey() {

        final Map<?, ?> attrs = new LinkedHashMap<>(Map.of(
                "class", "btn",
                "id", "primary"
        ));

        assertEquals(" id=\"primary\"", JteHelper.attrs(attrs, "class"));
    }

    @Test
    void attrsSkipsMultipleKeys() {

        final Map<String, Object> attrs = new LinkedHashMap<>();
        attrs.put("class", "btn");
        attrs.put("id", "primary");
        attrs.put("data-size", "lg");

        assertEquals(" data-size=\"lg\"", JteHelper.attrs(attrs, List.of("class", "id")));
    }

    @Test
    void attrsListSkipFallsBackToAllAttrsWhenSkipListIsNullOrEmpty() {

        final Map<String, Object> attrs = new LinkedHashMap<>();
        attrs.put("id", "primary");
        attrs.put("data-size", "lg");

        assertEquals(" id=\"primary\" data-size=\"lg\"", JteHelper.attrs(attrs, null));
        assertEquals(" id=\"primary\" data-size=\"lg\"", JteHelper.attrs(attrs, List.of()));
    }

    @Test
    void classAppendUsesClassAttributeWhenPresent() {

        assertEquals("btn btn-primary", JteHelper.classAppend("btn", Map.of("class", "btn-primary")));
        assertEquals("btn", JteHelper.classAppend("btn", Map.of("class", "")));
        assertEquals("btn", JteHelper.classAppend("btn", Map.of("id", "primary")));
        assertEquals("btn", JteHelper.classAppend("btn", null));
    }

}
