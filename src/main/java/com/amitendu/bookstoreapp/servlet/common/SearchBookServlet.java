package com.amitendu.bookstoreapp.servlet.common;

import com.amitendu.bookstoreapp.dao.BookDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for searching books.
 * This servlet redirects to BrowseBooksServlet with search parameters.
 *
 * @author amite
 */
public class SearchBookServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");

        if (query == null || query.trim().isEmpty()) {
            // Redirect to browse all books
            response.sendRedirect(request.getContextPath() + "/books");
            return;
        }

        // Redirect to browse books with search parameter
        response.sendRedirect(request.getContextPath() + "/books?search=" + java.net.URLEncoder.encode(query, "UTF-8"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

