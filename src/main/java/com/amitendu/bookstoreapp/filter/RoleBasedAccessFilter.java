package com.amitendu.bookstoreapp.filter;

import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Filter to enforce role-based access control.
 *
 * @author amite
 */
@WebFilter(urlPatterns = {"/admin/*", "/seller/*"})
public class RoleBasedAccessFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        User user = SessionUtil.getLoggedInUser(httpRequest);
        String requestURI = httpRequest.getRequestURI();

        if (user != null) {
            String role = user.getRole();

            // Check admin access
            if (requestURI.contains("/admin/") && !"ADMIN".equals(role)) {
                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN,
                        "Access denied. Admin privileges required.");
                return;
            }

            // Check seller access
            if (requestURI.contains("/seller/") && !"SELLER".equals(role)) {
                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN,
                        "Access denied. Seller privileges required.");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic if needed
    }

    @Override
    public void destroy() {
        // Cleanup logic if needed
    }
}

