package com.amitendu.bookstoreapp.model;

import java.io.Serializable;

/**
 * Model class representing a shopping cart item.
 *
 * @author amite
 */
public class CartItem implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private int userId;
    private int bookId;
    private String bookTitle;
    private String bookAuthor;
    private String bookImageUrl;
    private double bookPrice;
    private int quantity;

    /**
     * Default constructor.
     */
    public CartItem() {
    }

    /**
     * Parameterized constructor.
     */
    public CartItem(int id, int userId, int bookId, String bookTitle, String bookAuthor,
                    String bookImageUrl, double bookPrice, int quantity) {
        this.id = id;
        this.userId = userId;
        this.bookId = bookId;
        this.bookTitle = bookTitle;
        this.bookAuthor = bookAuthor;
        this.bookImageUrl = bookImageUrl;
        this.bookPrice = bookPrice;
        this.quantity = quantity;
    }

    // Getters
    public int getId() {
        return id;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookImageUrl() {
        return bookImageUrl;
    }

    public void setBookImageUrl(String bookImageUrl) {
        this.bookImageUrl = bookImageUrl;
    }

    public double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * Calculates the subtotal for this cart item.
     *
     * @return subtotal (price * quantity)
     */
    public double getSubtotal() {
        return bookPrice * quantity;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "id=" + id +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", bookTitle='" + bookTitle + '\'' +
                ", quantity=" + quantity +
                ", subtotal=" + getSubtotal() +
                '}';
    }
}

