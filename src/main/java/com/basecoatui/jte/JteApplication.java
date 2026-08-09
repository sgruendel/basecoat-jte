package com.basecoatui.jte;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.web.config.EnableSpringDataWebSupport;


@SpringBootApplication
@EnableSpringDataWebSupport
public class JteApplication {

	static void main(String[] args) {
		SpringApplication.run(JteApplication.class, args);
	}

}
