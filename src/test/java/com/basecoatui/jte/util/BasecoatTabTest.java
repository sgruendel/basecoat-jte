package com.basecoatui.jte.util;

import org.junit.jupiter.api.Test;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;


class BasecoatTabTest {

    @Test
    void isDisabledReturnsTrueForDisabledAttribute() {

        assertTrue(BasecoatTab.of("Tab 1", Map.of("disabled", true)).isDisabled());
        assertTrue(BasecoatTab.of("Tab 2", Map.of("disabled", "true")).isDisabled());
        assertTrue(BasecoatTab.of("Tab 3", Map.of("aria-disabled", "true")).isDisabled());
        assertFalse(BasecoatTab.of("Tab 4", Map.of("disabled", false)).isDisabled());
        assertFalse(BasecoatTab.of("Tab 5", Map.of("disabled", "false")).isDisabled());
        assertFalse(BasecoatTab.of("Tab 6", Map.of("aria-disabled", "false")).isDisabled());
        assertFalse(BasecoatTab.of("Tab 7").isDisabled());
    }

}
