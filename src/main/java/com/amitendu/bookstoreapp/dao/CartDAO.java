package com.amitendu.bookstoreapp.dao;

import com.amitendu.bookstoreapp.model.CartItem;

import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for shopping cart operations.
 *
 * @author amite
 */
public class CartDAO {

    /**
     * Adds an item to the cart.
     * If the item already exists, updates the quantity.
     *
     * @param cartItem the cart item to add
     * @return true if successful, false otherwise
     */
    public boolean addToCart(CartItem cartItem) {
        // TODO: Implement actual database insert/update
        return false;
    }

    /**
     * Retrieves all cart items for a user.
     *
     * @param userId the user ID
     * @return List of cart items
     */
    public List<CartItem> getCartItems(int userId) {
        List<CartItem> items = new ArrayList<>();
        // TODO: Implement actual database query
        return items;
    }

    /**
     * Updates the quantity of a cart item.
     *
     * @param cartItemId the cart item ID
     * @param quantity   the new quantity
     * @return true if successful, false otherwise
     */
    public boolean updateQuantity(int cartItemId, int quantity) {
        // TODO: Implement actual database update
        return false;
    }

    /**
     * Removes an item from the cart.
     *
     * @param cartItemId the cart item ID
     * @return true if successful, false otherwise
     */
    public boolean removeFromCart(int cartItemId) {
        // TODO: Implement actual database delete
        return false;
    }

    /**
     * Clears all items from a user's cart.
     *
     * @param userId the user ID
     * @return true if successful, false otherwise
     */
    public boolean clearCart(int userId) {
        // TODO: Implement actual database delete
        return false;
    }

    /**
     * Gets the total number of items in a user's cart.
     *
     * @param userId the user ID
     * @return total item count
     */
    public int getCartItemCount(int userId) {
        // TODO: Implement actual database query
        return 0;
    }

    /**
     * Calculates the total price of all items in the cart.
     *
     * @param userId the user ID
     * @return total cart value
     */
    public double getCartTotal(int userId) {
        // TODO: Implement actual database query
        List<CartItem> items = getCartItems(userId);
        return items.stream()
                .mapToDouble(CartItem::getSubtotal)
                .sum();
    }

    /**
     * Checks if a book is already in the user's cart.
     *
     * @param userId the user ID
     * @param bookId the book ID
     * @return true if book is in cart, false otherwise
     */
    public boolean isBookInCart(int userId, int bookId) {
        // TODO: Implement actual database query
        return false;
    }
}

