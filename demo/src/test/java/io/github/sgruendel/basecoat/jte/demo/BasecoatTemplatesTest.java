package io.github.sgruendel.basecoat.jte.demo;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import gg.jte.Content;
import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import gg.jte.output.StringOutput;
import io.github.sgruendel.basecoat.jte.BasecoatItem;
import io.github.sgruendel.basecoat.jte.BasecoatItem.Group;
import io.github.sgruendel.basecoat.jte.BasecoatItem.MenuItem;
import io.github.sgruendel.basecoat.jte.BasecoatItem.NavItem;
import io.github.sgruendel.basecoat.jte.BasecoatItem.Option;
import io.github.sgruendel.basecoat.jte.BasecoatItem.Submenu;
import io.github.sgruendel.basecoat.jte.BasecoatTab;
import io.github.sgruendel.basecoat.jte.BasecoatToast;
import io.github.sgruendel.basecoat.jte.BasecoatToast.Button;
import io.github.sgruendel.basecoat.jte.BasecoatToast.Category;
import java.time.Duration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;

/** Renders the precompiled Basecoat component templates with {@link BasecoatItem} lists. */
class BasecoatTemplatesTest {

    private static final TemplateEngine ENGINE = TemplateEngine.createPrecompiled(ContentType.Html);

    private static final Content ICON = output -> output.writeContent("<svg class=\"icon\"></svg>");

    private static Content html(final String html) {

        return output -> output.writeContent(html);
    }

    private static String render(final String template, final Map<String, Object> params) {

        final var output = new StringOutput();
        ENGINE.render(template, params, output);
        return output.toString().replaceAll("\\s+", " ");
    }

    @Test
    void selectRendersGroupsSeparatorsAndOptions() {

        final var html = render(
                "basecoat/select.jte",
                Map.of(
                        "id",
                        "fruit",
                        "selected",
                        "banana",
                        "items",
                        List.of(
                                Group.of("Fruits", List.of(Option.of("Apple", "apple"), Option.of("Banana", "banana"))),
                                BasecoatItem.SEPARATOR,
                                Option.of(html("<b>Other</b>"), "other").withLabel("Other"),
                                Option.of("<i>escaped</i>", "escaped"))));

        assertThat(html)
                .contains("<span class=\"truncate\">Banana</span>")
                .contains("role=\"group\" aria-labelledby=\"group-label-fruit-items-0\"")
                .contains("<div role=\"heading\" id=\"group-label-fruit-items-0\">Fruits</div>")
                .contains("id=\"fruit-items-0-1\" role=\"option\" data-value=\"banana\" aria-selected=\"true\"")
                .contains("<hr role=\"separator\" />")
                .contains("data-value=\"other\" data-label=\"Other\" > <b>Other</b> </div>")
                .contains("&lt;i&gt;escaped&lt;/i&gt;")
                .contains("<input type=\"hidden\" name=\"fruit-value\" value=\"banana\"");
    }

    @Test
    void selectTriggerShowsContentOfOptionWithoutTextLabel() {

        final var html = render(
                "basecoat/select.jte",
                Map.of("id", "rich", "selected", "1", "items", List.of(Option.of(html("<b>One</b>"), "1"))));

        assertThat(html).contains("<span class=\"truncate\"><b>One</b></span>").doesNotContain("data-label");
    }

    @Test
    void comboboxRendersOptions() {

        final var html = render(
                "basecoat/combobox.jte",
                Map.of("id", "fruit", "selected", "apple", "items", List.of(Option.of("Apple", "apple"))));

        assertThat(html)
                .contains("role=\"option\" data-value=\"apple\" aria-selected=\"true\"")
                .contains("value=\"apple\"");
    }

    @Test
    void selectWithoutSelectionDefaultsToFirstOptionUnlessPlaceholderIsSet() {

        final List<Option> items = List.of(Option.of("Apple", "apple"), Option.of("Banana", "banana"));

        assertThat(render("basecoat/select.jte", Map.of("id", "fruit", "items", items)))
                .contains("<span class=\"truncate\">Apple</span>")
                .contains("name=\"fruit-value\" value=\"apple\"")
                .doesNotContain("aria-selected");

        assertThat(render("basecoat/select.jte", Map.of("id", "fruit", "placeholder", "Pick a fruit", "items", items)))
                .contains("data-placeholder=\"Pick a fruit\"")
                .contains("<span class=\"truncate\">Pick a fruit</span>")
                .contains("name=\"fruit-value\" value=\"\"");

        assertThat(render(
                        "basecoat/select.jte",
                        Map.of("id", "fruit", "placeholder", "Pick a fruit", "selected", "banana", "items", items)))
                .contains("<span class=\"truncate\">Banana</span>")
                .contains("name=\"fruit-value\" value=\"banana\"");
    }

    @Test
    void selectFindsOptionsInNestedGroups() {

        final List<BasecoatItem> items = List.of(
                Group.of("Food", List.of(Group.of("Fruits", List.of(Option.of("Apple", "apple"))))),
                Option.of("Banana", "banana"));

        assertThat(render("basecoat/select.jte", Map.of("id", "food", "selected", "apple", "items", items)))
                .contains("<span class=\"truncate\">Apple</span>")
                .contains("name=\"food-value\" value=\"apple\"")
                .contains("id=\"food-items-0-0-0\" role=\"option\" data-value=\"apple\" aria-selected=\"true\"");

        // without selection, the first option in document order is the nested one
        assertThat(render("basecoat/select.jte", Map.of("id", "food", "items", items)))
                .contains("<span class=\"truncate\">Apple</span>")
                .contains("name=\"food-value\" value=\"apple\"");
    }

    @Test
    void multipleSelectAndComboboxWriteSelectedValuesAsJsonArray() {

        final List<Option> items =
                List.of(Option.of("Apple", "apple"), Option.of("Banana", "banana"), Option.of("Cherry", "cherry"));
        final Map<String, Object> params =
                Map.of("id", "fruit", "multiple", true, "selectedList", List.of("apple", "cherry"), "items", items);

        assertThat(render("basecoat/select.jte", params))
                .contains("<span class=\"truncate\">Apple, Cherry</span>")
                .contains("value=\"[&#34;apple&#34;,&#34;cherry&#34;]\"");
        assertThat(render("basecoat/combobox.jte", params)).contains("value=\"[&#34;apple&#34;,&#34;cherry&#34;]\"");
        assertThat(render("basecoat/select.jte", Map.of("id", "fruit", "multiple", true, "items", items)))
                .contains("value=\"[]\"");
    }

    @Test
    void selectAndComboboxConvertNonStringSelectionsToOptionValues() {

        final List<Option> items = Option.listOf(Map.of(1L, "One"));
        final List<Option> enumItems =
                Option.listOf(Category.values(), category -> category.name().toLowerCase());

        assertThat(render("basecoat/select.jte", Map.of("id", "number", "selected", 1L, "items", items)))
                .contains("data-value=\"1\" aria-selected=\"true\"");
        assertThat(render("basecoat/combobox.jte", Map.of("id", "number", "selected", 1L, "items", items)))
                .contains("data-value=\"1\" aria-selected=\"true\"");
        assertThat(render(
                        "basecoat/select.jte", Map.of("id", "category", "selected", Category.INFO, "items", enumItems)))
                .contains("<span class=\"truncate\">info</span>")
                .contains("data-value=\"INFO\" aria-selected=\"true\"");
        assertThat(render(
                        "basecoat/select.jte",
                        Map.of(
                                "id",
                                "category",
                                "multiple",
                                true,
                                "selectedList",
                                List.of(Category.INFO, Category.ERROR),
                                "items",
                                enumItems)))
                .contains("value=\"[&#34;INFO&#34;,&#34;ERROR&#34;]\"");
    }

    @Test
    void groupHeadingIdsAreUniquePerComponentUnlessSetExplicitly() {

        final List<BasecoatItem> items = List.of(
                Group.of("Fruits", List.of(Group.of("Berries", List.of(Option.of("Strawberry", "strawberry"))))),
                Group.of("Vegetables", List.of(Option.of("Carrot", "carrot"))).withId("veggies"));

        assertThat(render("basecoat/select.jte", Map.of("id", "food", "items", items)))
                .contains("<div role=\"heading\" id=\"group-label-food-items-0\">Fruits</div>")
                .contains("<div role=\"heading\" id=\"group-label-food-items-0-0\">Berries</div>")
                .contains("aria-labelledby=\"veggies\"")
                .contains("<div role=\"heading\" id=\"veggies\">Vegetables</div>");

        assertThat(render(
                        "basecoat/dropdownMenu.jte",
                        Map.of("id", "menu", "items", List.of(Group.of("Account", List.of(MenuItem.of("Profile")))))))
                .contains("<div role=\"heading\" id=\"group-label-menu-items-0\">Account</div>");
    }

    @Test
    void dropdownMenuRendersLinksIconsAndDisabledItems() {

        final var html = render(
                "basecoat/dropdownMenu.jte",
                Map.of(
                        "id",
                        "menu",
                        "triggerText",
                        "Open",
                        "items",
                        List.of(
                                Group.of(
                                        "Account",
                                        List.of(
                                                MenuItem.of("Profile", "/profile")
                                                        .withIcon(ICON),
                                                MenuItem.of("Billing")
                                                        .withDisabled(true)
                                                        .withKeywords("ignored"))),
                                BasecoatItem.SEPARATOR,
                                MenuItem.of(html("<b>Log out</b>")))));

        assertThat(html)
                .contains("<a id=\"menu-items-0-0\" role=\"menuitem\" href=\"/profile\" > "
                        + "<svg class=\"icon\"></svg> Profile </a>")
                .contains("<div id=\"menu-items-0-1\" role=\"menuitem\" aria-disabled=\"true\" > Billing </div>")
                .contains("<div id=\"menu-items-2\" role=\"menuitem\" > <b>Log out</b> </div>")
                .doesNotContain("data-keywords");
    }

    @Test
    void commandRendersKeywordsAndDisabledItems() {

        final var html = render(
                "basecoat/command.jte",
                Map.of(
                        "id",
                        "cmd",
                        "items",
                        List.of(Group.of(
                                "Suggestions",
                                List.of(
                                        MenuItem.of("Calendar").withKeywords("events schedule"),
                                        MenuItem.of("Search", "/search").withDisabled(true))))));

        assertThat(html)
                .contains("<span role=\"heading\" id=\"group-label-cmd-items-0\">Suggestions</span>")
                .contains("id=\"cmd-items-0-0\" role=\"menuitem\" data-keywords=\"events schedule\" > Calendar")
                .contains("role=\"menuitem\" href=\"/search\" aria-disabled=\"true\"");
    }

    @Test
    void sidebarRendersGroupsSubmenusAndCurrentLinks() {

        final var html = render(
                "basecoat/sidebar.jte",
                Map.of(
                        "id",
                        "nav",
                        "menu",
                        List.of(
                                Group.of(List.of(NavItem.of("Home", "/")
                                        .withCurrent(true)
                                        .withIcon(ICON))),
                                Group.of(
                                        "Settings",
                                        List.of(Submenu.of(
                                                        "Account", List.of(NavItem.of(html("<b>Profile</b>"), "/me")))
                                                .withOpen(true))))));

        assertThat(html)
                .contains("<div role=\"group\" > <ul>")
                .contains("<a href=\"/\" aria-current=\"page\" > <svg class=\"icon\"></svg> <span>Home</span> </a>")
                .contains("<h3 id=\"group-label-nav-content-1\">Settings</h3>")
                .contains("<details id=\"submenu-nav-content-1-0\" open >")
                .contains("<span>Account</span>")
                .contains("<a href=\"/me\" > <span><b>Profile</b></span> </a>");
    }

    @Test
    void templatesRejectLeafTypesOfOtherComponents() {

        assertThatThrownBy(() ->
                        render("basecoat/select.jte", Map.of("id", "x", "items", List.of(NavItem.of("Home", "/")))))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageStartingWith("Unsupported select item: NavItem");

        assertThatThrownBy(() -> render("basecoat/sidebar.jte", Map.of("id", "x", "menu", List.of(MenuItem.of("x")))))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageStartingWith("Unsupported sidebar item: MenuItem");
    }

    @Test
    void triggersRenderEitherTextOrContent() {

        assertThat(render("basecoat/dropdownMenu.jte", Map.of("id", "menu", "triggerText", "<Open>")))
                .contains("> &lt;Open&gt; </button>");
        assertThat(render("basecoat/popover.jte", Map.of("id", "pop", "triggerContent", ICON, "content", html("x"))))
                .contains("> <svg class=\"icon\"></svg> </button>");
        assertThat(render("basecoat/dialog.jte", Map.of("id", "dlg", "triggerContent", ICON)))
                .contains("showModal()\" > <svg class=\"icon\"></svg> </button>");
        assertThat(render("basecoat/dialog.jte", Map.of("id", "dlg"))).doesNotContain("showModal()");

        assertThatThrownBy(() -> render(
                        "basecoat/dropdownMenu.jte",
                        Map.of("id", "menu", "triggerText", "Open", "triggerContent", ICON)))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("triggerText and triggerContent are exclusive");
        assertThatThrownBy(() -> render(
                        "basecoat/popover.jte",
                        Map.of("id", "pop", "triggerText", "Open", "triggerContent", ICON, "content", html("x"))))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("triggerText and triggerContent are exclusive");
        assertThatThrownBy(() ->
                        render("basecoat/dialog.jte", Map.of("id", "dlg", "trigger", "Open", "triggerContent", ICON)))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessage("trigger and triggerContent are exclusive");
    }

    @Test
    void templatesExceptSidebarRejectGroupsWithoutLabel() {

        assertThatThrownBy(() -> render(
                        "basecoat/select.jte",
                        Map.of("id", "x", "items", List.of(Group.of(List.of(Option.of("Apple", "apple")))))))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageStartingWith("Unsupported select group without label: Group");

        assertThatThrownBy(() -> render(
                        "basecoat/combobox.jte",
                        Map.of("id", "x", "items", List.of(Group.of(List.of(Option.of("Apple", "apple")))))))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageStartingWith("Unsupported select group without label: Group");

        assertThatThrownBy(() -> render(
                        "basecoat/dropdownMenu.jte",
                        Map.of("id", "x", "items", List.of(Group.of(List.of(MenuItem.of("Profile")))))))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageStartingWith("Unsupported dropdown menu group without label: Group");

        assertThatThrownBy(() -> render(
                        "basecoat/command.jte",
                        Map.of("id", "x", "items", List.of(Group.of(List.of(MenuItem.of("Calendar")))))))
                .rootCause()
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageStartingWith("Unsupported command group without label: Group");
    }

    @Test
    void dialogsOnlyCloseOnClicksThatStartedOnTheBackdrop() {

        final var onPointerDown = "onpointerdown=\"this.dataset.backdropPress = event.target === this\"";
        final var onClick =
                "onclick=\"if (event.target === this && this.dataset.backdropPress === 'true') this.close()\"";

        assertThat(render("basecoat/dialog.jte", Map.of("id", "dlg")))
                .contains(onPointerDown)
                .contains(onClick);
        assertThat(render("basecoat/dialog.jte", Map.of("id", "dlg", "closeOnOverlayClick", false)))
                .doesNotContain("backdropPress");
        assertThat(render("basecoat/commandDialog.jte", Map.of("id", "cmd")))
                .contains(onPointerDown)
                .contains(onClick);
    }

    @Test
    void toasterRendersEachToastWithItsFields() {

        final var html = render(
                "basecoat/toaster.jte",
                Map.of(
                        "toasts",
                        List.of(
                                BasecoatToast.of(Category.SUCCESS, "Saved", "All changes stored")
                                        .withAction(Button.of("View"))
                                        .withCancel(Button.of("Undo", "undo()")),
                                BasecoatToast.of(Category.ERROR, "Upload failed")
                                        .withDuration(Duration.ofSeconds(10))
                                        .withIcon(ICON)
                                        .withAttrs(Map.of("data-x", "1")))));

        assertThat(html)
                .contains("<ol id=\"toaster\" class=\"toaster\" role=\"list\" aria-label=\"Notifications\" >")
                .contains("data-category=\"success\"")
                .contains("<h2>Saved</h2>")
                .contains("<p>All changes stored</p>")
                .contains("data-toast-action")
                .contains("View")
                .contains("data-toast-cancel")
                .contains("onclick=\"undo()\"")
                .contains("<div class=\"toast-content\" role=\"alert\" aria-atomic=\"true\">")
                .contains("<li class=\"toast\" data-category=\"error\" data-duration=\"10000\" data-x=\"1\" >")
                .contains("<h2>Upload failed</h2>")
                .contains("<svg class=\"icon\"></svg>");
        assertThat(html.split("class=\"toast\"", -1)).hasSize(3);
        assertThat(html.split("aria-label=\"Close toast\"", -1)).hasSize(3);
    }

    @Test
    void toasterKeepsItsRoleAndUsesCustomAriaLabel() {

        final var html = render(
                "basecoat/toaster.jte",
                Map.of("attrs", Map.of("class", "x", "role", "region", "aria-label", "Alerts", "data-align", "start")));

        assertThat(html)
                .contains("<ol id=\"toaster\" class=\"toaster x\" role=\"list\" aria-label=\"Alerts\""
                        + " data-align=\"start\" >")
                .doesNotContain("region");
    }

    @Test
    void toastRendersLoadingCategoryAndOmitsCloseButtonOnRequest() {

        final var html = render(
                "basecoat/toaster.jte",
                Map.of(
                        "toasts",
                        List.of(BasecoatToast.of(Category.LOADING, "Creating event")
                                .withCloseButton(false))));

        assertThat(html)
                .contains("data-category=\"loading\"")
                .contains("role=\"status\"")
                .doesNotContain("Close toast")
                .doesNotContain("<footer>");
    }

    @Test
    void toastWithoutCategoryHasNoCategoryOrIcon() {

        final var params = new HashMap<String, Object>();
        params.put("category", null);
        params.put("title", "Event created");
        params.put("closeButton", false);
        assertThat(render("basecoat/toast.jte", params))
                .doesNotContain("data-category")
                .contains("role=\"status\"")
                .doesNotContain("<svg");

        assertThat(render(
                        "basecoat/toaster.jte",
                        Map.of(
                                "toasts",
                                List.of(BasecoatToast.of(null, "Event created").withCloseButton(false)))))
                .doesNotContain("data-category")
                .doesNotContain("<svg");
    }

    @Test
    void toastRendersLinkButtonsAndSkipsEmptyTexts() {

        final var html = render(
                "basecoat/toaster.jte",
                Map.of(
                        "toasts",
                        List.of(BasecoatToast.of(Category.INFO, "", "Event created")
                                .withAction(Button.link("Open", "/events/1"))
                                .withCancel(Button.link("Undo", "/events/1/undo"))
                                .withDuration(BasecoatToast.PERSISTENT))));

        assertThat(html)
                .doesNotContain("<h2>")
                .contains("<p>Event created</p>")
                .contains("data-duration=\"-1\"")
                .contains("<a href=\"/events/1\" class=\"btn\" data-variant=\"outline\" data-size=\"sm\""
                        + " data-toast-action")
                .contains("<a href=\"/events/1/undo\" class=\"btn\" data-variant=\"outline\" data-size=\"sm\""
                        + " data-toast-cancel");
    }

    @Test
    void tabPanelsDoNotCarryAriaSelected() {

        final var html = render(
                "basecoat/tabs.jte",
                Map.of(
                        "id",
                        "t",
                        "tabs",
                        List.of(
                                BasecoatTab.of("A").withPanel(html("<p>a</p>")),
                                BasecoatTab.of("B").withPanel(html("<p>b</p>")))));

        assertThat(html).contains("role=\"tabpanel\"").contains(" hidden");
        assertThat(html.split("aria-selected", -1)).hasSize(3);
    }
}
