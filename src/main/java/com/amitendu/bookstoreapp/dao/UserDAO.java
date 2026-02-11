package com.amitendu.bookstoreapp.dao;

import com.amitendu.bookstoreapp.model.User;

import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for User operations.
 * Handles user authentication, registration, and management.
 *
 * @author amite
 */
public class UserDAO {
    private static final List<User> MOCK_USERS = new ArrayList<>();

    static {
        User admin = new User("admin@bookshelf.com", "Amitendu", "ADMIN");
        admin.setId(1);
        admin.setApproved(true);
        admin.setEmailVerified(true);
        admin.setPhoneNumber("9999999999");
        admin.setAddress("Admin HQ");

        User seller = new User("seller@test.com", "John's Bookstore", "SELLER");
        seller.setId(2);
        seller.setApproved(true);
        seller.setEmailVerified(true);
        seller.setPhoneNumber("8888888888");
        seller.setAddress("Seller Street 123");

        User customer = new User("customer@web.com", "Alice Reader", "CUSTOMER");
        customer.setId(3);
        customer.setApproved(true);
        customer.setEmailVerified(true);
        customer.setPhoneNumber("7777777777");
        customer.setAddress("Reader Lane 45");

        MOCK_USERS.add(admin);
        MOCK_USERS.add(seller);
        MOCK_USERS.add(customer);
    }

    /**
     * Authenticates a user with email and password.
     * TODO: In production, passwords should be hashed using BCrypt or similar.
     *
     * @param email    user's email
     * @param password user's password
     * @return User object if authentication successful, null otherwise
     */
    public User authenticate(String email, String password) {
        // MOCK LOGIC: In the future, this will be: 
        // "SELECT * FROM users WHERE email=? AND password=?"

        if ("admin@bookshelf.com".equals(email) && "admin123".equals(password)) {
            return new User(email, "Amitendu (Admin)", "ADMIN");
        } else if ("seller@bookshelf.com".equals(email) && "seller123".equals(password)) {
            return new User(email, "Bibliophile Books", "SELLER");
        } else if ("customer@bookshelf.com".equals(email) && "customer123".equals(password)) {
            return new User(email, "Alice Reader", "CUSTOMER");
        }

        return null; // Login failed
    }

    /**
     * Creates a new user account.
     *
     * @param user the user to create
     * @return true if successful, false otherwise
     */
    public boolean createUser(User user) {
        // TODO: Implement actual database insert
        // Password should be hashed before storing
        return false;
    }

    /**
     * Retrieves all users.
     *
     * @return list of users (mock data for now)
     */
    public List<User> getAllUsers() {
        return new ArrayList<>(MOCK_USERS);
    }

    /**
     * Retrieves a user by email address.
     *
     * @param email the user's email
     * @return User object if found, null otherwise
     */
    public User getUserByEmail(String email) {
        return MOCK_USERS.stream()
                .filter(u -> u.getEmail() != null && u.getEmail().equalsIgnoreCase(email))
                .findFirst()
                .orElse(null);
    }

    /**
     * Retrieves a user by ID.
     *
     * @param userId the user's ID
     * @return User object if found, null otherwise
     */
    public User getUserById(int userId) {
        return MOCK_USERS.stream()
                .filter(u -> u.getId() == userId)
                .findFirst()
                .orElse(null);
    }

    /**
     * Updates user information.
     *
     * @param user the user to update
     * @return true if successful, false otherwise
     */
    public boolean updateUser(User user) {
        User existing = getUserById(user.getId());
        if (existing == null) {
            return false;
        }
        existing.setName(user.getName());
        existing.setEmail(user.getEmail());
        existing.setRole(user.getRole());
        existing.setPhoneNumber(user.getPhoneNumber());
        existing.setAddress(user.getAddress());
        return true;
    }

    /**
     * Deletes a user by ID.
     *
     * @param userId the ID of the user to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteUser(int userId) {
        return MOCK_USERS.removeIf(u -> u.getId() == userId);
    }

    /**
     * Retrieves all users with a specific role.
     *
     * @param role the role to filter by (CUSTOMER, SELLER, ADMIN)
     * @return List of users with the specified role
     */
    public List<User> getUsersByRole(String role) {
        List<User> users = new ArrayList<>();
        // TODO: Implement actual database query
        return users;
    }

    /**
     * Retrieves all sellers pending approval.
     *
     * @return List of unapproved sellers
     */
    public List<User> getPendingSellers() {
        List<User> sellers = new ArrayList<>();
        // TODO: Implement actual database query
        // SELECT * FROM users WHERE role='SELLER' AND is_approved=0
        return sellers;
    }

    /**
     * Approves a seller account.
     *
     * @param sellerId the ID of the seller to approve
     * @return true if successful, false otherwise
     */
    public boolean approveSeller(int sellerId) {
        User seller = getUserById(sellerId);
        if (seller == null) {
            return false;
        }
        seller.setApproved(true);
        return true;
    }

    /**
     * Rejects a seller account (mock implementation).
     * Removes or deactivates the seller from the mock list.
     *
     * @param sellerId seller ID
     * @return true if rejected, false otherwise
     */
    public boolean rejectSeller(int sellerId) {
        User seller = getUserById(sellerId);
        if (seller == null) {
            return false;
        }
        // For mock data, simply mark as not approved and leave in list
        seller.setApproved(false);
        return true;
    }

    /**
     * Toggles a user's active/approved status (mock implementation).
     *
     * @param userId the user ID
     * @return true if toggled, false otherwise
     */
    public boolean toggleUserStatus(int userId) {
        User user = getUserById(userId);
        if (user == null) {
            return false;
        }
        user.setApproved(!user.isApproved());
        return true;
    }

    /**
     * Checks if an email address is already registered.
     *
     * @param email the email to check
     * @return true if email exists, false otherwise
     */
    public boolean emailExists(String email) {
        return getUserByEmail(email) != null;
    }
}