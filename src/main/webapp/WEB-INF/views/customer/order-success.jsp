<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Order Success - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-4xl mx-auto text-center">
        <!-- Success Icon -->
        <div class="mb-8">
            <div class="w-32 h-32 bg-green-500 border-4 border-black rounded-full mx-auto mb-6 flex items-center justify-center">
                <i class="fas fa-check text-6xl text-white"></i>
            </div>
            <h1 class="text-5xl font-black uppercase mb-4">Order Placed Successfully!</h1>
            <p class="text-xl text-gray-600">Thank you for shopping with BookShelf</p>
        </div>

        <!-- Order Details -->
        <div class="bg-white border-4 border-black flat-shadow p-8 mb-8">
            <h2 class="text-3xl font-black uppercase mb-6">Order Confirmation</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-left">
                <div>
                    <h3 class="text-xl font-bold uppercase mb-3">Order Information</h3>
                    <div class="space-y-2">
                        <p><span class="font-bold">Order ID:</span> #${orderId}</p>
                        <p><span
                                class="font-bold">Date:</span> ${java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern("MMM dd, yyyy 'at' hh:mm a"))}
                        </p>
                        <p><span class="font-bold">Status:</span>
                            <span class="px-2 py-1 bg-yellow-200 text-yellow-800 font-bold border-2 border-black text-xs">
                                PENDING
                            </span>
                        </p>
                    </div>
                </div>

                <div>
                    <h3 class="text-xl font-bold uppercase mb-3">What's Next?</h3>
                    <div class="space-y-2 text-left">
                        <p class="flex items-center">
                            <i class="fas fa-check-circle text-green-600 mr-2"></i>
                            Order confirmation email sent
                        </p>
                        <p class="flex items-center">
                            <i class="fas fa-clock text-yellow-600 mr-2"></i>
                            Processing your order
                        </p>
                        <p class="flex items-center">
                            <i class="fas fa-truck text-blue-600 mr-2"></i>
                            Shipping within 2-3 business days
                        </p>
                        <p class="flex items-center">
                            <i class="fas fa-envelope text-blue-600 mr-2"></i>
                            Tracking information via email
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="${pageContext.request.contextPath}/orders"
               class="bg-black text-white px-8 py-4 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase inline-block">
                <i class="fas fa-receipt mr-2"></i>View My Orders
            </a>

            <a href="${pageContext.request.contextPath}/books"
               class="bg-white text-black px-8 py-4 font-bold border-2 border-black hover:bg-gray-100 transition-colors uppercase inline-block">
                <i class="fas fa-book mr-2"></i>Continue Shopping
            </a>
        </div>

        <!-- Help Section -->
        <div class="mt-12 bg-blue-50 border-4 border-blue-600 p-6">
            <h3 class="text-xl font-black uppercase mb-4">Need Help?</h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                <div>
                    <i class="fas fa-envelope text-blue-600 text-2xl mb-2 block"></i>
                    <p class="font-bold">Email Support</p>
                    <p>support@bookshelf.com</p>
                </div>
                <div>
                    <i class="fas fa-phone text-blue-600 text-2xl mb-2 block"></i>
                    <p class="font-bold">Phone Support</p>
                    <p>1-800-BOOKSHELF</p>
                </div>
                <div>
                    <i class="fas fa-question-circle text-blue-600 text-2xl mb-2 block"></i>
                    <p class="font-bold">FAQ</p>
                    <p>Check our help center</p>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

