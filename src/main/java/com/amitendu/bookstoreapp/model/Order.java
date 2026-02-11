package com.amitendu.bookstoreapp.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Model class representing a customer order.
 *
 * @author amite
 */
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private int customerId;
    private LocalDateTime orderDate;
    private double totalAmount;
    private String status; // PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED
    private String shippingAddress;
    private String paymentMethod;
    private List<OrderItem> orderItems;

    /**
     * Default constructor.
     */
    public Order() {
    }

    /**
     * Parameterized constructor.
     *
     * @param id              the order ID
     * @param customerId      the customer ID
     * @param orderDate       the date of order
     * @param totalAmount     the total order amount
     * @param status          the order status
     * @param shippingAddress the shipping address
     * @param paymentMethod   the payment method
     */
    public Order(int id, int customerId, LocalDateTime orderDate, double totalAmount,
                 String status, String shippingAddress, String paymentMethod) {
        this.id = id;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.shippingAddress = shippingAddress;
        this.paymentMethod = paymentMethod;
    }

    // Getters
    public int getId() {
        return id;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", customerId=" + customerId +
                ", orderDate=" + orderDate +
                ", totalAmount=" + totalAmount +
                ", status='" + status + '\'' +
                ", shippingAddress='" + shippingAddress + '\'' +
                ", paymentMethod='" + paymentMethod + '\'' +
                '}';
    }

    /**
     * Inner class representing an item within an order.
     */
    public static class OrderItem implements Serializable {
        private static final long serialVersionUID = 1L;

        private int id;
        private int orderId;
        private int bookId;
        private int quantity;
        private double unitPrice;

        public OrderItem() {
        }

        public OrderItem(int id, int orderId, int bookId, int quantity, double unitPrice) {
            this.id = id;
            this.orderId = orderId;
            this.bookId = bookId;
            this.quantity = quantity;
            this.unitPrice = unitPrice;
        }

        // Getters
        public int getId() {
            return id;
        }

        // Setters
        public void setId(int id) {
            this.id = id;
        }

        public int getOrderId() {
            return orderId;
        }

        public void setOrderId(int orderId) {
            this.orderId = orderId;
        }

        public int getBookId() {
            return bookId;
        }

        public void setBookId(int bookId) {
            this.bookId = bookId;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }

        public double getUnitPrice() {
            return unitPrice;
        }

        public void setUnitPrice(double unitPrice) {
            this.unitPrice = unitPrice;
        }

        public double getSubtotal() {
            return quantity * unitPrice;
        }
    }
}
