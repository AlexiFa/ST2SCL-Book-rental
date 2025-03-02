package com.example.userService;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
public class HelloService {

    @Value("${booksServiceUrl}")
    String booksServiceUrl;

    @RequestMapping(path = "/hello", method = RequestMethod.GET)
    public String hello() {
        try {
            RestTemplate restTemplate = new RestTemplate();
            String messageFromBooksService = restTemplate.getForObject(booksServiceUrl + "/hello", String.class);
            return "Hello, World! from user service and this is the message from the book service : " + messageFromBooksService;
        } catch (Exception e) {
            return e.getLocalizedMessage();
        }
    }
}
