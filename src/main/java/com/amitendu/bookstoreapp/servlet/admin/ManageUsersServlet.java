package com.amitendu.bookstoreapp.servlet.admin;

import com.amitendu.bookstoreapp.model.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Mock data for the table
        List<User> userList = new ArrayList<>();
        userList.add(new User("admin@bookshelf.com", "Amitendu", "ADMIN"));
        userList.add(new User("seller@test.com", "John's Bookstore", "SELLER"));
        userList.add(new User("customer@web.com", "Alice Reader", "CUSTOMER"));

        request.setAttribute("userList", userList);

        // ✅ Corrected: Passing both request and response
        request.getRequestDispatcher("/jsp/admin/manage-users.jsp").forward(request, response);
    }
}