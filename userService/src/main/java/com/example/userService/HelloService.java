package com.example.userService;

import org.springframework.web.bind.annotation.*;

@RestController
public class HelloService {
    @GetMapping("/hello")
    public String hello() {
        return "Hello, World! from user service";
    }
}
