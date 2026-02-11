package com.amitendu.bookstoreapp.servlet.seller;

import com.amitendu.bookstoreapp.dao.BookDAO;
import com.amitendu.bookstoreapp.dao.InventoryDAO;
import com.amitendu.bookstoreapp.model.Book;
import com.amitendu.bookstoreapp.model.InventoryItem;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet for managing seller inventory.
 *
 * @author amite
 */
public class SellerProfileServlet extends HttpServlet {

    private InventoryDAO inventoryDAO;
    private BookDAO bookDAO;

    @Override
    public void init() {
        inventoryDAO = new InventoryDAO();
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"SELLER".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get seller's inventory
        List<InventoryItem> inventory = inventoryDAO.getInventoryBySeller(user.getId());

        request.setAttribute("inventory", inventory);
        request.setAttribute("seller", user);
        request.getRequestDispatcher("/WEB-INF/views/seller/inventory.jsp").forward(request, response);
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

        if ("add".equals(action)) {
            handleAddInventory(request, response, user);
        } else if ("update".equals(action)) {
            handleUpdateInventory(request, response, user);
        } else if ("delete".equals(action)) {
            handleDeleteInventory(request, response, user);
        } else {
            doGet(request, response);
        }
    }

    private void handleAddInventory(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            // Validate input
            if (quantity <= 0 || price <= 0) {
                request.setAttribute("error", "Invalid quantity or price");
                doGet(request, response);
                return;
            }

            // Check if book exists
            Book book = bookDAO.getBookById(bookId);
            if (book == null) {
                request.setAttribute("error", "Book not found");
                doGet(request, response);
                return;
            }

            // Create inventory item
            InventoryItem item = new InventoryItem();
            item.setBookId(bookId);
            item.setSellerId(user.getId());
            item.setQuantity(quantity);
            item.setSellerPrice(price);
            item.setStatus("AVAILABLE");

            boolean success = inventoryDAO.addInventoryItem(item);

            if (success) {
                request.getSession().setAttribute("success", "Book added to inventory");
            } else {
                request.setAttribute("error", "Failed to add book to inventory");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format");
        }

        doGet(request, response);
    }

    private void handleUpdateInventory(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            if (quantity < 0 || price <= 0) {
                request.setAttribute("error", "Invalid quantity or price");
                doGet(request, response);
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
                request.setAttribute("error", "Failed to update inventory");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format");
        }

        doGet(request, response);
    }

    private void handleDeleteInventory(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int itemId = Integer.parseInt(request.getParameter("itemId"));

            // In production, check if item belongs to seller
            // For now, assume it's valid

            // Note: InventoryDAO doesn't have delete method, need to add it
            request.setAttribute("error", "Delete functionality not implemented yet");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid item ID");
        }

        doGet(request, response);
    }
}

