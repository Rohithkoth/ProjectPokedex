package com.pokedex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// =============================================================
//  Application.java  — Entry point
// =============================================================
//
//  WHAT THIS FILE IS:
//  The main class that boots the entire Spring application.
//  You don't need to change anything here.
//
//  WHAT @SpringBootApplication DOES:
//  It's a shortcut for three annotations combined:
//    @Configuration       — this class can define Spring beans
//    @EnableAutoConfiguration — Spring auto-configures things like
//                               the database connection based on
//                               what's in application.properties
//    @ComponentScan       — Spring scans this package and all
//                           sub-packages for @Service, @Repository,
//                           @RestController etc. and wires them up
// =============================================================

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
