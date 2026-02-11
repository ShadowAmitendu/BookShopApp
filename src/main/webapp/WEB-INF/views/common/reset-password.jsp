<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Reset Password - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<main class="flex-grow flex items-center justify-center px-6 py-20">
    <div class="max-w-md w-full">

        <div class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">
            <div class="mb-8">
                <h1 class="text-4xl font-black uppercase tracking-tighter">New <br/><span
                        class="text-blue-600">Start.</span></h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Create a strong new
                    password</p>
            </div>

            <%-- Error Message Handling --%>
            <c:if test="${not empty error}">
                <div class="mb-6 bg-red-100 border-2 border-red-600 p-4 text-red-700 font-bold text-sm shadow-[4px_4px_0px_0px_rgba(220,38,38,1)]">
                        ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/reset-password" method="POST" class="space-y-6">
                <input type="hidden" name="token" value="${param.token}">

                <div>
                    <label class="block text-sm font-black uppercase mb-2">New Password</label>
                    <input type="password" name="newPassword" required
                           class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors"
                           placeholder="••••••••">
                </div>

                <div>
                    <label class="block text-sm font-black uppercase mb-2">Confirm New Password</label>
                    <input type="password" name="confirmPassword" required
                           class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors"
                           placeholder="••••••••">
                </div>

                <button type="submit"
                        class="w-full bg-black text-white font-black uppercase py-4 border-2 border-black hover:bg-blue-600 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-y-1 transition-all">
                    Update Password
                </button>
            </form>

            <div class="mt-8 pt-6 border-t-2 border-gray-100 text-center">
                <p class="text-sm font-bold text-gray-400 italic">
                    Secured by BookShelf Authentication
                </p>
            </div>
        </div>

        <div class="mt-8 bg-blue-100 border-2 border-black p-4 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
            <p class="text-xs font-bold leading-tight">
                <span class="font-black uppercase text-blue-600">Pro Tip:</span>
                Use a mix of letters, numbers, and symbols to keep your book collection safe.
            </p>
        </div>

    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
