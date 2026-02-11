package com.amitendu.bookstoreapp.servlet.auth;

import com.amitendu.bookstoreapp.dao.UserDAO;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for email verification.
 *
 * @author amite
 */
public class VerifyEmailServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    /**
     * Handles email verification link clicks (GET from email).
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");

        // Validate token
        if (ValidationUtil.isEmpty(token)) {
            request.setAttribute("error", "Invalid verification link.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // In production:
        // 1. Verify token exists in database
        // 2. Check if not expired
        // 3. Get user ID from token
        // 4. Update user's email_verified status
        // 5. Invalidate token

        // Mock verification
        // boolean verified = userDAO.verifyEmail(userId, token);
        boolean verified = true; // Mock success

        if (verified) {
            request.getSession().setAttribute("success", "Email verified successfully! You can now login.");
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("error", "Invalid or expired verification link.");
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    /**
     * Handles resend verification email requests.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        // Validate email
        if (ValidationUtil.isEmpty(email) || !ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please provide a valid email address.");
            request.getRequestDispatcher("/WEB-INF/views/auth/verify-email.jsp").forward(request, response);
            return;
        }

        // In production:
        // 1. Check if email exists
        // 2. Generate new verification token
        // 3. Send verification email

        System.out.println("Resending verification email to: " + email);

        request.setAttribute("success", "Verification email has been resent! Please check your inbox.");
        request.getRequestDispatcher("/WEB-INF/views/auth/verify-email.jsp").forward(request, response);
    }
}

