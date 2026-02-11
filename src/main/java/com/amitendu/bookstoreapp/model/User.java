package com.amitendu.bookstoreapp.model;

public class User {
    private String email;
    private String name;
    private String role; // CUSTOMER, SELLER, ADMIN

    public User(String email, String name, String role) {
        this.email = email;
        this.name = name;
        this.role = role;
    }

    // Getters
    public String getEmail() { return email; }
    public String getName() { return name; }
    public String getRole() { return role; }
}