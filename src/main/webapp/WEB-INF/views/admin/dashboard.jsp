<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Admin Dashboard - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-7xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-tachometer-alt mr-3"></i>Admin Dashboard
            </h1>
            <p class="text-gray-600 text-lg">System overview and management</p>
        </div>

        <!-- Statistics Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-green-600 mb-2">₹${revenue}</div>
                <div class="text-sm font-bold uppercase">Total Revenue</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-blue-600 mb-2">${activeUsers}</div>
                <div class="text-sm font-bold uppercase">Active Users</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-purple-600 mb-2">${booksListed}</div>
                <div class="text-sm font-bold uppercase">Books Listed</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-4xl font-black text-yellow-600 mb-2">${pendingApprovals}</div>
                <div class="text-sm font-bold uppercase">Pending Approvals</div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-8">
            <!-- User Management -->
            <div class="bg-white border-4 border-black flat-shadow p-6">
                <h3 class="text-xl font-black uppercase mb-4">
                    <i class="fas fa-users mr-2"></i>User Management
                </h3>
                <div class="space-y-3">
                    <a href="${pageContext.request.contextPath}/admin/manage-users"
                       class="block bg-blue-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-blue-600 transition-colors">
                        <i class="fas fa-user-cog mr-2"></i>Manage Users
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/approve-sellers"
                       class="block bg-green-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-green-600 transition-colors">
                        <i class="fas fa-check-circle mr-2"></i>Approve Sellers
                    </a>
                </div>
            </div>

            <!-- Content Management -->
            <div class="bg-white border-4 border-black flat-shadow p-6">
                <h3 class="text-xl font-black uppercase mb-4">
                    <i class="fas fa-book mr-2"></i>Content Management
                </h3>
                <div class="space-y-3">
                    <a href="${pageContext.request.contextPath}/admin/books"
                       class="block bg-purple-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-purple-600 transition-colors">
                        <i class="fas fa-book-open mr-2"></i>Manage Books
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/categories"
                       class="block bg-orange-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-orange-600 transition-colors">
                        <i class="fas fa-tags mr-2"></i>Manage Categories
                    </a>
                </div>
            </div>

            <!-- System Management -->
            <div class="bg-white border-4 border-black flat-shadow p-6">
                <h3 class="text-xl font-black uppercase mb-4">
                    <i class="fas fa-cogs mr-2"></i>System Management
                </h3>
                <div class="space-y-3">
                    <a href="${pageContext.request.contextPath}/admin/reports"
                       class="block bg-red-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-red-600 transition-colors">
                        <i class="fas fa-chart-bar mr-2"></i>View Reports
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/settings"
                       class="block bg-gray-700 text-white px-4 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors">
                        <i class="fas fa-sliders-h mr-2"></i>System Settings
                    </a>
                </div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="bg-white border-4 border-black flat-shadow p-6">
            <h2 class="text-2xl font-black uppercase mb-6">
                <i class="fas fa-history mr-2"></i>Recent Activity
            </h2>

            <div class="space-y-4">
                <!-- Mock activity items -->
                <div class="flex items-center space-x-4 p-4 bg-gray-50 border-2 border-gray-200">
                    <div class="w-10 h-10 bg-blue-500 rounded-full flex items-center justify-center">
                        <i class="fas fa-user-plus text-white"></i>
                    </div>
                    <div class="flex-1">
                        <p class="font-bold">New user registered</p>
                        <p class="text-sm text-gray-600">Alice Reader joined BookShelf</p>
                    </div>
                    <div class="text-sm text-gray-500">2 hours ago</div>
                </div>

                <div class="flex items-center space-x-4 p-4 bg-gray-50 border-2 border-gray-200">
                    <div class="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center">
                        <i class="fas fa-book text-white"></i>
                    </div>
                    <div class="flex-1">
                        <p class="font-bold">New book added</p>
                        <p class="text-sm text-gray-600">Clean Code added to catalog</p>
                    </div>
                    <div class="text-sm text-gray-500">4 hours ago</div>
                </div>

                <div class="flex items-center space-x-4 p-4 bg-gray-50 border-2 border-gray-200">
                    <div class="w-10 h-10 bg-yellow-500 rounded-full flex items-center justify-center">
                        <i class="fas fa-shopping-cart text-white"></i>
                    </div>
                    <div class="flex-1">
                        <p class="font-bold">Order placed</p>
                        <p class="text-sm text-gray-600">Order #1234 for ₹450</p>
                    </div>
                    <div class="text-sm text-gray-500">6 hours ago</div>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

