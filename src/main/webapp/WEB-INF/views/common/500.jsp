<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="500 - Server Error - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-2xl w-full text-center">
        <div class="bg-white border-4 border-black flat-shadow p-12">
            <!-- 500 Icon -->
            <div class="mb-8">
                <div class="w-32 h-32 bg-red-500 border-4 border-black rounded-full mx-auto mb-6 flex items-center justify-center">
                    <i class="fas fa-exclamation-triangle text-6xl text-white"></i>
                </div>
                <h1 class="text-8xl font-black uppercase mb-4">500</h1>
                <h2 class="text-3xl font-black uppercase mb-4">Internal Server Error</h2>
                <p class="text-gray-600 text-lg mb-8">
                    Oops! Something went wrong on our end. Our team has been notified.
                </p>
            </div>

            <!-- Error Details (only in development) -->
            <c:if test="${not empty exception}">
                <div class="bg-red-50 border-4 border-red-600 p-6 mb-8 text-left">
                    <p class="font-bold mb-2">Error Details:</p>
                    <p class="text-sm text-red-800 font-mono break-all">
                        ${exception.message}
                    </p>
                </div>
            </c:if>

            <!-- Help Text -->
            <div class="bg-blue-50 border-4 border-blue-600 p-6 mb-8">
                <p class="font-bold mb-2">What can you do?</p>
                <ul class="text-sm text-gray-700 text-left space-y-2">
                    <li>• Try refreshing the page</li>
                    <li>• Go back and try again</li>
                    <li>• Contact support if the problem persists</li>
                </ul>
            </div>

            <!-- Action Buttons -->
            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <a href="${pageContext.request.contextPath}/"
                   class="bg-black text-white px-8 py-4 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                    <i class="fas fa-home mr-2"></i>Go Home
                </a>
                <button onclick="location.reload()"
                        class="bg-blue-600 text-white px-8 py-4 font-bold border-2 border-black hover:bg-blue-700 transition-colors uppercase">
                    <i class="fas fa-sync mr-2"></i>Refresh Page
                </button>
                <button onclick="history.back()"
                        class="bg-white text-black px-8 py-4 font-bold border-2 border-black hover:bg-gray-100 transition-colors uppercase">
                    <i class="fas fa-arrow-left mr-2"></i>Go Back
                </button>
            </div>

            <!-- Support Contact -->
            <div class="mt-8 pt-8 border-t-2 border-gray-200">
                <p class="text-sm text-gray-600">
                    Need help? Contact us at
                    <a href="mailto:support@bookshelf.com" class="text-blue-600 font-bold">support@bookshelf.com</a>
                </p>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

