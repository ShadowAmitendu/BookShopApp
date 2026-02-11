package com.amitendu.bookstoreapp.servlet.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show the initial "Forgot Password" form
        request.getRequestDispatcher("/jsp/auth/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");

        // MOCK LOGIC: In a real app, you would:
        // 1. Check if the email exists in Oracle.
        // 2. Generate a secure token.
        // 3. Send an actual email.
        
        System.out.println("Password reset requested for: " + email);

        // SIMPLE REDIRECT (Option 2): 
        // We simulate the user clicking a link in their email by sending them 
        // directly to the reset-password page with a dummy token.
        response.sendRedirect(request.getContextPath() + "/reset-password?token=mock_token_123");
    }
}