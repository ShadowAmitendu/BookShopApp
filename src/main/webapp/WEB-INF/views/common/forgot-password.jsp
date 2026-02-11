<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | BookShelf</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
    <style>body {
        font-family: 'Space Grotesk', sans-serif;
    }</style>
</head>
<body class="bg-[#F3F4F6] min-h-screen flex flex-col">

<jsp:include page="/includes/header.jsp"/>

<main class="flex-grow flex items-center justify-center px-6 py-20">
    <div class="max-w-md w-full">

        <div class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">
            <div class="mb-8">
                <div class="inline-block bg-yellow-300 border-2 border-black px-3 py-1 mb-4 text-xs font-black uppercase">
                    Account Recovery
                </div>
                <h1 class="text-4xl font-black uppercase tracking-tighter">Lost your <br/><span class="text-blue-600">Key?</span>
                </h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Enter your email and we'll
                    send a reset link.</p>
            </div>

            <%-- Feedback Message (Success/Error) --%>
            <c:if test="${not empty message}">
                <div class="mb-6 bg-blue-100 border-2 border-blue-600 p-4 text-blue-700 font-bold text-sm shadow-[4px_4px_0px_0px_rgba(37,99,235,1)]">
                        ${message}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/forgot-password" method="POST" class="space-y-6">
                <div>
                    <label class="block text-sm font-black uppercase mb-2">Registered Email</label>
                    <input type="email" name="email" required
                           class="w-full border-2 border-black p-4 focus:bg-yellow-50 outline-none transition-colors font-bold"
                           placeholder="yourname@email.com">
                </div>

                <button type="submit"
                        class="w-full bg-black text-white font-black uppercase py-4 border-2 border-black hover:bg-yellow-300 hover:text-black hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-y-1 transition-all">
                    Send Recovery Link
                </button>
            </form>

            <div class="mt-8 pt-6 border-t-2 border-gray-100 text-center">
                <a href="login"
                   class="text-sm font-black uppercase tracking-widest hover:text-blue-600 transition-colors">
                    ← Back to Login
                </a>
            </div>
        </div>

        <div class="mt-6 text-center opacity-50">
            <p class="text-[10px] font-black uppercase tracking-[0.2em]">Check your spam folder if the link doesn't
                arrive!</p>
        </div>

    </div>
</main>

<jsp:include page="/includes/footer.jsp"/>

</body>
</html>