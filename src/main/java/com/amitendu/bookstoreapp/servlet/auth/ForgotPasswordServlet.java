package com.amitendu.bookstoreapp.servlet.auth;

import com.amitendu.bookstoreapp.dao.UserDAO;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

/**
 * Servlet for handling forgot password requests.
 *
 * @author amite
 */
public class ForgotPasswordServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/auth/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        // Validate email
        if (ValidationUtil.isEmpty(email)) {
            request.setAttribute("error", "Please provide your email address.");
            request.getRequestDispatcher("/WEB-INF/views/auth/forgot-password.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please provide a valid email address.");
            request.getRequestDispatcher("/WEB-INF/views/auth/forgot-password.jsp").forward(request, response);
            return;
        }

        // Check if email exists
        if (!userDAO.emailExists(email)) {
            // For security, don't reveal if email exists or not
            request.setAttribute("success", "If an account exists with this email, you will receive password reset instructions.");
            request.getRequestDispatcher("/WEB-INF/views/auth/forgot-password.jsp").forward(request, response);
            return;
        }

        // Generate reset token (in production, save this to database)
        String resetToken = UUID.randomUUID().toString();

        // In production:
        // 1. Save token to database with expiration (e.g., 1 hour)
        // 2. Send email with reset link
        // 3. userDAO.savePasswordResetToken(email, resetToken, expirationTime);

        System.out.println("Password reset requested for: " + email);
        System.out.println("Reset token (mock): " + resetToken);

        // For development, redirect with token
        // In production, show success message without revealing email existence
        request.setAttribute("success", "Password reset link sent! (Development: redirecting...)");

        // Auto-redirect after showing message (development only)
        response.setHeader("refresh", "2;url=" + request.getContextPath() + "/reset-password?token=" + resetToken);
        request.getRequestDispatcher("/WEB-INF/views/auth/forgot-password.jsp").forward(request, response);
    }
}

