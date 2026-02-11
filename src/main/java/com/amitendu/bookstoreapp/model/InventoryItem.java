package com.amitendu.bookstoreapp.model;

import java.io.Serializable;

/**
 * Model class representing an inventory item in the bookstore.
 * Links books to sellers with stock quantities.
 *
 * @author amite
 */
public class InventoryItem implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private int bookId;
    private int sellerId;
    private int quantity;
    private double sellerPrice;
    private String status; // AVAILABLE, OUT_OF_STOCK, DISCONTINUED

    /**
     * Default constructor.
     */
    public InventoryItem() {
    }

    /**
     * Parameterized constructor.
     *
     * @param id          the inventory item ID
     * @param bookId      the book ID
     * @param sellerId    the seller ID
     * @param quantity    the stock quantity
     * @param sellerPrice the price set by seller
     * @param status      the inventory status
     */
    public InventoryItem(int id, int bookId, int sellerId, int quantity, double sellerPrice, String status) {
        this.id = id;
        this.bookId = bookId;
        this.sellerId = sellerId;
        this.quantity = quantity;
        this.sellerPrice = sellerPrice;
        this.status = status;
    }

    // Getters
    public int getId() {
        return id;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSellerPrice() {
        return sellerPrice;
    }

    public void setSellerPrice(double sellerPrice) {
        this.sellerPrice = sellerPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "InventoryItem{" +
                "id=" + id +
                ", bookId=" + bookId +
                ", sellerId=" + sellerId +
                ", quantity=" + quantity +
                ", sellerPrice=" + sellerPrice +
                ", status='" + status + '\'' +
                '}';
    }

}
