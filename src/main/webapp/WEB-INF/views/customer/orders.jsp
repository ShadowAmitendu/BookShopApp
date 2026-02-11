<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="My Orders - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-6xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-receipt mr-3"></i>My Orders
            </h1>
            <p class="text-gray-600 text-lg">Track your order history and status</p>
        </div>

        <c:choose>
            <c:when test="${not empty orders and orders.size() > 0}">
                <div class="space-y-6">
                    <c:forEach var="order" items="${orders}">
                        <div class="bg-white border-4 border-black flat-shadow p-6">
                            <!-- Order Header -->
                            <div class="flex justify-between items-start mb-4">
                                <div>
                                    <h3 class="text-xl font-black uppercase">Order #${order.id}</h3>
                                    <p class="text-gray-600">
                                        <i class="fas fa-calendar mr-1"></i>
                                            ${order.orderDate.format(java.time.format.DateTimeFormatter.ofPattern("MMM dd, yyyy 'at' hh:mm a"))}
                                    </p>
                                </div>
                                <div class="text-right">
                                    <span class="inline-block px-3 py-1 font-bold border-2 border-black
                                        ${order.status == 'DELIVERED' ? 'bg-green-200 text-green-800' :
                                          order.status == 'SHIPPED' ? 'bg-blue-200 text-blue-800' :
                                          order.status == 'PENDING' ? 'bg-yellow-200 text-yellow-800' :
                                          'bg-red-200 text-red-800'}">
                                            ${order.status}
                                    </span>
                                    <p class="text-2xl font-black text-blue-600 mt-2">₹${order.totalAmount}</p>
                                </div>
                            </div>

                            <!-- Order Details -->
                            <div class="border-t-2 border-gray-200 pt-4">
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <h4 class="font-bold uppercase mb-2">Shipping Address</h4>
                                        <p class="text-gray-700">${order.shippingAddress}</p>
                                    </div>
                                    <div>
                                        <h4 class="font-bold uppercase mb-2">Payment Method</h4>
                                        <p class="text-gray-700">${order.paymentMethod}</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Order Actions -->
                            <div class="border-t-2 border-gray-200 pt-4 mt-4 flex justify-between items-center">
                                <div class="flex space-x-3">
                                    <button onclick="viewOrderDetails(${order.id})"
                                            class="bg-blue-500 text-white px-4 py-2 font-bold border-2 border-black hover:bg-blue-600 transition-colors">
                                        <i class="fas fa-eye mr-1"></i>View Details
                                    </button>

                                    <c:if test="${order.status == 'PENDING'}">
                                        <form action="${pageContext.request.contextPath}/orders" method="post"
                                              class="inline">
                                            <input type="hidden" name="action" value="cancel">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <button type="submit"
                                                    onclick="return confirm('Cancel this order?')"
                                                    class="bg-red-500 text-white px-4 py-2 font-bold border-2 border-black hover:bg-red-600 transition-colors">
                                                <i class="fas fa-times mr-1"></i>Cancel Order
                                            </button>
                                        </form>
                                    </c:if>
                                </div>

                                <div class="text-sm text-gray-600">
                                    <c:choose>
                                        <c:when test="${order.status == 'PENDING'}">
                                            <i class="fas fa-clock text-yellow-600 mr-1"></i>Processing your order
                                        </c:when>
                                        <c:when test="${order.status == 'CONFIRMED'}">
                                            <i class="fas fa-check text-blue-600 mr-1"></i>Order confirmed
                                        </c:when>
                                        <c:when test="${order.status == 'SHIPPED'}">
                                            <i class="fas fa-truck text-blue-600 mr-1"></i>Out for delivery
                                        </c:when>
                                        <c:when test="${order.status == 'DELIVERED'}">
                                            <i class="fas fa-check-circle text-green-600 mr-1"></i>Delivered
                                        </c:when>
                                        <c:when test="${order.status == 'CANCELLED'}">
                                            <i class="fas fa-times-circle text-red-600 mr-1"></i>Order cancelled
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <!-- No Orders -->
                <div class="bg-blue-50 border-4 border-blue-600 p-12 text-center">
                    <i class="fas fa-shopping-bag text-6xl text-blue-600 mb-4"></i>
                    <h3 class="text-2xl font-black uppercase mb-2">No Orders Yet</h3>
                    <p class="text-gray-600 mb-6">You haven't placed any orders yet. Start shopping!</p>
                    <a href="${pageContext.request.contextPath}/books"
                       class="inline-block bg-black text-white px-8 py-4 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                        <i class="fas fa-book mr-2"></i>Browse Books
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

<script>
    function viewOrderDetails(orderId) {
        // For now, just show a message. In production, this would open a modal or redirect to order details page
        showToast('info', 'Order details for #' + orderId + ' (Feature coming soon!)');
    }
</script>

