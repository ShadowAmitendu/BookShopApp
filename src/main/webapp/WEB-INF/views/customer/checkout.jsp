<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Checkout - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-6xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-credit-card mr-3"></i>Checkout
            </h1>
            <p class="text-gray-600 text-lg">Complete your order</p>
        </div>

        <form action="${pageContext.request.contextPath}/place-order" method="post">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <!-- Order Details -->
                <div class="space-y-6">
                    <!-- Shipping Information -->
                    <div class="bg-white border-4 border-black flat-shadow p-6">
                        <h2 class="text-2xl font-black uppercase mb-6">
                            <i class="fas fa-truck mr-2"></i>Shipping Information
                        </h2>

                        <div class="space-y-4">
                            <div>
                                <label for="shippingAddress" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Shipping Address *
                                </label>
                                <textarea id="shippingAddress"
                                          name="shippingAddress"
                                          rows="4"
                                          required
                                          placeholder="Enter your complete shipping address"
                                          class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Information -->
                    <div class="bg-white border-4 border-black flat-shadow p-6">
                        <h2 class="text-2xl font-black uppercase mb-6">
                            <i class="fas fa-credit-card mr-2"></i>Payment Method
                        </h2>

                        <div class="space-y-4">
                            <div>
                                <label class="block text-sm font-bold uppercase tracking-wider mb-3">
                                    Select Payment Method *
                                </label>
                                <div class="space-y-2">
                                    <label class="flex items-center">
                                        <input type="radio"
                                               name="paymentMethod"
                                               value="Credit Card"
                                               required
                                               class="w-4 h-4 border-2 border-black">
                                        <span class="ml-3 font-bold">
                                            <i class="fas fa-credit-card mr-2"></i>Credit Card
                                        </span>
                                    </label>
                                    <label class="flex items-center">
                                        <input type="radio"
                                               name="paymentMethod"
                                               value="Debit Card"
                                               class="w-4 h-4 border-2 border-black">
                                        <span class="ml-3 font-bold">
                                            <i class="fas fa-credit-card mr-2"></i>Debit Card
                                        </span>
                                    </label>
                                    <label class="flex items-center">
                                        <input type="radio"
                                               name="paymentMethod"
                                               value="Cash on Delivery"
                                               class="w-4 h-4 border-2 border-black">
                                        <span class="ml-3 font-bold">
                                            <i class="fas fa-money-bill-wave mr-2"></i>Cash on Delivery
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Summary -->
                <div>
                    <div class="bg-white border-4 border-black flat-shadow p-6 sticky top-4">
                        <h2 class="text-2xl font-black uppercase mb-6">Order Summary</h2>

                        <!-- Cart Items -->
                        <div class="space-y-4 mb-6">
                            <c:forEach var="item" items="${cartItems}">
                                <div class="flex items-center space-x-3 border-b border-gray-200 pb-3">
                                    <div class="w-12 h-16 flex-shrink-0">
                                        <img src="${item.bookImageUrl != null ? item.bookImageUrl : 'https://via.placeholder.com/48x64?text=No+Image'}"
                                             alt="${item.bookTitle}"
                                             class="w-full h-full object-cover border border-black">
                                    </div>
                                    <div class="flex-1">
                                        <h4 class="font-bold text-sm line-clamp-2">${item.bookTitle}</h4>
                                        <p class="text-gray-600 text-xs">Qty: ${item.quantity}</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="font-bold">₹${item.subtotal}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Order Totals -->
                        <div class="border-t-2 border-black pt-4 space-y-2">
                            <div class="flex justify-between">
                                <span class="font-bold">Subtotal</span>
                                <span class="font-bold">₹${cartTotal}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="font-bold">Shipping</span>
                                <span class="font-bold text-green-600">FREE</span>
                            </div>
                            <div class="flex justify-between text-xl border-t border-gray-300 pt-2">
                                <span class="font-black">Total</span>
                                <span class="font-black text-blue-600">₹${cartTotal}</span>
                            </div>
                        </div>

                        <!-- Place Order Button -->
                        <div class="mt-8">
                            <button type="submit"
                                    class="w-full bg-black text-white px-6 py-4 text-lg font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                                <i class="fas fa-shopping-bag mr-2"></i>Place Order
                            </button>
                        </div>

                        <!-- Back to Cart -->
                        <div class="mt-4 text-center">
                            <a href="${pageContext.request.contextPath}/cart"
                               class="text-blue-600 hover:text-blue-800 font-bold">
                                <i class="fas fa-arrow-left mr-1"></i>Back to Cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

