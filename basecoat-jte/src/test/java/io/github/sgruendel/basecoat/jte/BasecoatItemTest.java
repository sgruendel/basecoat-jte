package io.github.sgruendel.basecoat.jte;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import gg.jte.Content;
import io.github.sgruendel.basecoat.jte.BasecoatItem.Group;
import io.github.sgruendel.basecoat.jte.BasecoatItem.MenuItem;
import io.github.sgruendel.basecoat.jte.BasecoatItem.NavItem;
import io.github.sgruendel.basecoat.jte.BasecoatItem.Option;
import io.github.sgruendel.basecoat.jte.BasecoatItem.Submenu;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;

class BasecoatItemTest {

    private static final Content CONTENT = output -> output.writeContent("<b>rich</b>");

    @Test
    void optionFactoriesSetLabelOrContent() {

        final var text = Option.of("Apple", "apple");
        assertEquals("Apple", text.label());
        assertNull(text.content());
        assertEquals("apple", text.value());

        final var rich = Option.of(CONTENT, "apple").withLabel("Apple").withAttrs(Map.of("data-x", "1"));
        assertEquals("Apple", rich.label());
        assertSame(CONTENT, rich.content());
        assertEquals("apple", rich.value());
        assertEquals(Map.of("data-x", "1"), rich.attrs());
    }

    @Test
    void menuItemWithersReturnUpdatedCopies() {

        final var item = MenuItem.of("Profile");
        final var updated = item.withUrl("/profile")
                .withIcon(CONTENT)
                .withKeywords("account")
                .withDisabled(true)
                .withAttrs(Map.of("data-x", "1"));

        assertNull(item.url());
        assertFalse(item.disabled());
        assertEquals("Profile", updated.label());
        assertEquals("/profile", updated.url());
        assertSame(CONTENT, updated.icon());
        assertEquals("account", updated.keywords());
        assertTrue(updated.disabled());
        assertEquals(Map.of("data-x", "1"), updated.attrs());
        assertSame(CONTENT, MenuItem.of(CONTENT).content());
    }

    @Test
    void sidebarItemsSupportCurrentOpenAndIcons() {

        final var home = NavItem.of("Home", "/").withCurrent(true).withIcon(CONTENT);
        assertTrue(home.current());
        assertSame(CONTENT, home.icon());
        assertEquals("/", NavItem.of(CONTENT, "/").url());

        final var submenu = Submenu.of("Settings", List.of(home)).withOpen(true).withIcon(CONTENT);
        assertTrue(submenu.open());
        assertEquals(List.of(home), submenu.items());
        assertSame(CONTENT, Submenu.of(CONTENT, List.of()).content());
    }

    @Test
    void groupsAcceptAnyItemListAndOptionalLabel() {

        final List<Option> options = List.of(Option.of("Apple", "apple"));
        final var group = Group.of("Fruits", options).withId("fruits").withAttrs(Map.of("data-x", "1"));
        assertEquals("fruits", group.id());
        assertEquals("Fruits", group.label());
        assertEquals(options, group.items());

        final var unlabeled = Group.of(List.of(BasecoatItem.SEPARATOR));
        assertNull(unlabeled.label());
        assertSame(BasecoatItem.SEPARATOR, unlabeled.items().getFirst());
    }

    @Test
    void leavesRequireLabelOrContent() {

        assertThrows(IllegalArgumentException.class, () -> Option.of((String) null, "x"));
        assertThrows(IllegalArgumentException.class, () -> MenuItem.of((Content) null));
        assertThrows(IllegalArgumentException.class, () -> NavItem.of((String) null, "/"));
        assertThrows(IllegalArgumentException.class, () -> Submenu.of((Content) null, List.of()));
    }
}
