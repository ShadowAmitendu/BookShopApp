package com.amitendu.bookstoreapp.util;

import com.amitendu.bookstoreapp.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

/**
 * Utility class for session management and user authentication checks.
 *
 * @author amite
 */
public class SessionUtil {

    private static final String USER_SESSION_KEY = "user";

    /**
     * Gets the currently logged-in user from the session.
     *
     * @param request the HTTP request
     * @return User object if logged in, null otherwise
     */
    public static User getLoggedInUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return (User) session.getAttribute(USER_SESSION_KEY);
        }
        return null;
    }

    /**
     * Checks if a user is logged in.
     *
     * @param request the HTTP request
     * @return true if user is logged in, false otherwise
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        return getLoggedInUser(request) != null;
    }

    /**
     * Checks if the logged-in user has a specific role.
     *
     * @param request the HTTP request
     * @param role    the role to check
     * @return true if user has the role, false otherwise
     */
    public static boolean hasRole(HttpServletRequest request, String role) {
        User user = getLoggedInUser(request);
        return user != null && role.equals(user.getRole());
    }

    /**
     * Sets the user in the session.
     *
     * @param request the HTTP request
     * @param user    the user to set
     */
    public static void setUser(HttpServletRequest request, User user) {
        HttpSession session = request.getSession(true);
        session.setAttribute(USER_SESSION_KEY, user);
    }

    /**
     * Removes the user from the session (logout).
     *
     * @param request the HTTP request
     */
    public static void removeUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(USER_SESSION_KEY);
            session.invalidate();
        }
    }

    /**
     * Gets the user's IP address from the request.
     *
     * @param request the HTTP request
     * @return the user's IP address
     */
    public static String getClientIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}

