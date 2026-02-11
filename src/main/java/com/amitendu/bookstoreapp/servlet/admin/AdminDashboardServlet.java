package com.amitendu.bookstoreapp.servlet.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.amitendu.bookstoreapp.model.User;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. SECURITY CHECK
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. MOCK DATA
        request.setAttribute("revenue", "42,900");
        request.setAttribute("activeUsers", 1204);
        request.setAttribute("booksListed", 5672);
        request.setAttribute("pendingApprovals", 7);

        // 3. FORWARD TO JSP — both request AND response are required
        request.getRequestDispatcher("/jsp/admin/admin-dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}