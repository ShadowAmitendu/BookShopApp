package com.amitendu.bookstoreapp.model;

import java.io.Serializable;

/**
 * Model class representing a user in the bookstore application.
 *
 * @author amite
 */
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String email;
    private String name;
    private String password;
    private String role; // CUSTOMER, SELLER, ADMIN
    private String phoneNumber;
    private String address;
    private boolean isEmailVerified;
    private boolean isApproved; // For sellers pending approval

    /**
     * Default constructor.
     */
    public User() {
    }

    /**
     * Constructor for basic user creation (backward compatible).
     *
     * @param email user's email
     * @param name  user's name
     * @param role  user's role
     */
    public User(String email, String name, String role) {
        this.email = email;
        this.name = name;
        this.role = role;
    }

    /**
     * Full constructor.
     *
     * @param id              user ID
     * @param email           user's email
     * @param name            user's name
     * @param password        user's password (should be hashed)
     * @param role            user's role
     * @param phoneNumber     user's phone number
     * @param address         user's address
     * @param isEmailVerified email verification status
     * @param isApproved      approval status (for sellers)
     */
    public User(int id, String email, String name, String password, String role,
                String phoneNumber, String address, boolean isEmailVerified, boolean isApproved) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.password = password;
        this.role = role;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.isEmailVerified = isEmailVerified;
        this.isApproved = isApproved;
    }

    // Getters
    public int getId() {
        return id;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isEmailVerified() {
        return isEmailVerified;
    }

    public void setEmailVerified(boolean emailVerified) {
        isEmailVerified = emailVerified;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", role='" + role + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", isEmailVerified=" + isEmailVerified +
                ", isApproved=" + isApproved +
                '}';
    }
}