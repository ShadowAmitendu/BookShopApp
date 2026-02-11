package com.amitendu.bookstoreapp.servlet.seller;

import com.amitendu.bookstoreapp.dao.BookDAO;
import com.amitendu.bookstoreapp.model.Book;
import com.amitendu.bookstoreapp.model.User;
import com.amitendu.bookstoreapp.util.SessionUtil;
import com.amitendu.bookstoreapp.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet for adding books to the catalog by ISBN.
 * Sellers can add new books to the system.
 *
 * @author amite
 */
public class AddBookByISBNServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"SELLER".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/views/seller/add-book.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request);
        if (user == null || !"SELLER".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String category = request.getParameter("category");
        String publicationYearStr = request.getParameter("publicationYear");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");

        // Validate required fields
        if (ValidationUtil.isEmpty(title) || ValidationUtil.isEmpty(author) ||
                ValidationUtil.isEmpty(category) || ValidationUtil.isEmpty(priceStr)) {
            request.setAttribute("error", "Please fill in all required fields");
            doGet(request, response);
            return;
        }

        // Validate ISBN if provided
        if (!ValidationUtil.isEmpty(isbn) && !ValidationUtil.isValidISBN(isbn)) {
            request.setAttribute("error", "Invalid ISBN format");
            doGet(request, response);
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);
            if (price <= 0) {
                request.setAttribute("error", "Price must be greater than 0");
                doGet(request, response);
                return;
            }

            int publicationYear = 0;
            if (!ValidationUtil.isEmpty(publicationYearStr)) {
                publicationYear = Integer.parseInt(publicationYearStr);
                if (publicationYear < 1000 || publicationYear > 2030) {
                    request.setAttribute("error", "Invalid publication year");
                    doGet(request, response);
                    return;
                }
            }

            // Check if book with same ISBN already exists
            if (!ValidationUtil.isEmpty(isbn)) {
                Book existingBook = bookDAO.getBookByISBN(isbn);
                if (existingBook != null) {
                    request.setAttribute("error", "A book with this ISBN already exists");
                    doGet(request, response);
                    return;
                }
            }

            // Create new book
            Book newBook = new Book();
            newBook.setIsbn(isbn);
            newBook.setTitle(title);
            newBook.setAuthor(author);
            newBook.setPublisher(publisher);
            newBook.setPublicationYear(publicationYear);
            newBook.setPrice(price);
            newBook.setCategory(category);
            newBook.setDescription(description);
            newBook.setImageUrl(ValidationUtil.isEmpty(imageUrl) ?
                    "https://via.placeholder.com/200x300?text=No+Image" : imageUrl);
            newBook.setStockQuantity(0); // Will be set when added to inventory

            boolean success = bookDAO.addBook(newBook);

            if (success) {
                request.getSession().setAttribute("success",
                        "Book added successfully! You can now add it to your inventory.");
                response.sendRedirect(request.getContextPath() + "/seller/inventory");
            } else {
                request.setAttribute("error", "Failed to add book. Please try again.");
                doGet(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format");
            doGet(request, response);
        }
    }
}

