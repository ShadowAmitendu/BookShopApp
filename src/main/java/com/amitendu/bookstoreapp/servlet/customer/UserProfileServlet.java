package com.amitendu.bookstoreapp.servlet.customer;

import com.amitendu.bookstoreapp.dao.UserDAO;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for managing user profile.
 *
 * @author amite
 */
public class UserProfileServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get fresh user data from database
        User userDetails = userDAO.getUserById(user.getId());

        if (userDetails == null) {
            userDetails = user; // Fallback to session user
        }

        request.setAttribute("userDetails", userDetails);
        request.getRequestDispatcher("/WEB-INF/views/customer/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            handleUpdateProfile(request, response, user);
        } else if ("changePassword".equals(action)) {
            handleChangePassword(request, response, user);
        } else {
            doGet(request, response);
        }
    }

    private void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Validate input
        if (ValidationUtil.isEmpty(name)) {
            request.setAttribute("error", "Name is required");
            doGet(request, response);
            return;
        }

        if (!ValidationUtil.isEmpty(phone) && !ValidationUtil.isValidPhone(phone)) {
            request.setAttribute("error", "Invalid phone number");
            doGet(request, response);
            return;
        }

        // Update user details
        User updatedUser = new User();
        updatedUser.setId(user.getId());
        updatedUser.setName(name);
        updatedUser.setEmail(user.getEmail());
        updatedUser.setRole(user.getRole());
        updatedUser.setPhoneNumber(phone);
        updatedUser.setAddress(address);

        boolean success = userDAO.updateUser(updatedUser);

        if (success) {
            // Update session
            user.setName(name);
            user.setPhoneNumber(phone);
            user.setAddress(address);
            SessionUtil.setUser(request, user);

            request.getSession().setAttribute("success", "Profile updated successfully");
        } else {
            request.setAttribute("error", "Failed to update profile");
        }

        doGet(request, response);
    }

    private void handleChangePassword(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate input
        if (ValidationUtil.isEmpty(currentPassword) || ValidationUtil.isEmpty(newPassword)
                || ValidationUtil.isEmpty(confirmPassword)) {
            request.setAttribute("error", "All password fields are required");
            doGet(request, response);
            return;
        }

        if (!ValidationUtil.isValidPassword(newPassword)) {
            request.setAttribute("error", "Password must be at least 8 characters with letters and numbers");
            doGet(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New passwords do not match");
            doGet(request, response);
            return;
        }

        // TODO: Verify current password
        // TODO: Hash new password
        // TODO: Update password in database

        request.getSession().setAttribute("success", "Password changed successfully");
        doGet(request, response);
    }
}

