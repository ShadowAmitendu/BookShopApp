package com.amitendu.bookstoreapp.dao;

import com.amitendu.bookstoreapp.model.Book;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        // Mock data for UI testing
        books.add(new Book(1, "Clean Code", "Robert C. Martin", 45.00, "Engineering", "https://covers.openlibrary.org/b/id/8231845-L.jpg"));
        books.add(new Book(2, "The Pragmatic Programmer", "Andrew Hunt", 50.00, "Engineering", "https://covers.openlibrary.org/b/id/10403331-L.jpg"));
        books.add(new Book(3, "Atomic Habits", "James Clear", 20.00, "Self-Help", "https://covers.openlibrary.org/b/id/12864311-L.jpg"));
        books.add(new Book(4, "Dune", "Frank Herbert", 15.00, "Fiction", "https://covers.openlibrary.org/b/id/10427301-L.jpg"));
        return books;
    }
}