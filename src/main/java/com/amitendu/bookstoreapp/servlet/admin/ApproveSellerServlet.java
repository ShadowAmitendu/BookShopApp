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
 * Servlet for approving seller accounts.
 * Admins can approve or reject pending seller registrations.
 *
 * @author amite
 */
public class ApproveSellerServlet extends HttpServlet {

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

        // Get pending sellers (mock data for now)
        List<User> pendingSellers = userDAO.getPendingSellers();

        request.setAttribute("pendingSellers", pendingSellers);
        request.setAttribute("pendingCount", pendingSellers.size());

        request.getRequestDispatcher("/WEB-INF/views/admin/approve-sellers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String sellerId = request.getParameter("sellerId");
        String action = request.getParameter("action");

        try {
            int id = Integer.parseInt(sellerId);

            boolean success;
            if ("approve".equals(action)) {
                success = userDAO.approveSeller(id);
                if (success) {
                    request.getSession().setAttribute("success", "Seller approved successfully");
                } else {
                    request.getSession().setAttribute("error", "Failed to approve seller");
                }
            } else if ("reject".equals(action)) {
                success = userDAO.rejectSeller(id);
                if (success) {
                    request.getSession().setAttribute("success", "Seller rejected");
                } else {
                    request.getSession().setAttribute("error", "Failed to reject seller");
                }
            } else {
                request.getSession().setAttribute("error", "Invalid action");
            }

        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid seller ID");
        }

        response.sendRedirect(request.getContextPath() + "/admin/approve-sellers");
    }
}

