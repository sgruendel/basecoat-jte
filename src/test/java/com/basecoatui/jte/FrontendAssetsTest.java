package com.basecoatui.jte;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class FrontendAssetsTest {

    @Autowired
    private MockMvc mockMvc;

    @ParameterizedTest
    @ValueSource(strings = {"/", "/examples/admin-dashboard"})
    void directRequestsLoadCompiledAssets(String path) throws Exception {
        mockMvc.perform(get(path))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("href=\"/css/bundle.css\"")))
            .andExpect(content().string(containsString("type=\"module\" src=\"/js/bundle.js\"")))
            .andExpect(content().string(not(containsString("/@vite/client"))))
            .andExpect(content().string(not(containsString("src=\"/js/app.js\""))));
    }

    @ParameterizedTest
    @ValueSource(strings = {"/", "/examples/admin-dashboard"})
    void proxiedRequestsLoadViteClientAndSourceModules(String path) throws Exception {
        mockMvc.perform(get(path).header("X-Devserver", "1"))
            .andExpect(status().isOk())
            .andExpect(content().string(containsString("type=\"module\" src=\"/@vite/client\"")))
            .andExpect(content().string(containsString("type=\"module\" src=\"/js/app.js\"")))
            .andExpect(content().string(not(containsString("href=\"/css/bundle.css\""))))
            .andExpect(content().string(not(containsString("src=\"/js/bundle.js\""))));
    }
}
