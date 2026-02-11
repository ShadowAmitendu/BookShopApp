<%-- 
    Document   : signup
    Created on : 10 Feb 2026, 9:13:51 pm
    Author     : amite
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Create Account - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-md w-full">
        <div class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">
            <div class="mb-8">
                <h1 class="text-4xl font-black uppercase tracking-tighter">Join the <br/><span class="text-pink-500">Club.</span>
                </h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Create your account in
                    seconds</p>
            </div>

            <form action="${pageContext.request.contextPath}/signup" method="POST" class="space-y-5">
                <div>
                    <label class="block text-sm font-black uppercase mb-1">Full Name</label>
                    <input type="text" name="name" required
                           class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors"
                           placeholder="John Doe">
                </div>

                <div>
                    <label class="block text-sm font-black uppercase mb-1">Email Address</label>
                    <input type="email" name="email" required
                           class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors"
                           placeholder="john@example.com">
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-black uppercase mb-1">Password</label>
                        <input type="password" name="password" required
                               class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors"
                               placeholder="••••••••">
                    </div>
                    <div>
                        <label class="block text-sm font-black uppercase mb-1">Role</label>
                        <select name="role"
                                class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors appearance-none bg-white">
                            <option value="CUSTOMER">Customer</option>
                            <option value="SELLER">Seller</option>
                        </select>
                    </div>
                </div>

                <button type="submit"
                        class="w-full bg-black text-white font-black uppercase py-4 border-2 border-black hover:bg-pink-500 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-y-1 transition-all mt-4">
                    Create Account
                </button>
            </form>

            <div class="mt-8 pt-6 border-t-2 border-gray-100 text-center">
                <p class="text-sm font-bold text-gray-600">
                    Already have an account? <a href="login" class="text-blue-600 hover:underline">Log in</a>
                </p>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
