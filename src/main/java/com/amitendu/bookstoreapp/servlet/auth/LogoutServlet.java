package com.amitendu.bookstoreapp.servlet.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Get the current session (do not create a new one if it doesn't exist)
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // 2. Clear all session data (logout the user)
            session.invalidate();
        }

        // 3. Redirect to the login page with a logged-out message
        response.sendRedirect(request.getContextPath() + "/login?status=logged_out");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Logouts can safely be handled by doGet, but we'll route POST here too for consistency
        doGet(request, response);
    }
}