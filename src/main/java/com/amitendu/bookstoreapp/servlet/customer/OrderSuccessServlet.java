package com.amitendu.bookstoreapp.servlet.customer;

import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet for displaying order success page.
 * Shows confirmation after successful order placement.
 *
 * @author amite
 */
public class OrderSuccessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get order ID from session if available
        String orderId = (String) request.getSession().getAttribute("orderId");
        if (orderId != null) {
            request.setAttribute("orderId", orderId);
            // Clear it from session after use
            request.getSession().removeAttribute("orderId");
        }

        request.getRequestDispatcher("/WEB-INF/views/customer/order-success.jsp").forward(request, response);
    }
}

