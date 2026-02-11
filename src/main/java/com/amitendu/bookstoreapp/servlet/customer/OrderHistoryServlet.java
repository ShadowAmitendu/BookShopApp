package com.amitendu.bookstoreapp.servlet.customer;

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
 * Servlet for displaying customer order history.
 *
 * @author amite
 */
public class OrderHistoryServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get all orders for the customer
        List<Order> orders = orderDAO.getOrdersByCustomer(user.getId());

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/views/customer/orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("cancel".equals(action)) {
            try {
                int orderId = Integer.parseInt(request.getParameter("orderId"));

                // Cancel the order
                boolean success = orderDAO.cancelOrder(orderId);

                if (success) {
                    request.getSession().setAttribute("success", "Order cancelled successfully");
                } else {
                    request.getSession().setAttribute("error", "Failed to cancel order");
                }

            } catch (NumberFormatException e) {
                request.getSession().setAttribute("error", "Invalid order ID");
            }
        }

        response.sendRedirect(request.getContextPath() + "/orders");
    }
}

