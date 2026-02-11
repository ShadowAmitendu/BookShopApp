<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Seller Dashboard - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-7xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-store mr-3"></i>Seller Dashboard
            </h1>
            <p class="text-gray-600 text-lg">Welcome back, ${seller.name}!</p>
        </div>

        <!-- Statistics Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-green-600 mb-2">₹${totalRevenue}</div>
                <div class="text-sm font-bold uppercase">Total Revenue</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-blue-600 mb-2">${totalOrders}</div>
                <div class="text-sm font-bold uppercase">Total Orders</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-purple-600 mb-2">${booksListed}</div>
                <div class="text-sm font-bold uppercase">Books Listed</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-yellow-600 mb-2">${pendingOrders}</div>
                <div class="text-sm font-bold uppercase">Pending Orders</div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-8">
            <div class="bg-white border-4 border-black flat-shadow p-6">
                <h3 class="text-xl font-black uppercase mb-4">
                    <i class="fas fa-plus-circle mr-2"></i>Quick Actions
                </h3>
                <div class="space-y-3">
                    <a href="${pageContext.request.contextPath}/seller/add-book"
                       class="block bg-black text-white px-4 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors text-center uppercase">
                        <i class="fas fa-plus mr-2"></i>Add New Book
                    </a>
                    <a href="${pageContext.request.contextPath}/seller/inventory"
                       class="block bg-blue-600 text-white px-4 py-3 font-bold border-2 border-black hover:bg-blue-700 transition-colors text-center uppercase">
                        <i class="fas fa-box mr-2"></i>Manage Inventory
                    </a>
                    <a href="${pageContext.request.contextPath}/seller/orders"
                       class="block bg-green-600 text-white px-4 py-3 font-bold border-2 border-black hover:bg-green-700 transition-colors text-center uppercase">
                        <i class="fas fa-shopping-bag mr-2"></i>View Orders
                    </a>
                </div>
            </div>

            <div class="lg:col-span-2">
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h3 class="text-xl font-black uppercase mb-4">
                        <i class="fas fa-chart-line mr-2"></i>Sales Performance
                    </h3>

                    <div class="grid grid-cols-2 gap-4 mb-6">
                        <div class="text-center p-4 bg-gray-50 border-2 border-gray-200">
                            <p class="text-2xl font-black text-blue-600">₹${monthlyRevenue}</p>
                            <p class="text-xs font-bold uppercase text-gray-600">This Month</p>
                        </div>
                        <div class="text-center p-4 bg-gray-50 border-2 border-gray-200">
                            <p class="text-2xl font-black text-green-600">${monthlyOrders}</p>
                            <p class="text-xs font-bold uppercase text-gray-600">Orders</p>
                        </div>
                    </div>

                    <div class="border-t-2 border-gray-200 pt-4">
                        <p class="text-sm font-bold uppercase text-gray-600 mb-2">Top Selling Books</p>
                        <c:choose>
                            <c:when test="${not empty topBooks}">
                                <div class="space-y-2">
                                    <c:forEach var="book" items="${topBooks}" begin="0" end="4">
                                        <div class="flex justify-between items-center p-2 bg-gray-50">
                                            <span class="font-bold text-sm">${book.title}</span>
                                            <span class="text-xs text-gray-600">${book.salesCount} sold</span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p class="text-gray-600">No sales data yet</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Orders -->
        <div class="bg-white border-4 border-black flat-shadow p-6">
            <h3 class="text-xl font-black uppercase mb-4">
                <i class="fas fa-clock mr-2"></i>Recent Orders
            </h3>

            <c:choose>
                <c:when test="${not empty recentOrders}">
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead class="bg-gray-100">
                            <tr>
                                <th class="px-4 py-2 text-left font-black uppercase">Order ID</th>
                                <th class="px-4 py-2 text-left font-black uppercase">Date</th>
                                <th class="px-4 py-2 text-left font-black uppercase">Amount</th>
                                <th class="px-4 py-2 text-left font-black uppercase">Status</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y-2 divide-gray-200">
                            <c:forEach var="order" items="${recentOrders}" begin="0" end="9">
                                <tr>
                                    <td class="px-4 py-2 font-bold">#${order.id}</td>
                                    <td class="px-4 py-2">${order.orderDate}</td>
                                    <td class="px-4 py-2 font-bold text-blue-600">₹${order.totalAmount}</td>
                                    <td class="px-4 py-2">
                                            <span class="px-2 py-1 font-bold border-2 border-black text-xs
                                                ${order.status == 'DELIVERED' ? 'bg-green-200 text-green-800' :
                                                  order.status == 'SHIPPED' ? 'bg-blue-200 text-blue-800' :
                                                  'bg-yellow-200 text-yellow-800'}">
                                                    ${order.status}
                                            </span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <a href="${pageContext.request.contextPath}/seller/orders"
                       class="block mt-4 text-blue-600 hover:text-blue-800 font-bold">
                        View all orders →
                    </a>
                </c:when>
                <c:otherwise>
                    <p class="text-gray-600">No orders yet</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

