<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Forgot Password - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-md w-full">
        <div class="bg-white border-4 border-black p-8 flat-shadow">
            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-black uppercase mb-2">Forgot Password</h2>
                <p class="text-gray-600">Enter your email to reset your password</p>
            </div>

            <!-- Form -->
            <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                <div class="space-y-6">
                    <!-- Email -->
                    <div>
                        <label for="email" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Email Address
                        </label>
                        <input type="email"
                               id="email"
                               name="email"
                               required
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Enter your email">
                    </div>

                    <!-- Submit Button -->
                    <button type="submit"
                            class="w-full bg-black text-white px-6 py-4 text-lg font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                        <i class="fas fa-paper-plane mr-2"></i>Send Reset Link
                    </button>
                </div>
            </form>

            <!-- Divider -->
            <div class="my-6 border-t-2 border-gray-300"></div>

            <!-- Links -->
            <div class="text-center space-y-3">
                <p>
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-blue-600 hover:text-blue-800 font-bold">
                        <i class="fas fa-arrow-left mr-1"></i>Back to Login
                    </a>
                </p>
                <p class="text-gray-600">
                    Don't have an account?
                    <a href="${pageContext.request.contextPath}/signup"
                       class="text-black font-bold hover:text-blue-600">
                        Sign Up
                    </a>
                </p>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

