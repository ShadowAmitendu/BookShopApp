package com.amitendu.bookstoreapp.servlet.seller;

import com.amitendu.bookstoreapp.dao.OrderDAO;
import com.amitendu.bookstoreapp.model.Order;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet for managing seller orders.
 * Sellers can view and manage orders for their inventory items.
 *
 * @author amite
 */
public class SellerOrdersServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"SELLER".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get all orders for this seller's inventory
        List<Order> sellerOrders = orderDAO.getOrdersBySeller(user.getId());

        // Calculate seller statistics
        double totalRevenue = orderDAO.getTotalRevenue(user.getId());
        int totalOrders = sellerOrders.size();
        int pendingOrders = orderDAO.getOrderCountByStatus("PENDING");
        int shippedOrders = orderDAO.getOrderCountByStatus("SHIPPED");

        request.setAttribute("sellerOrders", sellerOrders);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("pendingOrders", pendingOrders);
        request.setAttribute("shippedOrders", shippedOrders);

        request.getRequestDispatcher("/WEB-INF/views/seller/orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"SELLER".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("updateStatus".equals(action)) {
            handleUpdateOrderStatus(request, response, user);
        } else {
            doGet(request, response);
        }
    }

    private void handleUpdateOrderStatus(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String newStatus = request.getParameter("status");

            // Validate status
            if (!isValidOrderStatus(newStatus)) {
                request.getSession().setAttribute("error", "Invalid order status");
                response.sendRedirect(request.getContextPath() + "/seller/orders");
                return;
            }

            // In production, verify that this order contains items from this seller
            // For now, assume it's valid

            boolean success = orderDAO.updateOrderStatus(orderId, newStatus);

            if (success) {
                request.getSession().setAttribute("success",
                        "Order status updated to " + newStatus.toLowerCase());
            } else {
                request.getSession().setAttribute("error", "Failed to update order status");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid order ID");
        }

        response.sendRedirect(request.getContextPath() + "/seller/orders");
    }

    private boolean isValidOrderStatus(String status) {
        return status != null && (
                "PENDING".equals(status) ||
                        "CONFIRMED".equals(status) ||
                        "SHIPPED".equals(status) ||
                        "DELIVERED".equals(status) ||
                        "CANCELLED".equals(status)
        );
    }
}

