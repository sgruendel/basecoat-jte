package com.basecoatui.jte;

import com.basecoatui.jte.examples.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/examples")
public class ExamplesController {

    // TODO add proper class for data with toJson() method replacing JsonHelper
    private static final List<Map<String, Object>> chartData = List.of(
        Map.of("date", "2024-04-01", "desktop", 222, "mobile", 150),
        Map.of("date", "2024-04-02", "desktop", 97, "mobile", 180),
        Map.of("date", "2024-04-03", "desktop", 167, "mobile", 120),
        Map.of("date", "2024-04-04", "desktop", 242, "mobile", 260),
        Map.of("date", "2024-04-05", "desktop", 373, "mobile", 290),
        Map.of("date", "2024-04-06", "desktop", 301, "mobile", 340),
        Map.of("date", "2024-04-07", "desktop", 245, "mobile", 180),
        Map.of("date", "2024-04-08", "desktop", 409, "mobile", 320),
        Map.of("date", "2024-04-09", "desktop", 59, "mobile", 110),
        Map.of("date", "2024-04-10", "desktop", 261, "mobile", 190),
        Map.of("date", "2024-04-11", "desktop", 327, "mobile", 350),
        Map.of("date", "2024-04-12", "desktop", 292, "mobile", 210),
        Map.of("date", "2024-04-13", "desktop", 342, "mobile", 380),
        Map.of("date", "2024-04-14", "desktop", 137, "mobile", 220),
        Map.of("date", "2024-04-15", "desktop", 120, "mobile", 170),
        Map.of("date", "2024-04-16", "desktop", 138, "mobile", 190),
        Map.of("date", "2024-04-17", "desktop", 446, "mobile", 360),
        Map.of("date", "2024-04-18", "desktop", 364, "mobile", 410),
        Map.of("date", "2024-04-19", "desktop", 243, "mobile", 180),
        Map.of("date", "2024-04-20", "desktop", 89, "mobile", 150),
        Map.of("date", "2024-04-21", "desktop", 137, "mobile", 200),
        Map.of("date", "2024-04-22", "desktop", 224, "mobile", 170),
        Map.of("date", "2024-04-23", "desktop", 138, "mobile", 230),
        Map.of("date", "2024-04-24", "desktop", 387, "mobile", 290),
        Map.of("date", "2024-04-25", "desktop", 215, "mobile", 250),
        Map.of("date", "2024-04-26", "desktop", 75, "mobile", 130),
        Map.of("date", "2024-04-27", "desktop", 383, "mobile", 420),
        Map.of("date", "2024-04-28", "desktop", 122, "mobile", 180),
        Map.of("date", "2024-04-29", "desktop", 315, "mobile", 240),
        Map.of("date", "2024-04-30", "desktop", 454, "mobile", 380),
        Map.of("date", "2024-05-01", "desktop", 165, "mobile", 220),
        Map.of("date", "2024-05-02", "desktop", 293, "mobile", 310),
        Map.of("date", "2024-05-03", "desktop", 247, "mobile", 190),
        Map.of("date", "2024-05-04", "desktop", 385, "mobile", 420),
        Map.of("date", "2024-05-05", "desktop", 481, "mobile", 390),
        Map.of("date", "2024-05-06", "desktop", 498, "mobile", 520),
        Map.of("date", "2024-05-07", "desktop", 388, "mobile", 300),
        Map.of("date", "2024-05-08", "desktop", 149, "mobile", 210),
        Map.of("date", "2024-05-09", "desktop", 227, "mobile", 180),
        Map.of("date", "2024-05-10", "desktop", 293, "mobile", 330),
        Map.of("date", "2024-05-11", "desktop", 335, "mobile", 270),
        Map.of("date", "2024-05-12", "desktop", 197, "mobile", 240),
        Map.of("date", "2024-05-13", "desktop", 197, "mobile", 160),
        Map.of("date", "2024-05-14", "desktop", 448, "mobile", 490),
        Map.of("date", "2024-05-15", "desktop", 473, "mobile", 380),
        Map.of("date", "2024-05-16", "desktop", 338, "mobile", 400),
        Map.of("date", "2024-05-17", "desktop", 499, "mobile", 420),
        Map.of("date", "2024-05-18", "desktop", 315, "mobile", 350),
        Map.of("date", "2024-05-19", "desktop", 235, "mobile", 180),
        Map.of("date", "2024-05-20", "desktop", 177, "mobile", 230),
        Map.of("date", "2024-05-21", "desktop", 82, "mobile", 140),
        Map.of("date", "2024-05-22", "desktop", 81, "mobile", 120),
        Map.of("date", "2024-05-23", "desktop", 252, "mobile", 290),
        Map.of("date", "2024-05-24", "desktop", 294, "mobile", 220),
        Map.of("date", "2024-05-25", "desktop", 201, "mobile", 250),
        Map.of("date", "2024-05-26", "desktop", 213, "mobile", 170),
        Map.of("date", "2024-05-27", "desktop", 420, "mobile", 460),
        Map.of("date", "2024-05-28", "desktop", 233, "mobile", 190),
        Map.of("date", "2024-05-29", "desktop", 78, "mobile", 130),
        Map.of("date", "2024-05-30", "desktop", 340, "mobile", 280),
        Map.of("date", "2024-05-31", "desktop", 178, "mobile", 230),
        Map.of("date", "2024-06-01", "desktop", 178, "mobile", 200),
        Map.of("date", "2024-06-02", "desktop", 470, "mobile", 410),
        Map.of("date", "2024-06-03", "desktop", 103, "mobile", 160),
        Map.of("date", "2024-06-04", "desktop", 439, "mobile", 380),
        Map.of("date", "2024-06-05", "desktop", 88, "mobile", 140),
        Map.of("date", "2024-06-06", "desktop", 294, "mobile", 250),
        Map.of("date", "2024-06-07", "desktop", 323, "mobile", 370),
        Map.of("date", "2024-06-08", "desktop", 385, "mobile", 320),
        Map.of("date", "2024-06-09", "desktop", 438, "mobile", 480),
        Map.of("date", "2024-06-10", "desktop", 155, "mobile", 200),
        Map.of("date", "2024-06-11", "desktop", 92, "mobile", 150),
        Map.of("date", "2024-06-12", "desktop", 492, "mobile", 420),
        Map.of("date", "2024-06-13", "desktop", 81, "mobile", 130),
        Map.of("date", "2024-06-14", "desktop", 426, "mobile", 380),
        Map.of("date", "2024-06-15", "desktop", 307, "mobile", 350),
        Map.of("date", "2024-06-16", "desktop", 371, "mobile", 310),
        Map.of("date", "2024-06-17", "desktop", 475, "mobile", 520),
        Map.of("date", "2024-06-18", "desktop", 107, "mobile", 170),
        Map.of("date", "2024-06-19", "desktop", 341, "mobile", 290),
        Map.of("date", "2024-06-20", "desktop", 408, "mobile", 450),
        Map.of("date", "2024-06-21", "desktop", 169, "mobile", 210),
        Map.of("date", "2024-06-22", "desktop", 317, "mobile", 270),
        Map.of("date", "2024-06-23", "desktop", 480, "mobile", 530),
        Map.of("date", "2024-06-24", "desktop", 132, "mobile", 180),
        Map.of("date", "2024-06-25", "desktop", 141, "mobile", 190),
        Map.of("date", "2024-06-26", "desktop", 434, "mobile", 380),
        Map.of("date", "2024-06-27", "desktop", 448, "mobile", 490),
        Map.of("date", "2024-06-28", "desktop", 149, "mobile", 200),
        Map.of("date", "2024-06-29", "desktop", 103, "mobile", 160),
        Map.of("date", "2024-06-30", "desktop", 446, "mobile", 400)
    );

    @GetMapping("/admin-dashboard")
    public String examples(final Model model) {

        final var user = new User("shadcn", "m@example.com", "https://github.com/shadcn.png");
        model.addAttribute("user", user);
        model.addAttribute("chartData", "TODO: data.json");
        return "examples/adminDashboard/index";
    }

    @GetMapping("/admin-dashboard/chart-area-interactive")
    public String chartAreaInteractive(@RequestParam(defaultValue = "90d") final String range, final Model model) {

        // TODO derive default value from enum
        // TODO add Java enum for this, inject values as model attribute, and use that in the template to generate the buttons
        final int days = switch (range) {
            case "7d" -> 7;
            case "30d" -> 30;
            default -> 90;
        };
        final LocalDate start = LocalDate.parse("2024-06-30").minusDays(days);
        model.addAttribute("data", chartData.stream()
            .filter(row -> !LocalDate.parse((String) row.get("date")).isBefore(start))
            .toList());
        model.addAttribute("range", range);
        return "examples/adminDashboard/components/chartAreaInteractive";
    }

}
