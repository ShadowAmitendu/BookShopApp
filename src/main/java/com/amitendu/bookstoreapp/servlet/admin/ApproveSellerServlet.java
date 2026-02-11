package com.amitendu.bookstoreapp.servlet.admin;

import com.amitendu.bookstoreapp.model.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ApproveSellerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Mock data for pending sellers
        List<User> pendingSellers = new ArrayList<>();
        // Note: I'm adding a "requestDate" string to match the JSP we built
        // In a real app, this would be a property of the User or a SellerRequest model
        request.setAttribute("pendingSellers", pendingSellers);
        request.setAttribute("pendingCount", pendingSellers.size());

        // ✅ Corrected: Passing both request and response
        request.getRequestDispatcher("/jsp/admin/approve-sellers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sellerId = request.getParameter("sellerId");
        String action = request.getParameter("action");

        // Logic to approve/reject would go here
        System.out.println("Admin Action: " + action + " on Seller ID: " + sellerId);

        // Redirect back to the list after action
        response.sendRedirect(request.getContextPath() + "/admin/approve-seller");
    }
}
