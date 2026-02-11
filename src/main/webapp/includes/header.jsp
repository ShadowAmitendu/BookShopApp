<%-- 
    Document   : header
    Created on : 11 Feb 2026, 7:47:44 am
    Author     : amite
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script src="https://cdn.tailwindcss.com"></script>

<nav class="bg-white border-b-4 border-black sticky top-0 z-[100]">
    <div class="max-w-7xl mx-auto px-6">
        <div class="flex justify-between items-center h-20">

            <div class="flex items-center">
                <a href="${pageContext.request.contextPath}/" 
                   class="text-black text-3xl font-black tracking-tighter uppercase italic">
                    Book<span class="text-blue-600">Shelf.</span>
                </a>
            </div>

            <div class="hidden md:flex items-center space-x-10">

                <a href="${pageContext.request.contextPath}/books"
                   class="font-bold uppercase text-sm tracking-widest hover:text-blue-600 transition-colors">
                    Books
                </a>

                <a href="${pageContext.request.contextPath}/addToCart"
                   class="font-bold uppercase text-sm tracking-widest hover:text-blue-600 transition-colors flex items-center">
                    Cart
                    <span class="ml-2 bg-yellow-300 border-2 border-black px-1.5 py-0.5 text-[10px] leading-none">0</span>
                </a>

                <a href="${pageContext.request.contextPath}/myOrders"
                   class="font-bold uppercase text-sm tracking-widest hover:text-blue-600 transition-colors">
                    Orders
                </a>

                <div class="h-8 w-[2px] bg-black"></div>

                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/profile" 
                           class="bg-pink-400 border-2 border-black px-5 py-2 font-bold uppercase text-xs shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-[2px] hover:translate-y-[2px] transition-all">
                            Account
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login"
                           class="font-bold uppercase text-sm tracking-widest hover:underline decoration-4 decoration-blue-600 underline-offset-8">
                            Login
                        </a>

                        <a href="${pageContext.request.contextPath}/signup"
                           class="bg-blue-600 text-white border-2 border-black px-6 py-2 font-bold uppercase text-xs shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-[2px] hover:translate-y-[2px] transition-all">
                            Sign up
                        </a>
                    </c:otherwise>
                </c:choose>

            </div>

            <div class="md:hidden">
                <button class="border-2 border-black p-2 bg-yellow-300">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="square" stroke-linejoin="round" stroke-width="3" d="M4 6h16M4 12h16m-7 6h7"></path>
                    </svg>
                </button>
            </div>

        </div>
    </div>
</nav>