<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Seller Profile - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-5xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-store mr-3"></i>Seller Profile
            </h1>
            <p class="text-gray-600 text-lg">Manage your seller account</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Seller Info Card -->
            <div class="lg:col-span-1">
                <div class="bg-white border-4 border-black flat-shadow p-6 sticky top-4">
                    <div class="text-center mb-6">
                        <div class="w-20 h-20 bg-green-500 border-4 border-black rounded-full mx-auto mb-4 flex items-center justify-center">
                            <i class="fas fa-store text-3xl text-white"></i>
                        </div>
                        <h3 class="text-2xl font-black uppercase">${seller.name}</h3>
                        <p class="text-gray-600 text-sm">${seller.email}</p>
                    </div>

                    <!-- Seller Stats -->
                    <div class="space-y-3 border-t-2 border-gray-200 pt-4">
                        <div>
                            <p class="text-xs font-bold uppercase text-gray-600">Rating</p>
                            <p class="text-2xl font-black text-yellow-500">4.8 ★</p>
                        </div>
                        <div>
                            <p class="text-xs font-bold uppercase text-gray-600">Total Sales</p>
                            <p class="text-2xl font-black">127</p>
                        </div>
                        <div>
                            <p class="text-xs font-bold uppercase text-gray-600">Active Books</p>
                            <p class="text-2xl font-black">${inventory.size()}</p>
                        </div>
                    </div>

                    <!-- Quick Actions -->
                    <div class="mt-6 space-y-2">
                        <a href="${pageContext.request.contextPath}/seller/add-book"
                           class="block w-full bg-black text-white px-4 py-3 font-bold border-2 border-black text-center hover:bg-gray-800 transition-colors uppercase">
                            <i class="fas fa-plus mr-2"></i>Add Book
                        </a>
                        <a href="${pageContext.request.contextPath}/seller/inventory"
                           class="block w-full bg-blue-600 text-white px-4 py-3 font-bold border-2 border-black text-center hover:bg-blue-700 transition-colors uppercase">
                            <i class="fas fa-box mr-2"></i>Inventory
                        </a>
                        <a href="${pageContext.request.contextPath}/seller/orders"
                           class="block w-full bg-purple-600 text-white px-4 py-3 font-bold border-2 border-black text-center hover:bg-purple-700 transition-colors uppercase">
                            <i class="fas fa-shopping-bag mr-2"></i>Orders
                        </a>
                    </div>
                </div>
            </div>

            <!-- Profile Forms -->
            <div class="lg:col-span-2 space-y-6">
                <!-- Update Profile -->
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h2 class="text-2xl font-black uppercase mb-6">
                        <i class="fas fa-edit mr-2"></i>Update Profile
                    </h2>

                    <form action="${pageContext.request.contextPath}/seller/inventory" method="post">
                        <input type="hidden" name="action" value="updateProfile">

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                            <div>
                                <label for="name" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Store Name
                                </label>
                                <input type="text"
                                       id="name"
                                       name="name"
                                       value="${seller.name}"
                                       required
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                            </div>

                            <div>
                                <label for="email" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Email Address
                                </label>
                                <input type="email"
                                       id="email"
                                       name="email"
                                       value="${seller.email}"
                                       required
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                                       readonly>
                                <p class="text-xs text-gray-600 mt-1">Email cannot be changed</p>
                            </div>

                            <div>
                                <label for="phone" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Phone Number
                                </label>
                                <input type="tel"
                                       id="phone"
                                       name="phone"
                                       value="${seller.phoneNumber}"
                                       pattern="[0-9]{10}"
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                            </div>

                            <div>
                                <label for="address" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Business Address
                                </label>
                                <input type="text"
                                       id="address"
                                       name="address"
                                       value="${seller.address}"
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                            </div>
                        </div>

                        <button type="submit"
                                class="bg-black text-white px-6 py-3 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                            <i class="fas fa-save mr-2"></i>Update Profile
                        </button>
                    </form>
                </div>

                <!-- Business Info -->
                <div class="bg-blue-50 border-4 border-blue-600 flat-shadow p-6">
                    <h2 class="text-2xl font-black uppercase mb-4">
                        <i class="fas fa-chart-line mr-2"></i>Business Statistics
                    </h2>

                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <div class="text-center">
                            <p class="text-3xl font-black text-blue-600">127</p>
                            <p class="text-xs font-bold uppercase text-gray-600 mt-1">Total Sales</p>
                        </div>
                        <div class="text-center">
                            <p class="text-3xl font-black text-green-600">₹45,890</p>
                            <p class="text-xs font-bold uppercase text-gray-600 mt-1">Total Revenue</p>
                        </div>
                        <div class="text-center">
                            <p class="text-3xl font-black text-yellow-600">4.8★</p>
                            <p class="text-xs font-bold uppercase text-gray-600 mt-1">Average Rating</p>
                        </div>
                        <div class="text-center">
                            <p class="text-3xl font-black text-purple-600">98%</p>
                            <p class="text-xs font-bold uppercase text-gray-600 mt-1">Positive Feedback</p>
                        </div>
                    </div>
                </div>

                <!-- Active Listings -->
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h2 class="text-2xl font-black uppercase mb-4">
                        <i class="fas fa-list mr-2"></i>Recent Books Listed
                    </h2>

                    <c:choose>
                        <c:when test="${not empty inventory and inventory.size() > 0}">
                            <div class="space-y-3">
                                <c:forEach var="item" items="${inventory}" begin="0" end="4">
                                    <div class="flex justify-between items-center p-3 bg-gray-50 border-2 border-gray-200">
                                        <div>
                                            <p class="font-bold">Book #${item.bookId}</p>
                                            <p class="text-sm text-gray-600">₹${item.sellerPrice}</p>
                                        </div>
                                        <div class="text-right">
                                            <p class="text-sm font-bold">${item.quantity} in stock</p>
                                            <span class="text-xs px-2 py-1 bg-green-200 text-green-800 font-bold">${item.status}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <a href="${pageContext.request.contextPath}/seller/inventory"
                               class="block mt-4 text-blue-600 hover:text-blue-800 font-bold">
                                View all inventory →
                            </a>
                        </c:when>
                        <c:otherwise>
                            <p class="text-gray-600">No books listed yet. <a href="${pageContext.request.contextPath}/seller/add-book" class="text-blue-600 font-bold">Add your first book</a></p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

