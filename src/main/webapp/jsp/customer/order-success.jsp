<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Success | BookShelf</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="flex-grow flex items-center justify-center px-6 py-20">
            <div class="max-w-2xl w-full text-center">

                <div class="bg-white border-4 border-black p-10 md:p-16 shadow-[16px_16px_0px_0px_rgba(0,0,0,1)] relative overflow-hidden">

                    <div class="absolute top-0 left-0 w-full h-4 bg-green-500 border-b-4 border-black"></div>

                    <div class="w-24 h-24 bg-green-500 border-4 border-black mx-auto mb-8 flex items-center justify-center rotate-3 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                        <svg class="w-12 h-12 text-black" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="square" stroke-linejoin="round" stroke-width="4" d="M5 13l4 4L19 7"></path>
                        </svg>
                    </div>

                    <h1 class="text-5xl md:text-6xl font-black uppercase tracking-tighter mb-4">
                        Order <span class="text-blue-600">Placed!</span>
                    </h1>

                    <p class="text-lg font-bold text-gray-600 mb-8 uppercase tracking-widest">
                        Thank you for your purchase, ${sessionScope.user.name}.
                    </p>

                    <div class="bg-gray-50 border-2 border-black p-6 mb-10 text-left space-y-3">
                        <div class="flex justify-between border-b-2 border-gray-200 pb-2">
                            <span class="text-xs font-black uppercase text-gray-400">Order Number</span>
                            <span class="font-black">#BS-${param.orderId != null ? param.orderId : '99281'}</span>
                        </div>
                        <div class="flex justify-between border-b-2 border-gray-200 pb-2">
                            <span class="text-xs font-black uppercase text-gray-400">Delivery Estimate</span>
                            <span class="font-black text-blue-600">3-5 Business Days</span>
                        </div>
                        <div class="flex justify-between">
                            <span class="text-xs font-black uppercase text-gray-400">Confirmation Sent To</span>
                            <span class="font-black text-xs">${sessionScope.user.email}</span>
                        </div>
                    </div>

                    <div class="flex flex-col sm:flex-row gap-4 justify-center">
                        <a href="${pageContext.request.contextPath}/orders" 
                           class="bg-black text-white px-8 py-4 font-black uppercase border-2 border-black hover:bg-blue-600 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] transition-all">
                            Track Order
                        </a>
                        <a href="${pageContext.request.contextPath}/books" 
                           class="bg-white text-black px-8 py-4 font-black uppercase border-2 border-black hover:bg-gray-100 transition-all">
                            Continue Shopping
                        </a>
                    </div>
                </div>

                <div class="mt-8 inline-block bg-yellow-300 border-2 border-black px-6 py-2 font-black uppercase text-sm -rotate-2 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                    Bonus: 50 Loyalty Points Added! 🎁
                </div>

            </div>
        </main>

        <jsp:include page="/includes/footer.jsp" />

    </body>
</html>