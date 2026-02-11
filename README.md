# 📚 BookShelf - Online Bookstore Application

A modern, full-stack web application for buying and selling books, built with **Java Servlets**, **JSP**, and **Oracle
Database**.

## 🎨 Design Philosophy

BookShelf features a bold, **brutalist design** aesthetic with:

- Clean black & white color scheme with yellow and blue accents
- Thick borders and flat shadows for a modern, striking look
- **Tailwind CSS** for responsive, utility-first styling
- **Space Grotesk** font for contemporary typography

## 🚀 Features

### For Customers

- 📖 Browse books by category
- 🔍 Search books by title or author
- 🛒 Shopping cart functionality
- 📦 Order tracking
- 👤 User profile management

### For Sellers

- 📦 Inventory management
- 📊 Order management
- 💼 Seller dashboard

### For Administrators

- 👥 User management
- ✅ Seller approval system
- 📈 Analytics dashboard

## 🛠️ Technology Stack

- **Backend**: Java 17, Jakarta EE 10
- **Frontend**: JSP, Tailwind CSS, JavaScript
- **Database**: Oracle Database (planned)
- **Server**: Apache Tomcat 10.1+
- **Build Tool**: Maven

## 📁 Project Structure

```
BookShopApp/
├── src/main/java/com/amitendu/bookstoreapp/
│   ├── dao/              # Data Access Layer
│   ├── model/            # Domain Models
│   ├── servlet/          # Controllers (MVC)
│   ├── filter/           # Security Filters
│   ├── util/             # Utility Classes
│   └── resources/        # REST Resources
├── src/main/webapp/
│   ├── jsp/components/   # Reusable UI Components
│   ├── views/            # Page Views
│   ├── css/              # Stylesheets
│   ├── js/               # JavaScript
│   └── index.jsp         # Landing Page
└── pom.xml               # Maven Configuration
```

## 🎯 Quick Start

### Prerequisites

- **Java 17** or higher
- **Maven 3.8+**
- **Apache Tomcat 10.1+**
- **Oracle Database** (for production)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd BookShopApp
   ```

2. **Build the project**
   ```bash
   mvn clean package
   ```

3. **Deploy to Tomcat**
    - Copy `target/BookStoreApp-1.0-SNAPSHOT.war` to Tomcat's `webapps` folder
    - Or use your IDE's built-in Tomcat integration

4. **Access the application**
   ```
   http://localhost:8080/BookStoreApp-1.0-SNAPSHOT/
   ```

## 🔑 Demo Credentials

For development/testing purposes:

| Role     | Email                  | Password    |
|----------|------------------------|-------------|
| Admin    | admin@bookshelf.com    | admin123    |
| Seller   | seller@bookshelf.com   | seller123   |
| Customer | customer@bookshelf.com | customer123 |

## 📱 Pages

### Public Pages

- **/** - Homepage with hero section
- **/login** - User login
- **/signup** - New user registration
- **/books** - Browse all books

### Customer Pages

- **/cart** - Shopping cart
- **/orders** - Order history
- **/customer/profile** - User profile

### Seller Pages

- **/seller/inventory** - Manage inventory
- **/seller/orders** - View orders
- **/seller/profile** - Seller profile

### Admin Pages

- **/admin/dashboard** - Admin dashboard
- **/admin/approve-sellers** - Approve new sellers
- **/admin/users** - Manage users

## 🔒 Security Features

- ✅ Password hashing with SHA-256 + salt
- ✅ Input validation and sanitization
- ✅ XSS prevention
- ✅ Role-based access control (RBAC)
- ✅ Session management
- ✅ Authentication filters

## 🎨 UI Components

### Reusable Components

All pages use modular components for consistency:

```jsp
<!-- Standard page structure -->
<jsp:include page="/jsp/components/head.jsp">
    <jsp:param name="title" value="Page Title" />
</jsp:include>

<jsp:include page="/jsp/components/navbar.jsp" />
<jsp:include page="/jsp/components/alerts.jsp" />

<!-- Your content here -->

<jsp:include page="/jsp/components/footer.jsp" />
```

### Component Files

- **head.jsp** - HTML head with Tailwind CSS and fonts
- **navbar.jsp** - Responsive navigation with user menu
- **footer.jsp** - Footer with links and social media
- **alerts.jsp** - Success/error message alerts

## 📊 Database Schema (Planned)

The application is designed to work with the following tables:

- **users** - User accounts (customers, sellers, admins)
- **books** - Book catalog
- **inventory** - Seller inventory items
- **orders** - Customer orders
- **order_items** - Items in each order
- **cart** - Shopping cart items
- **activity_log** - User activity tracking

## 🧪 Development Status

### ✅ Completed

- Core MVC architecture
- User authentication system
- Book browsing with search/filter
- Reusable UI components
- Security utilities
- Responsive design

### 🚧 In Progress

- Database integration
- Shopping cart operations
- Order processing
- Email verification
- Password reset

### 📋 Planned

- Payment gateway integration
- Advanced search
- Book recommendations
- Reviews and ratings
- Analytics dashboard

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Code Style

- **Java**: Follow Oracle's Java Code Conventions
- **JSP**: Use proper indentation and component structure
- **JavaScript**: ES6+ with clear comments
- **CSS**: Utility-first with Tailwind

## 🐛 Known Issues

- Mock authentication (hardcoded credentials) - Database integration pending
- Cart operations not persisted - Requires database
- Email functionality not implemented

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Amitendu**

- GitHub: [@yourusername](https://github.com/yourusername)

## 🙏 Acknowledgments

- Jakarta EE Documentation
- Tailwind CSS
- Font Awesome
- Open Library (book cover images)

---

**Note**: This is a learning project demonstrating Jakarta EE web development with modern frontend practices. Database
integration is the next major milestone.

For questions or support, please open an issue on GitHub.

