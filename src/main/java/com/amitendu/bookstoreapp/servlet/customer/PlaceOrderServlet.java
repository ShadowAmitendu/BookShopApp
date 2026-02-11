package com.amitendu.bookstoreapp.servlet.customer;

import com.amitendu.bookstoreapp.dao.CartDAO;
import com.amitendu.bookstoreapp.dao.OrderDAO;
import com.amitendu.bookstoreapp.model.CartItem;
import com.amitendu.bookstoreapp.model.Order;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Servlet for placing orders from shopping cart.
 *
 * @author amite
 */
public class PlaceOrderServlet extends HttpServlet {

    private OrderDAO orderDAO;
    private CartDAO cartDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
        cartDAO = new CartDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get cart items for checkout
        List<CartItem> cartItems = cartDAO.getCartItems(user.getId());

        if (cartItems == null || cartItems.isEmpty()) {
            request.getSession().setAttribute("error", "Your cart is empty");
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        double cartTotal = cartDAO.getCartTotal(user.getId());

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", cartTotal);
        request.getRequestDispatcher("/WEB-INF/views/customer/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get form data
        String shippingAddress = request.getParameter("shippingAddress");
        String paymentMethod = request.getParameter("paymentMethod");

        // Validate input
        if (ValidationUtil.isEmpty(shippingAddress)) {
            request.setAttribute("error", "Please provide a shipping address");
            doGet(request, response);
            return;
        }

        if (ValidationUtil.isEmpty(paymentMethod)) {
            request.setAttribute("error", "Please select a payment method");
            doGet(request, response);
            return;
        }

        // Get cart items
        List<CartItem> cartItems = cartDAO.getCartItems(user.getId());

        if (cartItems == null || cartItems.isEmpty()) {
            request.getSession().setAttribute("error", "Your cart is empty");
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        // Calculate total
        double totalAmount = cartDAO.getCartTotal(user.getId());

        // Create order
        Order order = new Order();
        order.setCustomerId(user.getId());
        order.setOrderDate(LocalDateTime.now());
        order.setTotalAmount(totalAmount);
        order.setStatus("PENDING");
        order.setShippingAddress(shippingAddress);
        order.setPaymentMethod(paymentMethod);

        // Place order
        int orderId = orderDAO.createOrder(order);

        if (orderId > 0) {
            // Order created successfully
            // TODO: Add order items from cart
            // TODO: Clear cart after successful order

            // Clear cart
            cartDAO.clearCart(user.getId());

            request.getSession().setAttribute("success", "Order placed successfully!");
            request.getSession().setAttribute("orderId", orderId);
            response.sendRedirect(request.getContextPath() + "/order-success");
        } else {
            request.setAttribute("error", "Failed to place order. Please try again.");
            doGet(request, response);
        }
    }
}

