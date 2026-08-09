package com.basecoatui.jte.examples.admindashboard;

import com.basecoatui.jte.examples.admindashboard.services.ClasspathOutlineService;
import com.basecoatui.jte.examples.admindashboard.models.OutlineQuery;
import com.basecoatui.jte.examples.admindashboard.models.OutlineRow;
import com.basecoatui.jte.examples.admindashboard.models.OutlineSort;
import com.basecoatui.jte.examples.admindashboard.models.SortDirection;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import tools.jackson.databind.json.JsonMapper;

import java.util.Comparator;

import static org.assertj.core.api.Assertions.assertThat;

class ClasspathOutlineServiceTest {

    private ClasspathOutlineService service;

    @BeforeEach
    void setUp() {
        service = new ClasspathOutlineService(new JsonMapper());
    }

    @Test
    void loadsTheCompleteReactFixture() {
        final var page = service.findPage(OutlineQuery.from(null, 50, null, null));

        assertThat(page.totalElements()).isEqualTo(68);
        assertThat(page.totalPages()).isEqualTo(2);
        assertThat(page.rows()).hasSize(50);
        assertThat(page.rows().getFirst().header()).isEqualTo("Cover page");
        assertThat(page.rows()).extracting(OutlineRow::id).doesNotHaveDuplicates();
    }

    @Test
    void paginatesAndClampsRequestsPastTheLastPage() {
        final var page = service.findPage(OutlineQuery.from(99, 20, "id", "asc"));

        assertThat(page.page()).isEqualTo(3);
        assertThat(page.rows()).hasSize(8);
        assertThat(page.rows().getFirst().id()).isEqualTo(61);
        assertThat(page.rows().getLast().id()).isEqualTo(68);
    }

    @Test
    void sortsNumericFieldsNumerically() {
        final var page = service.findPage(OutlineQuery.from(0, 50, "target", "asc"));

        assertThat(page.rows())
            .extracting(row -> Integer.parseInt(row.target()))
            .isSortedAccordingTo(Comparator.naturalOrder());
    }

    @Test
    void sortsTextCaseInsensitivelyAndUsesIdAsStableTieBreaker() {
        final var page = service.findPage(OutlineQuery.from(0, 50, "status", "desc"));

        assertThat(page.rows())
            .extracting(row -> row.status().toLowerCase())
            .isSortedAccordingTo(Comparator.reverseOrder());
        assertThat(page.rows().stream().filter(row -> row.status().equals("In Process")).map(OutlineRow::id))
            .isSorted();
    }

    @Test
    void findsRowsById() {
        assertThat(service.findById(24)).get().extracting(OutlineRow::header).isEqualTo("API Documentation");
        assertThat(service.findById(999)).isEmpty();
    }

    @Test
    void normalizesUnsupportedQueryValues() {
        final var query = OutlineQuery.from(-2, 13, "missing", "sideways");

        assertThat(query.page()).isZero();
        assertThat(query.size()).isEqualTo(10);
        assertThat(query.sort()).isEqualTo(OutlineSort.ID);
        assertThat(query.direction()).isEqualTo(SortDirection.ASC);
    }
}
