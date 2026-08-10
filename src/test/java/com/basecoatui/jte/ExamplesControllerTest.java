package com.basecoatui.jte;

import com.basecoatui.jte.examples.admindashboard.models.OutlinePage;
import com.basecoatui.jte.examples.admindashboard.models.OutlineSelection;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.test.web.servlet.MockMvc;
import tools.jackson.databind.ObjectMapper;

import java.util.stream.LongStream;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class ExamplesControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper mockMvc2;

    @Test
    void dashboardRendersTheInitialOutlinePage() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard"))
            .andExpect(status().isOk())
            .andExpect(model().attribute("pageSizeItems", hasSize(5)))
            .andExpect(model().attribute("baseUrl", is("/examples/admin-dashboard/outlines?size=10&sort=id,asc")))
            .andExpect(content().string(containsString("Cover page")))
            .andExpect(content().string(containsString("Page 1 of 7")))
            .andExpect(content().string(containsString("0 of 68 row(s) selected.")));
    }

    @Test
    void outlineEndpointRendersOnlyTheRequestedFragment() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/outlines")
                .param("page", "1")
                .param("size", "20")
                .param("sort", "target,desc"))
            .andExpect(status().isOk())
            .andExpect(model().attribute("pageSizeItems", hasSize(5)))
            .andExpect(model().attribute("baseUrl", is("/examples/admin-dashboard/outlines?size=20&sort=target,desc")))
            .andExpect(content().string(containsString("id=\"outline-results\"")))
            .andExpect(content().string(containsString("Page 2 of 4")))
            .andExpect(content().string(containsString("aria-sort=\"descending\"")))
            .andExpect(content().string(not(containsString("Document views"))));
    }

    @Test
    void outlineEndpointNormalizesInvalidParameters() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/outlines")
                .param("page", "-4")
                .param("size", "13")
                .param("sort", "unknown,unknown"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("Page 1 of 7")))
            .andExpect(result -> {
                final var page = (OutlinePage) result.getModelAndView().getModel().get("page");
                assertThat(page.page()).isZero();
                assertThat(page.size()).isEqualTo(10);
            });
    }

    @Test
    void outlineEndpointCarriesValidSelectionsAcrossPages() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/outlines")
                .param("page", "1")
                .param("size", "20")
                .param("selected", "1", "21", "999"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("2 of 68 row(s) selected.")))
            .andExpect(content().string(containsString("name=\"selected\" value=\"1\"")))
            .andExpect(result -> {
                final var selection = (OutlineSelection) result.getModelAndView().getModel().get("selection");
                assertThat(selection.selectedIds()).containsExactlyInAnyOrder(1L, 21L);
                assertThat(selection.offPageIds()).containsExactly(1L);
                assertThat(selection.isSelected(21)).isTrue();
                assertThat(selection.pageSelectionIndeterminate()).isTrue();
            });
    }

    @Test
    void outlineEndpointSelectsAndClearsTheCurrentPage() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/outlines").param("togglePage", "true"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("10 of 68 row(s) selected.")))
            .andExpect(result -> {
                final var selection = (OutlineSelection) result.getModelAndView().getModel().get("selection");
                assertThat(selection.selectedIds()).containsExactlyInAnyOrderElementsOf(
                    LongStream.rangeClosed(1, 10).boxed().toList()
                );
                assertThat(selection.allPageRowsSelected()).isTrue();
            });

        mockMvc.perform(get("/examples/admin-dashboard/outlines")
                .param("togglePage", "true")
                .param("selected", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("0 of 68 row(s) selected.")))
            .andExpect(result -> {
                final var selection = (OutlineSelection) result.getModelAndView().getModel().get("selection");
                assertThat(selection.selectedIds()).isEmpty();
                assertThat(selection.allPageRowsSelected()).isFalse();
            });
    }

    @Test
    void detailEndpointRendersReadOnlyContent() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/outlines/1"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("Cover page")))
            .andExpect(content().string(containsString("Document outline details")))
            .andExpect(content().string(containsString("January")))
            .andExpect(content().string(containsString("June")))
            .andExpect(content().string(not(containsString("<form"))));
    }

    @Test
    void detailEndpointReturnsNotFoundForUnknownRows() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/outlines/999"))
            .andExpect(status().isNotFound());
    }

    @Test
    void chartEndpointLoadsAndFiltersTheClasspathFixture() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/chart-area-interactive").param("range", "7d"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("2024-06-23")))
            .andExpect(content().string(containsString("2024-06-30")))
            .andExpect(content().string(not(containsString("2024-06-22"))));
    }
}
