package com.amitendu.bookstoreapp.servlet.auth;

import com.amitendu.bookstoreapp.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Controller for handling user authentication. Uses hardcoded mock data for
 * Admin, Seller, and Customer roles.
 */
public class LoginServlet extends HttpServlet {

    /**
     * Renders the login page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Corrected path to match your project structure: webapp/jsp/common/login.jsp
        request.getRequestDispatcher("/jsp/common/login.jsp").forward(request, response);
    }

    /**
     * Processes login credentials and redirects based on user role.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Initialize user as null
        User user = null;

        // --- HARDCODED MOCK DATA ---
        // Admin Account
        if ("admin@bookshelf.com".equals(email) && "admin123".equals(password)) {
            user = new User(email, "Amitendu (Admin)", "ADMIN");
        } // Seller Account
        else if ("seller@bookshelf.com".equals(email) && "seller123".equals(password)) {
            user = new User(email, "Bibliophile Books", "SELLER");
        } // Customer Account
        else if ("customer@bookshelf.com".equals(email) && "customer123".equals(password)) {
            user = new User(email, "Alice Reader", "CUSTOMER");
        }

        // --- AUTHENTICATION LOGIC ---
        if (user != null) {
            // Success: Create session and store user object
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Role-Based Redirection
            String role = user.getRole();
            switch (role) {
                case "ADMIN":
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                    break;
                case "SELLER":
                    response.sendRedirect(request.getContextPath() + "/seller/inventory");
                    break;
                case "CUSTOMER":
                default:
                    response.sendRedirect(request.getContextPath() + "/books");
                    break;
            }
        } else {
            // Failure: Return to login with error feedback
            request.setAttribute("error", "Invalid credentials. Try: admin@bookshelf.com / admin123");
            request.getRequestDispatcher("/jsp/common/login.jsp").forward(request, response);
        }
    }
}
