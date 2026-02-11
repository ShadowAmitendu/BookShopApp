<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Shopping Cart - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-6xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-shopping-cart mr-3"></i>Shopping Cart
            </h1>
            <p class="text-gray-600 text-lg">Review your items before checkout</p>
        </div>

        <c:choose>
            <c:when test="${not empty cartItems and cartItems.size() > 0}">
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Cart Items -->
                    <div class="lg:col-span-2">
                        <div class="bg-white border-4 border-black flat-shadow">
                            <div class="p-6 border-b-4 border-black">
                                <h2 class="text-2xl font-black uppercase">Cart Items (${itemCount})</h2>
                            </div>

                            <div class="divide-y-2 divide-gray-200">
                                <c:forEach var="item" items="${cartItems}">
                                    <div class="p-6 flex items-center space-x-4">
                                        <!-- Book Image -->
                                        <div class="w-20 h-28 flex-shrink-0">
                                            <img src="${item.bookImageUrl != null ? item.bookImageUrl : 'https://via.placeholder.com/80x112?text=No+Image'}"
                                                 alt="${item.bookTitle}"
                                                 class="w-full h-full object-cover border-2 border-black">
                                        </div>

                                        <!-- Book Details -->
                                        <div class="flex-1">
                                            <h3 class="font-bold text-lg mb-1">${item.bookTitle}</h3>
                                            <p class="text-gray-600 mb-2">by ${item.bookAuthor}</p>
                                            <p class="text-2xl font-black text-blue-600">₹${item.bookPrice}</p>
                                        </div>

                                        <!-- Quantity Controls -->
                                        <div class="flex items-center space-x-2">
                                            <button onclick="updateQuantity(${item.id}, ${item.quantity - 1})"
                                                    class="w-8 h-8 bg-gray-200 border-2 border-black flex items-center justify-center hover:bg-gray-300">
                                                <i class="fas fa-minus text-sm"></i>
                                            </button>

                                            <span class="w-12 text-center font-bold border-2 border-black px-2 py-1">
                                                ${item.quantity}
                                            </span>

                                            <button onclick="updateQuantity(${item.id}, ${item.quantity + 1})"
                                                    class="w-8 h-8 bg-gray-200 border-2 border-black flex items-center justify-center hover:bg-gray-300">
                                                <i class="fas fa-plus text-sm"></i>
                                            </button>
                                        </div>

                                        <!-- Subtotal -->
                                        <div class="text-right">
                                            <p class="font-bold text-lg">₹${item.subtotal}</p>
                                        </div>

                                        <!-- Remove Button -->
                                        <div>
                                            <button onclick="removeItem(${item.id})"
                                                    class="text-red-600 hover:text-red-800 p-2">
                                                <i class="fas fa-trash text-xl"></i>
                                            </button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Clear Cart -->
                            <div class="p-6 border-t-2 border-gray-200">
                                <button onclick="clearCart()"
                                        class="bg-red-500 text-white px-4 py-2 font-bold border-2 border-black hover:bg-red-600 transition-colors">
                                    <i class="fas fa-trash mr-2"></i>Clear Cart
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="lg:col-span-1">
                        <div class="bg-white border-4 border-black flat-shadow p-6 sticky top-4">
                            <h2 class="text-2xl font-black uppercase mb-6">Order Summary</h2>

                            <div class="space-y-4">
                                <div class="flex justify-between">
                                    <span class="font-bold">Items (${itemCount})</span>
                                    <span class="font-bold">₹${cartTotal}</span>
                                </div>

                                <div class="flex justify-between">
                                    <span class="font-bold">Shipping</span>
                                    <span class="font-bold text-green-600">FREE</span>
                                </div>

                                <div class="border-t-2 border-black pt-4">
                                    <div class="flex justify-between text-xl">
                                        <span class="font-black">Total</span>
                                        <span class="font-black text-blue-600">₹${cartTotal}</span>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-8 space-y-3">
                                <a href="${pageContext.request.contextPath}/checkout"
                                   class="block w-full text-center bg-black text-white px-6 py-4 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                                    <i class="fas fa-credit-card mr-2"></i>Proceed to Checkout
                                </a>

                                <a href="${pageContext.request.contextPath}/books"
                                   class="block w-full text-center bg-white text-black px-6 py-3 font-bold border-2 border-black hover:bg-gray-100 transition-colors uppercase">
                                    <i class="fas fa-arrow-left mr-2"></i>Continue Shopping
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Empty Cart -->
                <div class="bg-blue-50 border-4 border-blue-600 p-12 text-center">
                    <i class="fas fa-shopping-cart text-6xl text-blue-600 mb-4"></i>
                    <h3 class="text-2xl font-black uppercase mb-2">Your Cart is Empty</h3>
                    <p class="text-gray-600 mb-6">Add some books to get started!</p>
                    <a href="${pageContext.request.contextPath}/books"
                       class="inline-block bg-black text-white px-8 py-4 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                        <i class="fas fa-book mr-2"></i>Browse Books
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

<script>
function updateQuantity(cartItemId, quantity) {
    if (quantity < 1) {
        if (confirm('Remove this item from cart?')) {
            removeItem(cartItemId);
        }
        return;
    }

    showLoading();
    fetch(`${window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2))}/cart`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `action=update&cartItemId=${cartItemId}&quantity=${quantity}`
    })
    .then(response => {
        hideLoading();
        if (response.ok) {
            location.reload();
        } else {
            showToast('error', 'Failed to update quantity');
        }
    })
    .catch(error => {
        hideLoading();
        showToast('error', 'An error occurred');
    });
}

function removeItem(cartItemId) {
    showLoading();
    fetch(`${window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2))}/cart`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `action=remove&cartItemId=${cartItemId}`
    })
    .then(response => {
        hideLoading();
        if (response.ok) {
            location.reload();
        } else {
            showToast('error', 'Failed to remove item');
        }
    })
    .catch(error => {
        hideLoading();
        showToast('error', 'An error occurred');
    });
}

function clearCart() {
    if (!confirm('Clear all items from cart?')) return;

    showLoading();
    fetch(`${window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2))}/cart`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'action=clear'
    })
    .then(response => {
        hideLoading();
        if (response.ok) {
            location.reload();
        } else {
            showToast('error', 'Failed to clear cart');
        }
    })
    .catch(error => {
        hideLoading();
        showToast('error', 'An error occurred');
    });
}
</script>

