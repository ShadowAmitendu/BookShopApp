package com.amitendu.bookstoreapp.servlet.admin;

import com.amitendu.bookstoreapp.dao.OrderDAO;
import com.amitendu.bookstoreapp.dao.UserDAO;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet for admin dashboard.
 * Shows overview statistics and system information.
 *
 * @author amite
 */
public class AdminDashboardServlet extends HttpServlet {

    private UserDAO userDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Mock data for dashboard - in production, get from database
        request.setAttribute("revenue", "42,900");
        request.setAttribute("activeUsers", 1204);
        request.setAttribute("booksListed", 5672);
        request.setAttribute("pendingApprovals", 7);

        // Additional statistics
        request.setAttribute("totalOrders", orderDAO.getAllOrders().size());
        request.setAttribute("pendingOrders", orderDAO.getOrderCountByStatus("PENDING"));
        request.setAttribute("completedOrders", orderDAO.getOrderCountByStatus("DELIVERED"));

        request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

