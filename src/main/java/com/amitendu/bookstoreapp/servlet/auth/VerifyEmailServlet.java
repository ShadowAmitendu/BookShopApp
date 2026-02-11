package com.amitendu.bookstoreapp.servlet.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Controller for email verification.
 * In this mock version, it resets the session and redirects to login.
 */
@WebServlet("/verify-email")
public class VerifyEmailServlet extends HttpServlet {

    /**
     * Handles the verification link click (usually via GET from an email).
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Reset the session to ensure the user starts fresh after "verifying"
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 2. Redirect to login with a success parameter to show a nice message
        response.sendRedirect(request.getContextPath() + "/login?verified=true");
    }

    /**
     * Handles the "Resend Link" button from the verify-email.jsp.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Mock logic: Just show the verification page again with a success message
        request.setAttribute("message", "A new verification link has been sent to your inbox!");
        request.getRequestDispatcher("/jsp/auth/verify-email.jsp").forward(request, response);
    }
}