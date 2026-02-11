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
 * Controller for handling user authentication.
 *
 * @author amite
 */
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    /**
     * Renders the login page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is already logged in
        if (SessionUtil.isLoggedIn(request)) {
            User user = SessionUtil.getLoggedInUser(request);
            redirectToRoleDashboard(user, request, response);
            return;
        }
        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    /**
     * Processes login credentials and redirects based on user role.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (ValidationUtil.isEmpty(email) || ValidationUtil.isEmpty(password)) {
            request.setAttribute("error", "Email and password are required");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please provide a valid email address");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            return;
        }

        // Authenticate user
        User user = userDAO.authenticate(email, password);

        if (user != null) {
            // Success: Create session and store user object
            SessionUtil.setUser(request, user);

            // Log the login activity (optional)
            // activityLogDAO.logActivity(user.getId(), "LOGIN", "User logged in", SessionUtil.getClientIpAddress(request));

            // Role-Based Redirection
            redirectToRoleDashboard(user, request, response);
        } else {
            // Failure: Return to login with error feedback
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
    }

    /**
     * Redirects user to their role-specific dashboard.
     */
    private void redirectToRoleDashboard(User user, HttpServletRequest request,
                                         HttpServletResponse response) throws IOException {
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
    }
}
