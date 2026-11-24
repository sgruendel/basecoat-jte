package io.github.sgruendel.basecoat.jte;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import gg.jte.Content;
import java.util.Map;
import org.junit.jupiter.api.Test;

class BasecoatTabTest {

    private static final Content CONTENT = output -> output.writeContent("<b>rich</b>");

    @Test
    void factoriesSetTextOrContentAndWithMethodsSetOptionalFields() {

        final var text = BasecoatTab.of("Tab");
        assertEquals(new BasecoatTab("Tab", null, null, null, null), text);

        final var rich = BasecoatTab.of(CONTENT)
                .withTabAttrs(Map.of("data-view", "a"))
                .withPanel(CONTENT)
                .withPanelAttrs(Map.of("class", "p-4"));
        assertNull(rich.tabText());
        assertSame(CONTENT, rich.tabContent());
        assertEquals(Map.of("data-view", "a"), rich.tabAttrs());
        assertSame(CONTENT, rich.panel());
        assertEquals(Map.of("class", "p-4"), rich.panelAttrs());
    }

    @Test
    void requiresExactlyOneOfTextAndContent() {

        assertThrows(IllegalArgumentException.class, () -> BasecoatTab.of((String) null));
        assertThrows(IllegalArgumentException.class, () -> BasecoatTab.of((Content) null));
        assertThrows(IllegalArgumentException.class, () -> new BasecoatTab("Tab", CONTENT, null, null, null));
    }

    @Test
    void isDisabledReturnsTrueForDisabledAttribute() {

        assertTrue(
                BasecoatTab.of("Tab 1").withTabAttrs(Map.of("disabled", true)).isDisabled());
        assertTrue(
                BasecoatTab.of("Tab 2").withTabAttrs(Map.of("disabled", "true")).isDisabled());
        assertTrue(BasecoatTab.of("Tab 3")
                .withTabAttrs(Map.of("aria-disabled", "true"))
                .isDisabled());
        assertFalse(
                BasecoatTab.of("Tab 4").withTabAttrs(Map.of("disabled", false)).isDisabled());
        assertFalse(BasecoatTab.of("Tab 5")
                .withTabAttrs(Map.of("disabled", "false"))
                .isDisabled());
        assertFalse(BasecoatTab.of("Tab 6")
                .withTabAttrs(Map.of("aria-disabled", "false"))
                .isDisabled());
        assertFalse(BasecoatTab.of("Tab 7").isDisabled());
    }

    @Test
    void withTabAttrAndWithPanelAttrMergeIntoExistingAttrsAndKeepOtherFields() {

        final Content panel = output -> output.writeContent("<p>panel</p>");
        final var tab = new BasecoatTab("Tab", null, Map.of("data-view", "a"), panel, Map.of("class", "p-4"));

        assertEquals(
                new BasecoatTab("Tab", null, Map.of("data-view", "a", "disabled", true), panel, Map.of("class", "p-4")),
                tab.withTabAttr("disabled", true));
        assertEquals(
                new BasecoatTab("Tab", null, Map.of("data-view", "a"), panel, Map.of("class", "p-4", "data-x", "1")),
                tab.withPanelAttr("data-x", "1"));
        assertEquals(
                new BasecoatTab(null, CONTENT, Map.of("data-x", "1"), null, null),
                BasecoatTab.of(CONTENT).withTabAttr("data-x", "1"));
    }

    @Test
    void withTabAttrTogglesDisabled() {

        final var tab = BasecoatTab.of("Tab").withTabAttr("disabled", true);
        assertTrue(tab.isDisabled());
        assertFalse(tab.withTabAttr("disabled", null).isDisabled());
    }
}
