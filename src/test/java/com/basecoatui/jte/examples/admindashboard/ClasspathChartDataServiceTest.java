package com.basecoatui.jte.examples.admindashboard;

import com.basecoatui.jte.examples.admindashboard.services.ClasspathChartDataService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import tools.jackson.databind.json.JsonMapper;

import static org.assertj.core.api.Assertions.assertThat;

class ClasspathChartDataServiceTest {

    private ClasspathChartDataService service;

    @BeforeEach
    void setUp() {
        service = new ClasspathChartDataService(new JsonMapper());
    }

    @Test
    void loadsTheCompleteChartFixture() {
        final var rows = service.findLastDays(90);

        assertThat(rows).hasSize(91);
        assertThat(rows.getFirst().date()).isEqualTo("2024-04-01");
        assertThat(rows.getLast().date()).isEqualTo("2024-06-30");
    }

    @Test
    void filtersRelativeToTheLatestFixtureDate() {
        final var rows = service.findLastDays(7);

        assertThat(rows).hasSize(8);
        assertThat(rows.getFirst().date()).isEqualTo("2024-06-23");
        assertThat(rows.getLast().date()).isEqualTo("2024-06-30");
    }
}
