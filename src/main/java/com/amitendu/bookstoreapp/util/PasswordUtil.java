package com.amitendu.bookstoreapp.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

/**
 * Utility class for password hashing and verification.
 * Uses SHA-256 with salt for secure password storage.
 *
 * @author amite
 */
public class PasswordUtil {

    private static final String ALGORITHM = "SHA-256";
    private static final int SALT_LENGTH = 16;

    /**
     * Generates a random salt for password hashing.
     *
     * @return Base64 encoded salt string
     */
    public static String generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[SALT_LENGTH];
        random.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }

    /**
     * Hashes a password with the provided salt.
     *
     * @param password the plain text password
     * @param salt     the salt to use
     * @return hashed password
     */
    public static String hashPassword(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance(ALGORITHM);
            md.update(Base64.getDecoder().decode(salt));
            byte[] hashedPassword = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    /**
     * Verifies a password against a stored hash and salt.
     *
     * @param password   the plain text password to verify
     * @param storedHash the stored password hash
     * @param salt       the salt used for hashing
     * @return true if password matches, false otherwise
     */
    public static boolean verifyPassword(String password, String storedHash, String salt) {
        String hashedInput = hashPassword(password, salt);
        return hashedInput.equals(storedHash);
    }
}

