<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="${book.title} - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-6xl mx-auto">
        <!-- Back Button -->
        <a href="${pageContext.request.contextPath}/books"
           class="inline-block mb-6 text-blue-600 hover:text-blue-800 font-bold">
            <i class="fas fa-arrow-left mr-2"></i>Back to Books
        </a>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Book Image -->
            <div class="bg-white border-4 border-black flat-shadow p-8">
                <img src="${book.imageUrl != null ? book.imageUrl : '/static/images/books/default-book.jpg'}"
                     alt="${book.title}"
                     class="w-full h-auto border-4 border-black">
            </div>

            <!-- Book Details -->
            <div>
                <div class="bg-white border-4 border-black flat-shadow p-8 mb-6">
                    <h1 class="text-4xl font-black uppercase mb-2">${book.title}</h1>
                    <p class="text-xl text-gray-600 mb-4">by ${book.author}</p>

                    <div class="border-t-2 border-gray-200 pt-4 mb-4">
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <div>
                                <p class="text-sm font-bold uppercase text-gray-600">Publisher</p>
                                <p class="font-bold">${book.publisher != null ? book.publisher : 'N/A'}</p>
                            </div>
                            <div>
                                <p class="text-sm font-bold uppercase text-gray-600">Year</p>
                                <p class="font-bold">${book.publicationYear != null ? book.publicationYear : 'N/A'}</p>
                            </div>
                            <div>
                                <p class="text-sm font-bold uppercase text-gray-600">ISBN</p>
                                <p class="font-bold">${book.isbn != null ? book.isbn : 'N/A'}</p>
                            </div>
                            <div>
                                <p class="text-sm font-bold uppercase text-gray-600">Category</p>
                                <p class="font-bold">${book.category}</p>
                            </div>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="mb-6">
                        <h3 class="text-lg font-black uppercase mb-2">Description</h3>
                        <p class="text-gray-700 leading-relaxed">
                            ${book.description != null ? book.description : 'No description available.'}
                        </p>
                    </div>

                    <!-- Price & Stock -->
                    <div class="border-t-2 border-gray-200 pt-4">
                        <div class="flex justify-between items-center mb-4">
                            <div>
                                <p class="text-sm font-bold uppercase text-gray-600 mb-1">Price</p>
                                <p class="text-4xl font-black text-blue-600">₹${book.price}</p>
                            </div>
                            <div class="text-right">
                                <c:choose>
                                    <c:when test="${book.stockQuantity > 0}">
                                        <span class="px-4 py-2 bg-green-200 text-green-800 font-bold border-2 border-black">
                                            <i class="fas fa-check mr-1"></i>In Stock (${book.stockQuantity})
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="px-4 py-2 bg-red-200 text-red-800 font-bold border-2 border-black">
                                            <i class="fas fa-times mr-1"></i>Out of Stock
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Add to Cart Button -->
                        <c:if test="${book.stockQuantity > 0}">
                            <form action="${pageContext.request.contextPath}/cart" method="post" class="mb-4">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="bookId" value="${book.id}">
                                <div class="flex gap-4 mb-4">
                                    <div class="flex-1">
                                        <label for="quantity" class="block text-sm font-bold uppercase mb-2">Quantity</label>
                                        <input type="number"
                                               id="quantity"
                                               name="quantity"
                                               value="1"
                                               min="1"
                                               max="${book.stockQuantity}"
                                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                                    </div>
                                </div>
                                <button type="submit"
                                        class="w-full bg-black text-white px-6 py-4 text-lg font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                                    <i class="fas fa-shopping-cart mr-2"></i>Add to Cart
                                </button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

