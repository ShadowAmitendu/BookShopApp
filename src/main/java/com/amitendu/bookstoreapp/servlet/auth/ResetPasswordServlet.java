package com.amitendu.bookstoreapp.servlet.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Grab the token from the URL (e.g., ?token=mock_token_123)
        String token = request.getParameter("token");

        // MOCK VALIDATION: In a real app, you'd check if this token 
        // exists in Oracle and hasn't expired.
        if (token == null || token.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/forgot-password");
            return;
        }

        // Forward to the JSP form
        request.getRequestDispatcher("/jsp/auth/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String token = request.getParameter("token");

        // Basic validation
        if (newPassword != null && newPassword.equals(confirmPassword)) {
            // MOCK UPDATE: You'd run "UPDATE users SET password=? WHERE reset_token=?" here
            System.out.println("Success: Password updated for token " + token);
            
            // Redirect to login with a success parameter
            response.sendRedirect(request.getContextPath() + "/login?resetSuccess=true");
        } else {
            // If passwords don't match, reload the page with an error
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("/jsp/auth/reset-password.jsp").forward(request, response);
        }
    }
}