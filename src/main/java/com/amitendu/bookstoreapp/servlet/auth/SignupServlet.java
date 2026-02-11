package com.amitendu.bookstoreapp.servlet.auth;

import com.amitendu.bookstoreapp.dao.UserDAO;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Controller for handling new user registration.
 *
 * @author amite
 */
public class SignupServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    /**
     * Renders the signup page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is already logged in
        if (SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
    }

    /**
     * Processes signup data and creates new user account.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate input
        if (ValidationUtil.isEmpty(name) || ValidationUtil.isEmpty(email) ||
                ValidationUtil.isEmpty(role) || ValidationUtil.isEmpty(password)) {
            request.setAttribute("error", "Please fill in all required fields.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please provide a valid email address.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPassword(password)) {
            request.setAttribute("error", "Password must be at least 8 characters with letters and numbers.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isEmpty(phone) && !ValidationUtil.isValidPhone(phone)) {
            request.setAttribute("error", "Please provide a valid 10-digit phone number.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        // Check if email already exists (mock - will be implemented with database)
        if (userDAO.emailExists(email)) {
            request.setAttribute("error", "An account with this email already exists.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        // Create new user (mock registration - will be implemented with database)
        User newUser = new User(email, name, role);
        // In production: hash password, save to database, send verification email

        // Auto-login the new user
        SessionUtil.setUser(request, newUser);

        // Set success message
        request.getSession().setAttribute("success", "Account created successfully! Welcome to BookShelf.");

        // Redirect based on role
        switch (role) {
            case "SELLER":
                response.sendRedirect(request.getContextPath() + "/seller/inventory");
                break;
            case "CUSTOMER":
            default:
                response.sendRedirect(request.getContextPath() + "/books");
                break;
        }
    }
}

