package com.amitendu.bookstoreapp.servlet.common;

import com.amitendu.bookstoreapp.model.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String query = request.getParameter("query");
        
        // 1. Create Mock Master List (This would usually come from Oracle)
        List<Book> allBooks = new ArrayList<>();
        allBooks.add(new Book(1, "The Great Gatsby", "F. Scott Fitzgerald", 15.99, "Fiction", "https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200"));
        allBooks.add(new Book(2, "Clean Code", "Robert C. Martin", 45.00, "Tech", "https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&q=80&w=200"));
        allBooks.add(new Book(3, "Dune", "Frank Herbert", 22.50, "Sci-Fi", "https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=200"));

        // 2. Perform Filter Logic
        List<Book> filteredBooks;
        if (query == null || query.trim().isEmpty()) {
            filteredBooks = allBooks;
        } else {
            String lowerQuery = query.toLowerCase();
            filteredBooks = allBooks.stream()
                .filter(b -> b.getTitle().toLowerCase().contains(lowerQuery) || 
                             b.getAuthor().toLowerCase().contains(lowerQuery))
                .collect(Collectors.toList());
        }

        // 3. Send back to the Catalog page
        request.setAttribute("bookList", filteredBooks);
        request.setAttribute("searchQuery", query);
        request.getRequestDispatcher("/jsp/customer/books.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect POST search requests to GET for bookmarking capability
        doGet(request, response);
    }
}