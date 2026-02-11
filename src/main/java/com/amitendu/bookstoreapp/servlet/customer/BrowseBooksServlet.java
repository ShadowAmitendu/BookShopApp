package com.amitendu.bookstoreapp.servlet.customer;

import com.amitendu.bookstoreapp.dao.BookDAO;
import com.amitendu.bookstoreapp.model.Book;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Servlet for browsing books with search and filter capabilities.
 *
 * @author amite
 */
public class BrowseBooksServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchQuery = request.getParameter("search");
        String category = request.getParameter("category");

        List<Book> bookList = bookDAO.getAllBooks();

        // Apply search filter
        if (!ValidationUtil.isEmpty(searchQuery)) {
            final String query = searchQuery.toLowerCase();
            bookList = bookList.stream()
                    .filter(book -> book.getTitle().toLowerCase().contains(query) ||
                            book.getAuthor().toLowerCase().contains(query))
                    .collect(Collectors.toList());
        }

        // Apply category filter
        if (!ValidationUtil.isEmpty(category)) {
            bookList = bookList.stream()
                    .filter(book -> category.equalsIgnoreCase(book.getCategory()))
                    .collect(Collectors.toList());
        }

        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/WEB-INF/views/customer/books.jsp").forward(request, response);
    }
}

