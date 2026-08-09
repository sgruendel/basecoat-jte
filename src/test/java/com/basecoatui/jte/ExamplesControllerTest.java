package com.basecoatui.jte;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.test.web.servlet.MockMvc;
import tools.jackson.databind.ObjectMapper;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
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
            .andExpect(content().string(containsString("Cover page")))
            .andExpect(content().string(containsString("Page 1 of 7")))
            .andExpect(content().string(containsString("0 of 68 row(s) selected.")));
    }

    @Test
    void outlineEndpointRendersOnlyTheRequestedFragment() throws Exception {
        mockMvc.perform(get("/examples/admin-dashboard/outlines")
                .param("page", "1")
                .param("size", "20")
                .param("sort", "target")
                .param("direction", "desc"))
            .andExpect(status().isOk())
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
                .param("sort", "unknown")
                .param("direction", "unknown"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("Page 1 of 7")))
            .andExpect(content().string(containsString("data-page-size=\"10\"")));
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
