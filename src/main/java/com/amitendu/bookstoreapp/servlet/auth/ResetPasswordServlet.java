package com.amitendu.bookstoreapp.servlet.auth;

import com.amitendu.bookstoreapp.dao.UserDAO;
import com.amitendu.bookstoreapp.util.PasswordUtil;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for handling password reset with token.
 *
 * @author amite
 */
public class ResetPasswordServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");

        // Validate token
        if (ValidationUtil.isEmpty(token)) {
            request.setAttribute("error", "Invalid or missing reset token.");
            response.sendRedirect(request.getContextPath() + "/forgot-password");
            return;
        }

        // In production: verify token exists and hasn't expired
        // For now, accept any token for development

        request.setAttribute("token", token);
        request.getRequestDispatcher("/WEB-INF/views/auth/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String token = request.getParameter("token");

        // Validate token
        if (ValidationUtil.isEmpty(token)) {
            request.setAttribute("error", "Invalid reset token.");
            response.sendRedirect(request.getContextPath() + "/forgot-password");
            return;
        }

        // Validate passwords
        if (ValidationUtil.isEmpty(newPassword) || ValidationUtil.isEmpty(confirmPassword)) {
            request.setAttribute("error", "Please fill in all fields.");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/auth/reset-password.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPassword(newPassword)) {
            request.setAttribute("error", "Password must be at least 8 characters with letters and numbers.");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/auth/reset-password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/auth/reset-password.jsp").forward(request, response);
            return;
        }

        // In production:
        // 1. Verify token is valid and not expired
        // 2. Get user ID from token
        // 3. Hash password
        // 4. Update database
        // 5. Invalidate token

        // Mock password update
        String salt = PasswordUtil.generateSalt();
        String hashedPassword = PasswordUtil.hashPassword(newPassword, salt);

        // userDAO.updatePasswordByToken(token, hashedPassword, salt);

        System.out.println("Password reset successful for token: " + token);
        System.out.println("New password hash: " + hashedPassword);

        // Redirect to login with success message
        request.getSession().setAttribute("success", "Password reset successful! Please login with your new password.");
        response.sendRedirect(request.getContextPath() + "/login");
    }
}

