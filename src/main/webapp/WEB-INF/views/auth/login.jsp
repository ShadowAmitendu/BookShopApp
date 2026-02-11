<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Login - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-md w-full">
        <div class="bg-white border-4 border-black p-8 flat-shadow">
            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-black uppercase mb-2">Login</h2>
                <p class="text-gray-600">Enter your credentials to access your account</p>
            </div>

            <!-- Form -->
            <form action="${pageContext.request.contextPath}/login" method="post">
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

                    <!-- Password -->
                    <div>
                        <label for="password" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Password
                        </label>
                        <input type="password"
                               id="password"
                               name="password"
                               required
                               minlength="8"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Enter your password">
                    </div>

                    <!-- Remember Me -->
                    <div class="flex items-center">
                        <input type="checkbox"
                               id="rememberMe"
                               name="rememberMe"
                               class="w-4 h-4 border-2 border-black">
                        <label for="rememberMe" class="ml-2 text-sm font-bold">
                            Remember me
                        </label>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit"
                            class="w-full bg-black text-white px-6 py-4 text-lg font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                        <i class="fas fa-sign-in-alt mr-2"></i>Login
                    </button>
                </div>
            </form>

            <!-- Divider -->
            <div class="my-6 border-t-2 border-gray-300"></div>

            <!-- Links -->
            <div class="space-y-3 text-center">
                <p>
                    <a href="${pageContext.request.contextPath}/forgot-password"
                       class="text-blue-600 hover:text-blue-800 font-bold">
                        <i class="fas fa-question-circle mr-1"></i>Forgot Password?
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

            <!-- Demo Credentials -->
            <div class="mt-6 bg-blue-50 border-2 border-blue-600 p-4">
                <h6 class="font-black uppercase text-sm mb-2">
                    <i class="fas fa-info-circle mr-1"></i>Demo Credentials
                </h6>
                <div class="text-xs space-y-1 text-gray-700">
                    <p><strong>Admin:</strong> admin@bookshelf.com / admin123</p>
                    <p><strong>Seller:</strong> seller@bookshelf.com / seller123</p>
                    <p><strong>Customer:</strong> customer@bookshelf.com / customer123</p>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

