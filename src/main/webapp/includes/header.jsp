<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<header class="bg-white border-b-4 border-black sticky top-0 z-50">
    <nav class="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between gap-4">

        <a href="${pageContext.request.contextPath}/" class="text-2xl font-black uppercase tracking-tighter hover:text-blue-600 transition-colors flex-shrink-0">
            Book<span class="text-blue-600">Shelf.</span>
        </a>

        <form action="${pageContext.request.contextPath}/search" method="GET" class="hidden lg:flex items-center border-4 border-black bg-white flex-grow max-w-md mx-4">
            <input type="text" name="query" placeholder="Search by title or author..." 
                   class="w-full p-2 outline-none font-bold text-xs uppercase placeholder-gray-400"
                   value="${searchQuery}">
            <button type="submit" class="bg-black text-white px-4 py-2 font-black uppercase text-[10px] hover:bg-blue-600 transition-colors border-l-4 border-black">
                Find
            </button>
        </form>

        <div class="hidden md:flex items-center gap-6 font-black uppercase text-xs tracking-widest flex-shrink-0">
            <a href="${pageContext.request.contextPath}/books" class="hover:underline decoration-2 underline-offset-4">Catalog</a>

            <c:choose>
                <c:when test="${sessionScope.user.role == 'ADMIN'}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-purple-600">Dashboard</a>
                </c:when>

                <c:when test="${sessionScope.user.role == 'SELLER'}">
                    <a href="${pageContext.request.contextPath}/seller/inventory" class="text-pink-600">Inventory</a>
                </c:when>

                <c:when test="${sessionScope.user.role == 'CUSTOMER'}">
                    <a href="${pageContext.request.contextPath}/cart" class="bg-yellow-300 border-2 border-black px-3 py-1 flex items-center gap-2 shadow-[2px_2px_0px_0px_rgba(0,0,0,1)]">
                        Cart 🛒
                    </a>
                </c:when>
            </c:choose>
        </div>

        <div class="flex items-center gap-4 flex-shrink-0">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <div class="flex items-center gap-4">
                        <a href="${pageContext.request.contextPath}/profile" class="font-black text-[10px] uppercase border-b-2 border-black italic">
                            ${sessionScope.user.name}
                        </a>
                        <a href="${pageContext.request.contextPath}/logout" 
                           class="bg-black text-white px-4 py-2 text-[10px] font-black uppercase border-2 border-black hover:bg-red-500 transition-all shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1">
                            Logout
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="font-black uppercase text-xs hover:text-blue-600">Login</a>
                    <a href="${pageContext.request.contextPath}/signup" 
                       class="bg-blue-600 text-white px-6 py-2 font-black uppercase text-xs border-2 border-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                        Join
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</header>