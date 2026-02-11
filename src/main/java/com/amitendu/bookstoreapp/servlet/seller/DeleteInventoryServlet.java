package com.amitendu.bookstoreapp.servlet.seller;

import com.amitendu.bookstoreapp.dao.InventoryDAO;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for deleting inventory items.
 * Handles removal of items from seller's inventory.
 *
 * @author amite
 */
public class DeleteInventoryServlet extends HttpServlet {

    private InventoryDAO inventoryDAO;

    @Override
    public void init() {
        inventoryDAO = new InventoryDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"SELLER".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));

            // In production, verify that this item belongs to the seller
            // For now, assume it's valid

            // Note: InventoryDAO doesn't have delete method yet
            // boolean success = inventoryDAO.deleteInventoryItem(itemId);

            request.getSession().setAttribute("error", "Delete functionality not implemented yet");

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid item ID");
        }

        response.sendRedirect(request.getContextPath() + "/seller/inventory");
    }
}

