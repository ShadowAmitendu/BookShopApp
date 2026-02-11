package com.amitendu.bookstoreapp.servlet.seller;

import com.amitendu.bookstoreapp.dao.InventoryDAO;
import com.amitendu.bookstoreapp.model.InventoryItem;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for updating inventory items.
 * Handles individual inventory item updates.
 *
 * @author amite
 */
public class UpdateInventoryServlet extends HttpServlet {

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
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            if (quantity < 0 || price <= 0) {
                request.getSession().setAttribute("error", "Invalid quantity or price");
                response.sendRedirect(request.getContextPath() + "/seller/inventory");
                return;
            }

            InventoryItem item = new InventoryItem();
            item.setId(itemId);
            item.setQuantity(quantity);
            item.setSellerPrice(price);

            boolean success = inventoryDAO.updateInventoryItem(item);

            if (success) {
                request.getSession().setAttribute("success", "Inventory updated successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to update inventory");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid input format");
        }

        response.sendRedirect(request.getContextPath() + "/seller/inventory");
    }
}

