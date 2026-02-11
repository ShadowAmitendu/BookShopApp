package com.amitendu.bookstoreapp.servlet.customer;

import com.amitendu.bookstoreapp.dao.BookDAO;
import com.amitendu.bookstoreapp.dao.CartDAO;
import com.amitendu.bookstoreapp.model.CartItem;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet for managing shopping cart operations.
 *
 * @author amite
 */
public class CartServlet extends HttpServlet {

    private CartDAO cartDAO;
    private BookDAO bookDAO;

    @Override
    public void init() {
        cartDAO = new CartDAO();
        bookDAO = new BookDAO();
    }

    /**
     * Display cart contents.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get cart items for user
        List<CartItem> cartItems = cartDAO.getCartItems(user.getId());
        double cartTotal = cartDAO.getCartTotal(user.getId());
        int itemCount = cartDAO.getCartItemCount(user.getId());

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", cartTotal);
        request.setAttribute("itemCount", itemCount);

        request.getRequestDispatcher("/WEB-INF/views/customer/cart.jsp").forward(request, response);
    }

    /**
     * Handle cart operations (add, remove, update).
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if (action == null) {
            action = "view";
        }

        switch (action) {
            case "add":
                handleAddToCart(request, response, user);
                break;
            case "remove":
                handleRemoveFromCart(request, response, user);
                break;
            case "update":
                handleUpdateQuantity(request, response, user);
                break;
            case "clear":
                handleClearCart(request, response, user);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/cart");
                break;
        }
    }

    /**
     * Add item to cart.
     */
    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (quantity <= 0) {
                request.setAttribute("error", "Invalid quantity");
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            // Check if book exists
            var book = bookDAO.getBookById(bookId);
            if (book == null) {
                request.setAttribute("error", "Book not found");
                response.sendRedirect(request.getContextPath() + "/books");
                return;
            }

            // Create cart item
            CartItem cartItem = new CartItem();
            cartItem.setUserId(user.getId());
            cartItem.setBookId(bookId);
            cartItem.setQuantity(quantity);

            // Add to cart
            boolean success = cartDAO.addToCart(cartItem);

            if (success) {
                request.getSession().setAttribute("success", "Book added to cart!");
            } else {
                request.getSession().setAttribute("error", "Failed to add book to cart");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid input");
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    /**
     * Remove item from cart.
     */
    private void handleRemoveFromCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

            boolean success = cartDAO.removeFromCart(cartItemId);

            if (success) {
                request.getSession().setAttribute("success", "Item removed from cart");
            } else {
                request.getSession().setAttribute("error", "Failed to remove item");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid input");
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    /**
     * Update item quantity.
     */
    private void handleUpdateQuantity(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (quantity <= 0) {
                // If quantity is 0 or negative, remove item
                cartDAO.removeFromCart(cartItemId);
                request.getSession().setAttribute("success", "Item removed from cart");
            } else {
                boolean success = cartDAO.updateQuantity(cartItemId, quantity);

                if (success) {
                    request.getSession().setAttribute("success", "Quantity updated");
                } else {
                    request.getSession().setAttribute("error", "Failed to update quantity");
                }
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid input");
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    /**
     * Clear entire cart.
     */
    private void handleClearCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        boolean success = cartDAO.clearCart(user.getId());

        if (success) {
            request.getSession().setAttribute("success", "Cart cleared");
        } else {
            request.getSession().setAttribute("error", "Failed to clear cart");
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
