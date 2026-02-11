<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Reset Password - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-md w-full">
        <div class="bg-white border-4 border-black p-8 flat-shadow">
            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-black uppercase mb-2">Reset Password</h2>
                <p class="text-gray-600">Enter your new password</p>
            </div>

            <!-- Form -->
            <form action="${pageContext.request.contextPath}/reset-password" method="post">
                <input type="hidden" name="token" value="${param.token}">

                <div class="space-y-6">
                    <!-- New Password -->
                    <div>
                        <label for="newPassword" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            New Password
                        </label>
                        <input type="password"
                               id="newPassword"
                               name="newPassword"
                               required
                               minlength="8"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Enter new password">
                        <p class="text-xs text-gray-600 mt-1">Must be at least 8 characters with letters and numbers</p>
                    </div>

                    <!-- Confirm Password -->
                    <div>
                        <label for="confirmPassword" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Confirm Password
                        </label>
                        <input type="password"
                               id="confirmPassword"
                               name="confirmPassword"
                               required
                               minlength="8"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Confirm new password">
                    </div>

                    <!-- Submit Button -->
                    <button type="submit"
                            class="w-full bg-black text-white px-6 py-4 text-lg font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                        <i class="fas fa-key mr-2"></i>Reset Password
                    </button>
                </div>
            </form>

            <!-- Divider -->
            <div class="my-6 border-t-2 border-gray-300"></div>

            <!-- Links -->
            <div class="text-center">
                <p>
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-blue-600 hover:text-blue-800 font-bold">
                        <i class="fas fa-arrow-left mr-1"></i>Back to Login
                    </a>
                </p>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

<script>
// Password confirmation validation
document.querySelector('form').addEventListener('submit', function(e) {
    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (newPassword !== confirmPassword) {
        e.preventDefault();
        showToast('error', 'Passwords do not match!');
        return false;
    }
});
</script>

