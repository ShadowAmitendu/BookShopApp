<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Verify Email - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-md w-full">
        <div class="bg-white border-4 border-black p-8 flat-shadow">
            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-black uppercase mb-2">Verify Email</h2>
                <p class="text-gray-600">Check your email for verification link</p>
            </div>

            <!-- Info Message -->
            <div class="bg-blue-50 border-2 border-blue-600 p-4 mb-6">
                <div class="flex items-start">
                    <i class="fas fa-envelope text-blue-600 text-2xl mr-3 flex-shrink-0"></i>
                    <div>
                        <h3 class="font-bold text-blue-900 mb-2">Verification Email Sent</h3>
                        <p class="text-blue-800 text-sm">
                            We've sent a verification link to your email address.
                            Please check your inbox and click the link to verify your account.
                        </p>
                    </div>
                </div>
            </div>

            <!-- Resend Form -->
            <form action="${pageContext.request.contextPath}/verify-email" method="post">
                <div class="space-y-4">
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

                    <button type="submit"
                            class="w-full bg-black text-white px-6 py-3 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                        <i class="fas fa-redo mr-2"></i>Resend Verification Email
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
                    Already verified?
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-black font-bold hover:text-blue-600">
                        Login Now
                    </a>
                </p>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

