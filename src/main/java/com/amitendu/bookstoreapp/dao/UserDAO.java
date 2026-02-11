package com.amitendu.bookstoreapp.dao;

import com.amitendu.bookstoreapp.model.User;

public class UserDAO {
    
    public User authenticate(String email, String password) {
        // MOCK LOGIC: In the future, this will be: 
        // "SELECT * FROM users WHERE email=? AND password=?"
        
        if ("admin@bookshelf.com".equals(email) && "password123".equals(password)) {
            return new User(email, "Amitendu", "ADMIN");
        } else if ("user@test.com".equals(email) && "pass123".equals(password)) {
            return new User(email, "Test User", "CUSTOMER");
        }
        
        return null; // Login failed
    }
}