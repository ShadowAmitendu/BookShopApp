<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<nav class="bg-black border-b-4 border-black">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">
            <!-- Logo & Brand -->
            <div class="flex items-center">
                <a href="${pageContext.request.contextPath}/"
                   class="text-white text-2xl font-black tracking-tight hover:text-yellow-300 transition-colors">
                    <i class="fas fa-book mr-2"></i>BOOKSHELF
                </a>
            </div>

            <!-- Desktop Navigation -->
            <div class="hidden md:flex items-center space-x-1">
                <a href="${pageContext.request.contextPath}/"
                   class="text-white hover:bg-gray-800 px-4 py-2 rounded font-bold text-sm transition-colors">
                    HOME
                </a>
                <a href="${pageContext.request.contextPath}/books"
                   class="text-white hover:bg-gray-800 px-4 py-2 rounded font-bold text-sm transition-colors">
                    BROWSE BOOKS
                </a>
                <a href="${pageContext.request.contextPath}/about"
                   class="text-white hover:bg-gray-800 px-4 py-2 rounded font-bold text-sm transition-colors">
                    ABOUT
                </a>
                <a href="${pageContext.request.contextPath}/contact"
                   class="text-white hover:bg-gray-800 px-4 py-2 rounded font-bold text-sm transition-colors">
                    CONTACT
                </a>
            </div>

            <!-- User Menu -->
            <div class="hidden md:flex items-center space-x-2">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <!-- Logged in user menu -->
                        <div class="relative group">
                            <button class="bg-yellow-300 text-black px-6 py-2 font-bold border-2 border-black hover:bg-yellow-400 transition-colors flex items-center space-x-2">
                                <i class="fas fa-user"></i>
                                <span>${sessionScope.user.name}</span>
                                <i class="fas fa-chevron-down text-xs"></i>
                            </button>
                            <div class="absolute right-0 mt-2 w-56 bg-white border-4 border-black flat-shadow hidden group-hover:block z-50">
                                <c:choose>
                                    <c:when test="${sessionScope.user.role == 'ADMIN'}">
                                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                                           class="block px-4 py-3 text-black hover:bg-yellow-300 font-bold border-b-2 border-black">
                                            <i class="fas fa-tachometer-alt mr-2"></i>DASHBOARD
                                        </a>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role == 'SELLER'}">
                                        <a href="${pageContext.request.contextPath}/seller/inventory"
                                           class="block px-4 py-3 text-black hover:bg-yellow-300 font-bold border-b-2 border-black">
                                            <i class="fas fa-box mr-2"></i>INVENTORY
                                        </a>
                                        <a href="${pageContext.request.contextPath}/seller/orders"
                                           class="block px-4 py-3 text-black hover:bg-yellow-300 font-bold border-b-2 border-black">
                                            <i class="fas fa-shopping-bag mr-2"></i>ORDERS
                                        </a>
                                        <a href="${pageContext.request.contextPath}/seller/profile"
                                           class="block px-4 py-3 text-black hover:bg-yellow-300 font-bold border-b-2 border-black">
                                            <i class="fas fa-user-circle mr-2"></i>PROFILE
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/cart"
                                           class="block px-4 py-3 text-black hover:bg-yellow-300 font-bold border-b-2 border-black">
                                            <i class="fas fa-shopping-cart mr-2"></i>CART
                                        </a>
                                        <a href="${pageContext.request.contextPath}/orders"
                                           class="block px-4 py-3 text-black hover:bg-yellow-300 font-bold border-b-2 border-black">
                                            <i class="fas fa-receipt mr-2"></i>MY ORDERS
                                        </a>
                                        <a href="${pageContext.request.contextPath}/customer/profile"
                                           class="block px-4 py-3 text-black hover:bg-yellow-300 font-bold border-b-2 border-black">
                                            <i class="fas fa-user-circle mr-2"></i>PROFILE
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="${pageContext.request.contextPath}/logout"
                                   class="block px-4 py-3 text-black hover:bg-red-400 font-bold">
                                    <i class="fas fa-sign-out-alt mr-2"></i>LOGOUT
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Not logged in -->
                        <a href="${pageContext.request.contextPath}/login"
                           class="bg-white text-black px-6 py-2 font-bold border-2 border-black hover:bg-gray-100 transition-colors">
                            <i class="fas fa-sign-in-alt mr-2"></i>LOGIN
                        </a>
                        <a href="${pageContext.request.contextPath}/signup"
                           class="bg-yellow-300 text-black px-6 py-2 font-bold border-2 border-black hover:bg-yellow-400 transition-colors">
                            <i class="fas fa-user-plus mr-2"></i>SIGN UP
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Mobile menu button -->
            <div class="md:hidden">
                <button id="mobile-menu-btn" class="text-white p-2">
                    <i class="fas fa-bars text-2xl"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-gray-900 border-t-2 border-gray-700">
        <div class="px-2 pt-2 pb-3 space-y-1">
            <a href="${pageContext.request.contextPath}/" class="text-white block px-3 py-2 font-bold">HOME</a>
            <a href="${pageContext.request.contextPath}/books" class="text-white block px-3 py-2 font-bold">BROWSE
                BOOKS</a>
            <a href="${pageContext.request.contextPath}/about" class="text-white block px-3 py-2 font-bold">ABOUT</a>
            <a href="${pageContext.request.contextPath}/contact"
               class="text-white block px-3 py-2 font-bold">CONTACT</a>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <div class="border-t-2 border-gray-700 mt-2 pt-2">
                        <p class="text-yellow-300 px-3 py-2 font-bold">${sessionScope.user.name}</p>
                        <a href="${pageContext.request.contextPath}/logout"
                           class="text-white block px-3 py-2 font-bold">
                            <i class="fas fa-sign-out-alt mr-2"></i>LOGOUT
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="border-t-2 border-gray-700 mt-2 pt-2">
                        <a href="${pageContext.request.contextPath}/login" class="text-white block px-3 py-2 font-bold">LOGIN</a>
                        <a href="${pageContext.request.contextPath}/signup"
                           class="text-white block px-3 py-2 font-bold">SIGN UP</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<script>
    document.getElementById('mobile-menu-btn')?.addEventListener('click', function () {
        document.getElementById('mobile-menu').classList.toggle('hidden');
    });
</script>

