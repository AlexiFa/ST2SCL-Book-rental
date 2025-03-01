package com.example.booksCatalogue.web;

import com.example.booksCatalogue.data.Book;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;

import java.util.ArrayList;
import java.util.List;

@RestController
public class booksCatalogueService {
    List<Book> books = new ArrayList<>();
    Logger logger = LoggerFactory.getLogger(booksCatalogueService.class);

    public booksCatalogueService() {
        Book book = new Book("978-3-16-148410-0", "The Great Gatsby", "F. Scott Fitzgerald", 20);
        books.add(book);
        book = new Book("978-3-16-148410-1", "The Catcher in the Rye", "J.D. Salinger", 15);
        books.add(book);
        book = new Book("978-3-16-148410-2", "To Kill a Mockingbird", "Harper Lee", 18);
        books.add(book);
    }

    @GetMapping("/books")
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<Book> getBooks() {
        return books;
    }

    @GetMapping("/books/{ISBN}")
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public Book getBook(@PathVariable("ISBN") String ISBN) {
        for (Book book : books) {
            if (book.getISBN().equals(ISBN)) {
                return book;
            }
        }
        logger.error("No book found with ISBN: {}", ISBN);
        // TODO: throw custom exception
        return null;
    }
}
