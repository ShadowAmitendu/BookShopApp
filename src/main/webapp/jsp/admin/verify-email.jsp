<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify Email | BookShelf</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
                font-family: 'Space Grotesk', sans-serif;
            }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="flex-grow flex items-center justify-center px-6 py-20">
            <div class="max-w-md w-full">

                <div class="bg-white border-4 border-black p-10 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)] relative overflow-hidden">

                    <div class="absolute -top-4 -right-4 w-20 h-20 bg-pink-400 border-4 border-black rotate-12 flex items-center justify-center">
                        <span class="text-xs font-black uppercase tracking-tighter -rotate-12">Valid</span>
                    </div>

                    <div class="mb-8">
                        <div class="w-16 h-16 bg-blue-600 border-4 border-black mb-6 flex items-center justify-center shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="square" stroke-linejoin="round" stroke-width="3" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                        <h1 class="text-4xl font-black uppercase tracking-tighter">Check your <br/><span class="text-blue-600">Inbox.</span></h1>
                        <p class="text-gray-500 font-bold uppercase text-[10px] mt-2 tracking-[0.2em]">We've sent a verification link to:</p>
                        <p class="text-black font-black text-sm mt-1 border-b-2 border-yellow-300 inline-block">
                            ${not empty param.email ? param.email : 'your-email@example.com'}
                        </p>
                    </div>

                    <div class="space-y-6">
                        <p class="text-sm font-bold text-gray-600 leading-relaxed">
                            Click the link in the email to activate your account. If you don't see it, check your <span class="bg-yellow-200 px-1">spam folder</span>.
                        </p>

                        <form action="${pageContext.request.contextPath}/verify-email" method="POST">
                            <input type="hidden" name="email" value="${param.email}">
                            <button type="submit" 
                                    class="w-full bg-black text-white font-black uppercase py-4 border-2 border-black hover:bg-blue-600 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-y-1 transition-all">
                                Resend Verification Link
                            </button>
                        </form>
                    </div>

                    <div class="mt-8 pt-6 border-t-2 border-gray-100 text-center">
                        <a href="${pageContext.request.contextPath}/signup" class="text-xs font-black uppercase tracking-widest hover:text-blue-600 transition-colors">
                            ← Wrong email? Sign up again
                        </a>
                    </div>
                </div>

                <div class="mt-6 flex items-center gap-3 bg-white border-2 border-black p-3 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                    <span class="text-xl">🛡️</span>
                    <p class="text-[10px] font-bold uppercase text-gray-500 leading-tight">
                        Links expire in 24 hours for your security.
                    </p>
                </div>

            </div>
        </main>

        <jsp:include page="/includes/footer.jsp" />

    </body>
</html>