<%-- 
    Document   : login
    Created on : 10 Feb 2026, 9:13:46 pm
    Author     : amite
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Bookshelf</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
    <style>body {
        font-family: 'Space Grotesk', sans-serif;
    }</style>
</head>
<body class="bg-[#F3F4F6] min-h-screen flex flex-col">

<jsp:include page="/includes/header.jsp"/>

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-md w-full">
        <div class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">
            <div class="mb-8">
                <h1 class="text-4xl font-black uppercase tracking-tighter">Welcome <br/><span class="text-blue-600">Back.</span>
                </h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Enter your credentials to
                    continue</p>
            </div>

            <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-6">
                <div>
                    <label class="block text-sm font-black uppercase mb-2">Email Address</label>
                    <input type="email" name="email" required
                           class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors"
                           placeholder="name@example.com">
                </div>

                <div>
                    <div class="flex justify-between mb-2">
                        <label class="text-sm font-black uppercase">Password</label>
                        <a href="forgotPassword" class="text-xs font-bold text-blue-600 hover:underline">Forgot?</a>
                    </div>
                    <input type="password" name="password" required
                           class="w-full border-2 border-black p-3 focus:bg-yellow-50 outline-none transition-colors"
                           placeholder="••••••••">
                </div>

                <button type="submit"
                        class="w-full bg-black text-white font-black uppercase py-4 border-2 border-black hover:bg-blue-600 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-y-1 transition-all">
                    Login to Account
                </button>
            </form>

            <div class="mt-8 pt-6 border-t-2 border-gray-100 text-center">
                <p class="text-sm font-bold text-gray-600">
                    New here? <a href="signup" class="text-blue-600 hover:underline">Create an account</a>
                </p>
            </div>
        </div>

        <div class="mt-6 bg-pink-400 border-2 border-black p-3 text-center font-black text-sm uppercase rotate-1">
            Free shipping on all orders over $50! 📚
        </div>
    </div>
</main>

<jsp:include page="/includes/footer.jsp"/>
</body>
</html>
