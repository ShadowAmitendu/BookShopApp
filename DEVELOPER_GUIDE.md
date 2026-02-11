# 📚 Developer Reference - BookShelf Folder Structure

## 🎯 Quick Reference

### Component Includes (Use in ALL Pages)
```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<jsp:include page="/jsp/components/head.jsp">
    <jsp:param name="title" value="Your Page Title"/>
</jsp:include>

<jsp:include page="/jsp/components/navbar.jsp"/>
<jsp:include page="/jsp/components/alerts.jsp"/>

<!-- PAGE CONTENT GOES HERE -->

<jsp:include page="/jsp/components/footer.jsp"/>
```

### Show Toast Messages
```java
// In Servlet:
request.getSession().setAttribute("success", "Operation successful!");
response.sendRedirect(request.getContextPath() + "/page");

// Or:
request.setAttribute("error", "Something went wrong");
request.getRequestDispatcher("/views/page.jsp").forward(request, response);
```

### Toast Types
- `success` - Green ✅
- `error` - Red ❌
- `warning` - Yellow ⚠️
- `info` - Blue ℹ️

## 📍 Key Locations

| Purpose | Path |
|---------|------|
| **Page Head/CSS** | `/jsp/components/head.jsp` |
| **Navigation Bar** | `/jsp/components/navbar.jsp` |
| **Alerts/Toasts** | `/jsp/components/alerts.jsp` |
| **Footer** | `/jsp/components/footer.jsp` |
| **Login Page** | `/views/auth/login.jsp` |
| **Signup Page** | `/views/auth/signup.jsp` |
| **Customer Cart** | `/views/customer/cart.jsp` |
| **Admin Dashboard** | `/views/admin/dashboard.jsp` |
| **Seller Inventory** | `/views/seller/inventory.jsp` |

## 🔧 Servlet Patterns

### Redirect to Page
```java
response.sendRedirect(request.getContextPath() + "/login");
```

### Forward to JSP
```java
request.getRequestDispatcher("/views/customer/cart.jsp").forward(request, response);
```

### Set Success Message
```java
request.getSession().setAttribute("success", "Successfully added to cart!");
response.sendRedirect(request.getContextPath() + "/cart");
```

### Set Error Message
```java
request.setAttribute("error", "Invalid email or password");
request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
```

## 📦 Folder Breakdown

### `/jsp/components/`
Contains **shared UI components** used by all pages:
- `head.jsp` - Page metadata, Tailwind CSS, FontAwesome
- `navbar.jsp` - Navigation menu with login/logout
- `footer.jsp` - Site footer
- `alerts.jsp` - Toast notification system

### `/views/auth/`
Authentication pages:
- `login.jsp` - User login
- `signup.jsp` - User registration
- `forgot-password.jsp` - Password reset request
- `reset-password.jsp` - Password reset form
- `verify-email.jsp` - Email verification

### `/views/customer/`
Customer pages:
- `books.jsp` - Browse/search books
- `cart.jsp` - Shopping cart
- `checkout.jsp` - Order checkout
- `orders.jsp` - Order history
- `profile.jsp` - User profile
- `order-success.jsp` - Order confirmation

### `/views/seller/`
Seller pages:
- `inventory.jsp` - Manage inventory
- `add-book.jsp` - Add new book
- `orders.jsp` - View seller orders

### `/views/admin/`
Admin pages:
- `dashboard.jsp` - Admin dashboard
- `manage-users.jsp` - User management
- `approve-sellers.jsp` - Seller approvals
- `verify-email.jsp` - Email verification

### `/views/common/`
Utility pages:
- `about.jsp` - About us
- `contact.jsp` - Contact form
- `error.jsp` - Error page

## ⚡ Common Tasks

### Create New Page
1. Create JSP file in `/views/{category}/new-page.jsp`
2. Start with component includes (see above)
3. Add your content
4. Create servlet if needed
5. Add servlet mapping in `web.xml`

### Create New Servlet
1. Create Java file in `src/main/java/com/amitendu/bookstoreapp/servlet/{category}/`
2. Extend `HttpServlet`
3. Implement `doGet()` and/or `doPost()`
4. Use session/request attributes for messages
5. Forward to JSP or redirect
6. Add mapping in `web.xml`:
```xml
<servlet>
    <servlet-name>MyServlet</servlet-name>
    <servlet-class>com.amitendu.bookstoreapp.servlet.category.MyServlet</servlet-class>
</servlet>
<servlet-mapping>
    <servlet-name>MyServlet</servlet-name>
    <url-pattern>/my-page</url-pattern>
</servlet-mapping>
```

### Use Tailwind CSS
All pages already have Tailwind via CDN. Use classes:
```html
<div class="bg-white border-4 border-black p-6 flat-shadow">
    <h1 class="text-3xl font-black uppercase">Title</h1>
    <button class="bg-black text-white px-4 py-2 font-bold">Click Me</button>
</div>
```

### Add Icon (FontAwesome)
```html
<i class="fas fa-icon-name"></i>
```

Explore: https://fontawesome.com/icons

## 🎨 Design System

### Brutalist Theme
- **Borders**: `border-4 border-black`
- **Shadows**: `flat-shadow` or `flat-shadow-sm`
- **Typography**: Space Grotesk (loaded in head.jsp)
- **Colors**:
  - Black: Primary
  - White: Background
  - Blue: Secondary
  - Yellow: Accent
  - Pink: Highlight

### Common Classes
```html
<!-- Container -->
<div class="max-w-6xl mx-auto px-4">

<!-- Card -->
<div class="bg-white border-4 border-black flat-shadow p-6">

<!-- Button -->
<button class="bg-black text-white px-6 py-3 font-bold border-2 border-black hover:bg-gray-800">

<!-- Input -->
<input class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">

<!-- Heading -->
<h1 class="text-5xl font-black uppercase">

<!-- Flex -->
<div class="flex items-center justify-between">

<!-- Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
```

## 🐛 Troubleshooting

### Page Shows 404
- Check servlet mapping in `web.xml`
- Check JSP path in servlet
- URL pattern must be correct

### Toast Not Showing
- Check for error in browser console (F12)
- Make sure `alerts.jsp` is included
- Verify message set: `request.setAttribute("success", "...")`

### Styling Not Applied
- Check Tailwind classes are spelled correctly
- Use `flat-shadow` for brutalist style
- Check `flat-shadow-sm` for smaller shadow
- Borders: `border-4 border-black`

### Component Not Found
- Check `/jsp/components/` folder exists
- Verify JSP file name matches include path
- Use `/jsp/components/` not `/includes/`

## 📖 Resources

- **Tailwind CSS**: https://tailwindcss.com
- **FontAwesome**: https://fontawesome.com/icons
- **Jakarta JSP**: https://jakarta.ee/specifications/pages/
- **Jakarta Servlet**: https://jakarta.ee/specifications/servlet/

## ✨ Tips & Tricks

1. **Use EL expressions**: `${variable}` for cleaner code
2. **Use JSTL**: `<c:if>`, `<c:forEach>` for logic
3. **Keep pages small**: Break into components
4. **Reuse components**: Don't repeat includes
5. **Use session**: For user data across pages
6. **Use request attributes**: For single-page data

---

**Happy coding! 🚀**

