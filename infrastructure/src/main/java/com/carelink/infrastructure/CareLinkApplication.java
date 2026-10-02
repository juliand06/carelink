package com.carelink.infrastructure;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.carelink")
public class CareLinkApplication {
    public static void main(String[] args) {
        SpringApplication.run(CareLinkApplication.class, args);
    }
}
