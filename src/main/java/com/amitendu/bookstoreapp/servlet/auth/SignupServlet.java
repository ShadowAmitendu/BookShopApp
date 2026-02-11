package com.amitendu.bookstoreapp.servlet.auth;

import com.amitendu.bookstoreapp.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Controller for handling new user registration. Provides mock auto-login
 * functionality for Customers and Sellers.
 */
public class SignupServlet extends HttpServlet {

    /**
     * Renders the signup page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the signup JSP
        request.getRequestDispatcher("/jsp/common/signup.jsp").forward(request, response);
    }

    /**
     * Processes signup data and performs role-based auto-login.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role"); // Expected values: "CUSTOMER" or "SELLER"
        String password = request.getParameter("password"); // Not used in mock, but collected

        // --- MOCK VALIDATION ---
        if (name == null || email == null || role == null || name.isEmpty() || email.isEmpty()) {
            request.setAttribute("error", "Please fill in all required fields.");
            request.getRequestDispatcher("/jsp/common/signup.jsp").forward(request, response);
            return;
        }

        // --- MOCK REGISTRATION ---
        // In a real app, you would check if the email exists in Oracle first.
        User newUser = new User(email, name, role);

        // --- AUTO-LOGIN LOGIC ---
        HttpSession session = request.getSession();
        session.setAttribute("user", newUser);

        // --- ROLE-BASED REDIRECTION ---
        // Sellers go to their inventory; Customers go to the book catalog.
        if ("SELLER".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/seller/inventory");
        } else {
            response.sendRedirect(request.getContextPath() + "/books");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles user registration and role-based onboarding";
    }
}
