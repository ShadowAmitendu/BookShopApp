<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Your Cart | BookShelf</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-7xl mx-auto px-6 py-12 w-full flex-grow">

            <div class="mb-10">
                <h1 class="text-5xl font-black uppercase tracking-tighter">Your <span class="text-blue-600">Cart.</span></h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Review your items before checkout</p>
            </div>

            <c:choose>
                <c:when test="${not empty cartItems}">
                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-12">

                        <div class="lg:col-span-2 space-y-6">
                            <c:forEach var="item" items="${cartItems}">
                                <div class="bg-white border-4 border-black p-6 flex flex-col md:flex-row items-center gap-6 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
                                    <div class="w-24 h-32 bg-gray-100 border-2 border-black flex-shrink-0">
                                        <img src="${item.book.imageUrl}" alt="Cover" class="w-full h-full object-cover">
                                    </div>

                                    <div class="flex-grow text-center md:text-left">
                                        <h3 class="text-2xl font-black uppercase tracking-tight">${item.book.title}</h3>
                                        <p class="text-gray-500 font-bold italic mb-4">by ${item.book.author}</p>

                                        <div class="flex items-center justify-center md:justify-start gap-4">
                                            <form action="cart" method="POST" class="flex items-center border-2 border-black">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="bookId" value="${item.book.id}">
                                                <button name="delta" value="-1" class="px-3 py-1 bg-gray-100 hover:bg-black hover:text-white transition-colors font-black border-r-2 border-black">-</button>
                                                <span class="px-4 font-black text-lg">${item.quantity}</span>
                                                <button name="delta" value="1" class="px-3 py-1 bg-gray-100 hover:bg-black hover:text-white transition-colors font-black border-l-2 border-black">+</button>
                                            </form>

                                            <form action="cart" method="POST">
                                                <input type="hidden" name="action" value="remove">
                                                <input type="hidden" name="bookId" value="${item.book.id}">
                                                <button type="submit" class="text-xs font-black uppercase text-red-600 underline decoration-2 underline-offset-4 hover:text-black">Remove</button>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="text-right">
                                        <p class="text-2xl font-black text-blue-600">$${item.book.price * item.quantity}</p>
                                        <p class="text-[10px] font-bold text-gray-400 uppercase">$${item.book.price} each</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="lg:col-span-1">
                            <div class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)] sticky top-24">
                                <h2 class="text-3xl font-black uppercase tracking-tighter mb-6 border-b-4 border-black pb-2">Summary.</h2>

                                <div class="space-y-4 mb-8">
                                    <div class="flex justify-between font-bold uppercase text-sm">
                                        <span>Subtotal</span>
                                        <span>$${cartTotal}</span>
                                    </div>
                                    <div class="flex justify-between font-bold uppercase text-sm">
                                        <span>Shipping</span>
                                        <span class="text-green-600 italic">FREE</span>
                                    </div>
                                    <div class="flex justify-between font-bold uppercase text-sm">
                                        <span>Tax (Mock)</span>
                                        <span>$0.00</span>
                                    </div>
                                    <div class="border-t-2 border-black pt-4 flex justify-between">
                                        <span class="text-xl font-black uppercase">Total</span>
                                        <span class="text-3xl font-black text-blue-600">$${cartTotal}</span>
                                    </div>
                                </div>

                                <form action="${pageContext.request.contextPath}/order" method="POST">
                                    <button type="submit" 
                                            class="w-full bg-black text-white py-5 border-2 border-black font-black uppercase text-lg shadow-[4px_4px_0px_0px_rgba(59,130,246,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                                        Proceed to Checkout
                                    </button>
                                </form>

                                <p class="mt-6 text-[10px] font-bold text-gray-400 uppercase text-center">
                                    Secure Payment Powered by Oracle DB
                                </p>
                            </div>
                        </div>

                    </div>
                </c:when>

                <c:otherwise>
                    <div class="bg-white border-4 border-dashed border-black p-20 text-center">
                        <div class="text-6xl mb-6 opacity-30">🛒</div>
                        <h2 class="text-3xl font-black uppercase tracking-tighter mb-4">Your cart is empty.</h2>
                        <p class="text-gray-500 font-bold mb-8 uppercase tracking-widest">Go find some literary treasures!</p>
                        <a href="${pageContext.request.contextPath}/books" 
                           class="bg-blue-600 text-white px-10 py-4 border-2 border-black font-black uppercase hover:bg-black transition-all shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
                            Browse Catalog
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>

        <jsp:include page="/includes/footer.jsp" />
    </body>
</html>