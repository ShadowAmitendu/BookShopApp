<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="BookShelf - Your Online Bookstore"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<!-- Hero Section -->
<main class="flex-grow flex items-center justify-center px-4 py-20">
    <div class="max-w-6xl w-full grid md:grid-cols-2 gap-12 items-center">
        <!-- Text Content -->
        <div class="space-y-8">
            <div class="inline-block bg-yellow-300 border-2 border-black px-4 py-1 font-bold uppercase tracking-widest text-sm">
                Est. 2026
            </div>

            <h1 class="text-6xl md:text-8xl font-black leading-none tracking-tighter text-gray-900">
                READ <br/> <span class="text-blue-600">MORE.</span>
            </h1>

            <p class="text-xl text-gray-700 leading-relaxed border-l-4 border-black pl-4">
                A curated digital library built with <b>Servlet, JSP, and Oracle</b>.
                No fluff, just great books and a seamless experience.
            </p>

            <div class="flex flex-wrap gap-4 pt-4">
                <a href="${pageContext.request.contextPath}/books"
                   class="bg-black text-white px-8 py-4 text-lg font-bold border-2 border-black flat-shadow flat-shadow-hover transition-all inline-block">
                    BROWSE CATALOG
                </a>

                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/login"
                           class="bg-white text-black px-8 py-4 text-lg font-bold border-2 border-black hover:bg-gray-100 transition-colors inline-block">
                            SIGN IN
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/cart"
                           class="bg-yellow-300 text-black px-8 py-4 text-lg font-bold border-2 border-black hover:bg-yellow-400 transition-colors inline-block">
                            VIEW CART
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Visual Element -->
        <div class="hidden md:block relative">
            <div class="w-full aspect-square border-4 border-black bg-blue-600 flat-shadow relative overflow-hidden">
                <div class="absolute inset-0 flex items-center justify-center">
                    <span class="text-[200px] font-black text-white opacity-20 italic">B</span>
                </div>
                <div class="absolute bottom-10 right-10 w-48 h-64 bg-yellow-300 border-4 border-black p-4 flex flex-col justify-between">
                    <div class="space-y-1">
                        <div class="h-2 w-full bg-black opacity-20"></div>
                        <div class="h-2 w-3/4 bg-black opacity-20"></div>
                    </div>
                    <p class="font-bold text-xs uppercase italic text-black">Featured Today</p>
                </div>
            </div>

            <div class="absolute -top-6 -right-6 bg-pink-400 border-2 border-black px-6 py-2 font-black rotate-12 flat-shadow">
                NEW ARRIVALS!
            </div>
        </div>
    </div>
</main>

<!-- Features Section -->
<section class="bg-white border-y-4 border-black py-16">
    <div class="max-w-6xl mx-auto px-4 grid md:grid-cols-3 gap-12 text-center">
        <div class="p-6 border-4 border-black flat-shadow-sm hover:flat-shadow transition-all">
            <div class="text-5xl mb-4">⚡</div>
            <h3 class="text-2xl font-black mb-2 uppercase">Fast Loading</h3>
            <p class="text-gray-600">Built on robust Java Servlets for speed and stability.</p>
        </div>
        <div class="p-6 border-4 border-black flat-shadow-sm hover:flat-shadow transition-all">
            <div class="text-5xl mb-4">🛡️</div>
            <h3 class="text-2xl font-black mb-2 uppercase">Secure Storage</h3>
            <p class="text-gray-600">Powered by Oracle Database for enterprise-grade data safety.</p>
        </div>
        <div class="p-6 border-4 border-black flat-shadow-sm hover:flat-shadow transition-all">
            <div class="text-5xl mb-4">📦</div>
            <h3 class="text-2xl font-black mb-2 uppercase">Track Orders</h3>
            <p class="text-gray-600">Real-time order history and tracking for every customer.</p>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="py-16 bg-gray-100">
    <div class="max-w-6xl mx-auto px-4">
        <h2 class="text-4xl font-black text-center mb-12 uppercase">Browse by Category</h2>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <a href="${pageContext.request.contextPath}/books?category=Fiction"
               class="bg-white border-4 border-black p-6 text-center font-bold hover:bg-yellow-300 transition-colors flat-shadow-sm">
                <i class="fas fa-magic text-3xl mb-2 block"></i>
                FICTION
            </a>
            <a href="${pageContext.request.contextPath}/books?category=Engineering"
               class="bg-white border-4 border-black p-6 text-center font-bold hover:bg-yellow-300 transition-colors flat-shadow-sm">
                <i class="fas fa-cogs text-3xl mb-2 block"></i>
                ENGINEERING
            </a>
            <a href="${pageContext.request.contextPath}/books?category=Self-Help"
               class="bg-white border-4 border-black p-6 text-center font-bold hover:bg-yellow-300 transition-colors flat-shadow-sm">
                <i class="fas fa-brain text-3xl mb-2 block"></i>
                SELF-HELP
            </a>
            <a href="${pageContext.request.contextPath}/books?category=Science"
               class="bg-white border-4 border-black p-6 text-center font-bold hover:bg-yellow-300 transition-colors flat-shadow-sm">
                <i class="fas fa-flask text-3xl mb-2 block"></i>
                SCIENCE
            </a>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/components/footer.jsp"/>


