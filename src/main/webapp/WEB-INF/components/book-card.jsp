<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!-- Reusable Book Card Component -->
<div class="bg-white border-4 border-black flat-shadow hover:translate-x-1 hover:translate-y-1 transition-transform">
    <!-- Book Image -->
    <div class="h-64 overflow-hidden border-b-4 border-black">
        <img src="${book.imageUrl != null ? book.imageUrl : '/static/images/books/default-book.jpg'}"
             alt="${book.title}"
             class="w-full h-full object-cover">
    </div>
    <!-- Book Details -->
    <div class="p-4">
        <h3 class="text-lg font-black uppercase mb-1 line-clamp-2">${book.title}</h3>
        <p class="text-sm text-gray-600 mb-2">by ${book.author}</p>
        <div class="flex justify-between items-center mt-4">
            <span class="text-2xl font-black text-blue-600">₹${book.price}</span>
            <c:if test="${not empty book.stockQuantity and book.stockQuantity > 0}">
                <span class="text-xs font-bold px-2 py-1 bg-green-200 text-green-800 border-2 border-black">
                    In Stock
                </span>
            </c:if>
        </div>
        <!-- Action Button -->
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/books/${book.id}"
               class="block w-full bg-black text-white text-center px-4 py-2 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase text-sm">
                View Details
            </a>
        </div>
    </div>
</div>
