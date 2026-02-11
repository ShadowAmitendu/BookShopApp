<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="404 - Page Not Found - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-2xl w-full text-center">
        <div class="bg-white border-4 border-black flat-shadow p-12">
            <!-- 404 Icon -->
            <div class="mb-8">
                <div class="w-32 h-32 bg-yellow-300 border-4 border-black rounded-full mx-auto mb-6 flex items-center justify-center transform rotate-12">
                    <i class="fas fa-book-dead text-6xl text-black"></i>
                </div>
                <h1 class="text-8xl font-black uppercase mb-4">404</h1>
                <h2 class="text-3xl font-black uppercase mb-4">Page Not Found</h2>
                <p class="text-gray-600 text-lg mb-8">
                    The page you're looking for seems to have gone missing from our bookshelf.
                </p>
            </div>

            <!-- Help Text -->
            <div class="bg-blue-50 border-4 border-blue-600 p-6 mb-8">
                <p class="font-bold mb-2">What happened?</p>
                <p class="text-sm text-gray-700">
                    The page you requested doesn't exist or may have been moved.
                    Please check the URL or use the navigation menu.
                </p>
            </div>

            <!-- Action Buttons -->
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <a href="${pageContext.request.contextPath}/"
                   class="bg-black text-white px-8 py-4 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                    <i class="fas fa-home mr-2"></i>Go Home
                </a>
                <a href="${pageContext.request.contextPath}/books"
                   class="bg-blue-600 text-white px-8 py-4 font-bold border-2 border-black hover:bg-blue-700 transition-colors uppercase">
                    <i class="fas fa-book mr-2"></i>Browse Books
                </a>
                <button onclick="history.back()"
                        class="bg-white text-black px-8 py-4 font-bold border-2 border-black hover:bg-gray-100 transition-colors uppercase">
                    <i class="fas fa-arrow-left mr-2"></i>Go Back
                </button>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

