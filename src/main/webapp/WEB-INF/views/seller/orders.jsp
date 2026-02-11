<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Seller Orders - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-7xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-shopping-bag mr-3"></i>My Orders
            </h1>
            <p class="text-gray-600 text-lg">Manage orders for your inventory</p>
        </div>

        <!-- Statistics Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-blue-600 mb-2">₹${totalRevenue}</div>
                <div class="text-sm font-bold uppercase">Total Revenue</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-green-600 mb-2">${totalOrders}</div>
                <div class="text-sm font-bold uppercase">Total Orders</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-yellow-600 mb-2">${pendingOrders}</div>
                <div class="text-sm font-bold uppercase">Pending</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-purple-600 mb-2">${shippedOrders}</div>
                <div class="text-sm font-bold uppercase">Shipped</div>
            </div>
        </div>

        <!-- Orders Table -->
        <div class="bg-white border-4 border-black flat-shadow">
            <div class="p-6 border-b-4 border-black">
                <h2 class="text-2xl font-black uppercase">Recent Orders</h2>
            </div>

            <c:choose>
                <c:when test="${not empty sellerOrders and sellerOrders.size() > 0}">
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead class="bg-gray-100">
                                <tr>
                                    <th class="px-6 py-3 text-left font-black uppercase">Order ID</th>
                                    <th class="px-6 py-3 text-left font-black uppercase">Customer</th>
                                    <th class="px-6 py-3 text-left font-black uppercase">Date</th>
                                    <th class="px-6 py-3 text-left font-black uppercase">Amount</th>
                                    <th class="px-6 py-3 text-left font-black uppercase">Status</th>
                                    <th class="px-6 py-3 text-left font-black uppercase">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y-2 divide-gray-200">
                                <c:forEach var="order" items="${sellerOrders}">
                                    <tr>
                                        <td class="px-6 py-4 font-bold">#${order.id}</td>
                                        <td class="px-6 py-4">
                                            <div>
                                                <p class="font-bold">Customer ${order.customerId}</p>
                                                <p class="text-sm text-gray-600">${order.shippingAddress}</p>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4">
                                            ${order.orderDate.format(java.time.format.DateTimeFormatter.ofPattern("MMM dd, yyyy"))}
                                        </td>
                                        <td class="px-6 py-4 font-bold text-blue-600">₹${order.totalAmount}</td>
                                        <td class="px-6 py-4">
                                            <form action="${pageContext.request.contextPath}/seller/orders" method="post" class="inline">
                                                <input type="hidden" name="action" value="updateStatus">
                                                <input type="hidden" name="orderId" value="${order.id}">
                                                <select name="status"
                                                        onchange="this.form.submit()"
                                                        class="px-3 py-1 font-bold border-2 border-black text-sm
                                                            ${order.status == 'PENDING' ? 'bg-yellow-200 text-yellow-800' :
                                                              order.status == 'CONFIRMED' ? 'bg-blue-200 text-blue-800' :
                                                              order.status == 'SHIPPED' ? 'bg-purple-200 text-purple-800' :
                                                              order.status == 'DELIVERED' ? 'bg-green-200 text-green-800' :
                                                              'bg-red-200 text-red-800'}">
                                                    <option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                                    <option value="CONFIRMED" ${order.status == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
                                                    <option value="SHIPPED" ${order.status == 'SHIPPED' ? 'selected' : ''}>Shipped</option>
                                                    <option value="DELIVERED" ${order.status == 'DELIVERED' ? 'selected' : ''}>Delivered</option>
                                                    <option value="CANCELLED" ${order.status == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                                                </select>
                                            </form>
                                        </td>
                                        <td class="px-6 py-4">
                                            <button onclick="viewOrderDetails(${order.id})"
                                                    class="bg-blue-500 text-white px-3 py-1 font-bold border-2 border-black hover:bg-blue-600 transition-colors text-sm">
                                                <i class="fas fa-eye mr-1"></i>Details
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- No Orders -->
                    <div class="p-12 text-center">
                        <i class="fas fa-shopping-bag text-6xl text-gray-400 mb-4"></i>
                        <h3 class="text-2xl font-black uppercase mb-2">No Orders Yet</h3>
                        <p class="text-gray-600 mb-6">Orders for your books will appear here</p>
                        <a href="${pageContext.request.contextPath}/seller/inventory"
                           class="inline-block bg-black text-white px-6 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                            <i class="fas fa-box mr-2"></i>Manage Inventory
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

<script>
function viewOrderDetails(orderId) {
    // For now, just show a message. In production, this would open a modal or redirect to order details page
    showToast('info', 'Order details for #' + orderId + ' (Feature coming soon!)');
}
</script>

