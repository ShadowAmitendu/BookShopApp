package com.amitendu.bookstoreapp.servlet.auth;

import com.amitendu.bookstoreapp.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;

/**
 *
 * @author amite
 */
public class SignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/common/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role"); // "CUSTOMER" or "SELLER"

        // Since UserDAO is mock, we just create the user directly
        User newUser = new User(email, name, role);

        // Auto-login after signup
        HttpSession session = request.getSession();
        session.setAttribute("user", newUser);
        response.sendRedirect(request.getContextPath() + "/books");
    }

    @Override
    public String getServletInfo() {
        return "Handles user registration";
    }
}
