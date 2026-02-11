package com.amitendu.bookstoreapp.servlet.customer;

import com.amitendu.bookstoreapp.dao.BookDAO;
import com.amitendu.bookstoreapp.model.Book;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BrowseBooksServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        BookDAO bookDAO = new BookDAO();
        List<Book> bookList = bookDAO.getAllBooks();
        
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/jsp/customer/books.jsp").forward(request, response); // ✅
    }
}