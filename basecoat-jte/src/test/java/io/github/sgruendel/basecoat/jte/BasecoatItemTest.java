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
import java.util.LinkedHashMap;
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

    private enum Color {
        LIGHT_BLUE,
        RED;

        @Override
        public String toString() {

            return name().charAt(0) + name().substring(1).toLowerCase().replace('_', ' ');
        }
    }

    @Test
    void optionListOfMapKeepsIterationOrderAndConvertsKeys() {

        final Map<Object, String> labelsByValue = new LinkedHashMap<>();
        labelsByValue.put(2L, "Marine");
        labelsByValue.put(1L, "Aviation");
        labelsByValue.put(Color.LIGHT_BLUE, "Sky");

        assertEquals(
                List.of(Option.of("Marine", "2"), Option.of("Aviation", "1"), Option.of("Sky", "LIGHT_BLUE")),
                Option.listOf(labelsByValue));
    }

    @Test
    void optionListOfEnumUsesLabelFunctionAndNames() {

        assertEquals(
                List.of(Option.of("light blue", "LIGHT_BLUE"), Option.of("red", "RED")),
                Option.listOf(
                        Color.values(), color -> color.name().toLowerCase().replace('_', ' ')));
    }

    @Test
    void optionListOfCollectionUsesStringRepresentationAsLabel() {

        assertEquals(List.of(Option.of("10", "10"), Option.of("25", "25")), Option.listOf(List.of(10, 25)));
        assertEquals(
                List.of(Option.of("Light blue", "LIGHT_BLUE"), Option.of("Red", "RED")),
                Option.listOf(List.of(Color.values())));
    }

    @Test
    void menuItemWithersReturnUpdatedCopies() {

        final var item = MenuItem.of("Profile", "/profile");
        final var updated = item.withIcon(CONTENT)
                .withKeywords("account")
                .withDisabled(true)
                .withAttrs(Map.of("data-x", "1"));

        assertNull(item.icon());
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
    void menuItemFactoriesAcceptUrl() {

        assertEquals("/profile", MenuItem.of("Profile", "/profile").url());
        assertEquals("/profile", MenuItem.of(CONTENT, "/profile").url());
        assertNull(MenuItem.of("Profile").url());
        assertNull(MenuItem.of(CONTENT).url());
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
        assertThrows(IllegalArgumentException.class, () -> MenuItem.of((String) null, "/"));
        assertThrows(IllegalArgumentException.class, () -> NavItem.of((String) null, "/"));
        assertThrows(IllegalArgumentException.class, () -> Submenu.of((Content) null, List.of()));
    }
}
