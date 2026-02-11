<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Browse Books - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-7xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">Browse Books</h1>
            <p class="text-gray-600 text-lg">Discover your next great read from our collection</p>
        </div>

        <!-- Search Bar -->
        <div class="mb-8">
            <form action="${pageContext.request.contextPath}/books" method="get" class="flex gap-2">
                <input type="text"
                       name="search"
                       id="searchInput"
                       value="${param.search}"
                       placeholder="Search books by title or author..."
                       class="flex-1 px-6 py-4 border-4 border-black focus:outline-none focus:border-blue-600 font-bold">
                <button type="submit"
                        class="bg-black text-white px-8 py-4 font-bold border-4 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                    <i class="fas fa-search mr-2"></i>Search
                </button>
            </form>
        </div>

        <!-- Category Filter -->
        <div class="bg-white border-4 border-black p-6 mb-8 flat-shadow-sm">
            <h3 class="font-black uppercase mb-4 text-lg">
                <i class="fas fa-filter mr-2"></i>Filter by Category
            </h3>
            <div class="flex flex-wrap gap-3">
                <a href="${pageContext.request.contextPath}/books"
                   class="px-6 py-2 font-bold border-2 border-black ${empty param.category ? 'bg-yellow-300' : 'bg-white hover:bg-gray-100'} transition-colors">
                    ALL BOOKS
                </a>
                <a href="${pageContext.request.contextPath}/books?category=Fiction"
                   class="px-6 py-2 font-bold border-2 border-black ${param.category == 'Fiction' ? 'bg-yellow-300' : 'bg-white hover:bg-gray-100'} transition-colors">
                    FICTION
                </a>
                <a href="${pageContext.request.contextPath}/books?category=Engineering"
                   class="px-6 py-2 font-bold border-2 border-black ${param.category == 'Engineering' ? 'bg-yellow-300' : 'bg-white hover:bg-gray-100'} transition-colors">
                    ENGINEERING
                </a>
                <a href="${pageContext.request.contextPath}/books?category=Self-Help"
                   class="px-6 py-2 font-bold border-2 border-black ${param.category == 'Self-Help' ? 'bg-yellow-300' : 'bg-white hover:bg-gray-100'} transition-colors">
                    SELF-HELP
                </a>
                <a href="${pageContext.request.contextPath}/books?category=Science"
                   class="px-6 py-2 font-bold border-2 border-black ${param.category == 'Science' ? 'bg-yellow-300' : 'bg-white hover:bg-gray-100'} transition-colors">
                    SCIENCE
                </a>
            </div>
        </div>

        <!-- Books Grid -->
        <c:choose>
            <c:when test="${not empty bookList}">
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                    <c:forEach var="book" items="${bookList}">
                        <div class="bg-white border-4 border-black flat-shadow-sm hover:flat-shadow transition-all">
                            <!-- Book Image -->
                            <div class="aspect-[2/3] overflow-hidden border-b-4 border-black">
                                <img src="${book.imageUrl != null ? book.imageUrl : 'https://via.placeholder.com/200x300?text=No+Image'}"
                                     alt="${book.title}"
                                     class="w-full h-full object-cover">
                            </div>

                            <!-- Book Info -->
                            <div class="p-4">
                                <h3 class="font-bold text-lg mb-1 line-clamp-2" title="${book.title}">
                                        ${book.title}
                                </h3>
                                <p class="text-gray-600 text-sm mb-2">by ${book.author}</p>
                                <span class="inline-block bg-yellow-300 border-2 border-black px-3 py-1 text-xs font-bold uppercase">
                                        ${book.category}
                                </span>

                                <!-- Price & Action -->
                                <div class="mt-4 pt-4 border-t-2 border-gray-200">
                                    <p class="text-2xl font-black text-blue-600 mb-3">₹${book.price}</p>
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.user and sessionScope.user.role == 'CUSTOMER'}">
                                            <button onclick="addToCart(${book.id})"
                                                    class="w-full bg-black text-white px-4 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase text-sm">
                                                <i class="fas fa-cart-plus mr-2"></i>Add to Cart
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/login"
                                               class="block w-full text-center bg-white text-black px-4 py-3 font-bold border-2 border-black hover:bg-gray-100 transition-colors uppercase text-sm">
                                                <i class="fas fa-sign-in-alt mr-2"></i>Login to Buy
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="bg-blue-50 border-4 border-blue-600 p-12 text-center">
                    <i class="fas fa-info-circle text-6xl text-blue-600 mb-4"></i>
                    <h3 class="text-2xl font-black uppercase mb-2">No Books Found</h3>
                    <p class="text-gray-600">Try adjusting your search or filter criteria</p>
                    <a href="${pageContext.request.contextPath}/books"
                       class="inline-block mt-6 bg-black text-white px-8 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                        View All Books
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

<script>
    function addToCart(bookId) {
        const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

        // Show loading
        showLoading();

        // For now, simulate cart addition (will be implemented with backend later)
        setTimeout(() => {
            hideLoading();
            showToast('success', 'Book added to cart successfully!');
            // You can add cart count update here
        }, 500);

        // TODO: Implement actual AJAX call when cart backend is ready
        /*
        fetch(`


        ${contextPath}/cart/add`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `bookId=


        ${bookId}&quantity=1`
    })
    .then(response => response.json())
    .then(data => {
        hideLoading();
        if (data.success) {
            showToast('success', 'Book added to cart!');
        } else {
            showToast('error', data.message || 'Failed to add book to cart');
        }
    })
    .catch(error => {
        hideLoading();
        showToast('error', 'An error occurred. Please try again.');
    });
    */
    }
</script>


