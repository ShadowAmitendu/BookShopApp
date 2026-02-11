package com.amitendu.bookstoreapp.servlet.admin;

import com.amitendu.bookstoreapp.dao.UserDAO;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet for managing users.
 * Admins can view, edit, and manage all user accounts.
 *
 * @author amite
 */
public class ManageUsersServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get all users
        List<User> userList = userDAO.getAllUsers();

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/WEB-INF/views/admin/manage-users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User adminUser = SessionUtil.getLoggedInUser(request);
        if (adminUser == null || !"ADMIN".equals(adminUser.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            handleUpdateUser(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteUser(request, response);
        } else if ("toggleStatus".equals(action)) {
            handleToggleUserStatus(request, response);
        } else {
            doGet(request, response);
        }
    }

    private void handleUpdateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String role = request.getParameter("role");

            User updatedUser = new User();
            updatedUser.setId(userId);
            updatedUser.setName(name);
            updatedUser.setEmail(email);
            updatedUser.setRole(role);

            boolean success = userDAO.updateUser(updatedUser);

            if (success) {
                request.getSession().setAttribute("success", "User updated successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to update user");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid user ID");
        }

        response.sendRedirect(request.getContextPath() + "/admin/manage-users");
    }

    private void handleDeleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("userId"));

            boolean success = userDAO.deleteUser(userId);

            if (success) {
                request.getSession().setAttribute("success", "User deleted successfully");
            } else {
                request.getSession().setAttribute("error", "Failed to delete user");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid user ID");
        }

        response.sendRedirect(request.getContextPath() + "/admin/manage-users");
    }

    private void handleToggleUserStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int userId = Integer.parseInt(request.getParameter("userId"));

            boolean success = userDAO.toggleUserStatus(userId);

            if (success) {
                request.getSession().setAttribute("success", "User status updated");
            } else {
                request.getSession().setAttribute("error", "Failed to update user status");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid user ID");
        }

        response.sendRedirect(request.getContextPath() + "/admin/manage-users");
    }
}

