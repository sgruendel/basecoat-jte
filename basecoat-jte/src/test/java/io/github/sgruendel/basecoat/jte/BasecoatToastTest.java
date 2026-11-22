package io.github.sgruendel.basecoat.jte;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertSame;

import gg.jte.Content;
import io.github.sgruendel.basecoat.jte.BasecoatToast.Button;
import io.github.sgruendel.basecoat.jte.BasecoatToast.Category;
import java.time.Duration;
import java.util.Map;
import org.junit.jupiter.api.Test;

class BasecoatToastTest {

    @Test
    void factoriesSetCategoryTitleAndDescription() {

        final var toast = BasecoatToast.of(Category.INFO, "Saved");
        assertEquals(Category.INFO, toast.category());
        assertEquals("Saved", toast.title());
        assertNull(toast.description());

        assertEquals(
                "Details", BasecoatToast.of(Category.ERROR, "Failed", "Details").description());
    }

    @Test
    void withersReturnUpdatedCopies() {

        final Content icon = output -> output.writeContent("<svg></svg>");
        final var toast = BasecoatToast.of(Category.WARNING, "Low disk space");
        final var updated = toast.withAction(Button.of("View"))
                .withCancel(Button.of("Dismiss"))
                .withDuration(Duration.ofSeconds(10))
                .withIcon(icon)
                .withAttrs(Map.of("data-x", "1"));

        assertNull(toast.action());
        assertEquals(Button.of("View"), updated.action());
        assertEquals(Button.of("Dismiss"), updated.cancel());
        assertEquals(Duration.ofSeconds(10), updated.duration());
        assertSame(icon, updated.icon());
        assertEquals(Map.of("data-x", "1"), updated.attrs());
        assertEquals(Category.WARNING, updated.category());
        assertEquals("Low disk space", updated.title());
    }

    @Test
    void categoryDefaultsToSuccess() {

        assertEquals(Category.SUCCESS, BasecoatToast.of(null, "Done").category());
    }
}
