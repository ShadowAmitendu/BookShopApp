<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seller Profile | BookShelf</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-7xl mx-auto px-6 py-12 w-full flex-grow">

            <div class="bg-white border-4 border-black p-8 mb-10 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] flex flex-col md:flex-row justify-between items-center gap-6">
                <div class="flex items-center gap-6">
                    <div class="w-24 h-24 bg-green-400 border-4 border-black flex items-center justify-center shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                        <span class="text-4xl font-black">S</span>
                    </div>
                    <div>
                        <h1 class="text-4xl font-black uppercase tracking-tighter">${sessionScope.user.name}</h1>
                        <p class="text-gray-500 font-bold uppercase text-xs tracking-widest">Verified Book Seller</p>
                        <div class="mt-2 flex gap-2">
                            <span class="bg-yellow-300 border-2 border-black px-2 py-0.5 text-[10px] font-black uppercase">4.9 ★ Rating</span>
                            <span class="bg-blue-300 border-2 border-black px-2 py-0.5 text-[10px] font-black uppercase">128 Sales</span>
                        </div>
                    </div>
                </div>
                <div class="flex gap-4">
                    <a href="${pageContext.request.contextPath}/seller/add-book" class="bg-black text-white px-6 py-3 font-black uppercase text-sm border-2 border-black hover:bg-green-500 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] transition-all">
                        + List New Book
                    </a>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-10">

                <div class="space-y-6">
                    <div class="bg-white border-4 border-black p-6 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
                        <h3 class="font-black uppercase text-lg mb-4 border-b-2 border-black pb-2">Business Stats</h3>
                        <div class="space-y-4">
                            <div class="flex justify-between items-end">
                                <span class="text-xs font-black uppercase text-gray-400">Monthly Earnings</span>
                                <span class="text-xl font-black text-green-600">$4,250.00</span>
                            </div>
                            <div class="flex justify-between items-end">
                                <span class="text-xs font-black uppercase text-gray-400">Active Listings</span>
                                <span class="text-xl font-black text-blue-600">42</span>
                            </div>
                        </div>
                    </div>

                    <div class="bg-pink-400 border-4 border-black p-6 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
                        <h3 class="font-black uppercase text-lg mb-2 italic">Seller Tip:</h3>
                        <p class="font-bold text-sm leading-tight">Detailed descriptions and high-quality ISBN data increase sales by up to 30%!</p>
                    </div>
                </div>

                <div class="lg:col-span-2">
                    <div class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">
                        <h2 class="text-3xl font-black uppercase tracking-tighter mb-6">Store <span class="text-green-500">Settings.</span></h2>

                        <form action="${pageContext.request.contextPath}/seller/profile" method="POST" class="space-y-6">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-sm font-black uppercase mb-2">Display Name</label>
                                    <input type="text" name="name" value="${sessionScope.user.name}" 
                                           class="w-full border-2 border-black p-3 focus:bg-green-50 outline-none transition-colors font-bold">
                                </div>
                                <div>
                                    <label class="block text-sm font-black uppercase mb-2">Business Email</label>
                                    <input type="email" value="${sessionScope.user.email}" readonly
                                           class="w-full border-2 border-gray-200 bg-gray-100 p-3 text-gray-400 cursor-not-allowed">
                                </div>
                            </div>

                            <div>
                                <label class="block text-sm font-black uppercase mb-2">Store Description / Bio</label>
                                <textarea name="bio" rows="4" 
                                          class="w-full border-2 border-black p-3 focus:bg-green-50 outline-none transition-colors font-bold"
                                          placeholder="Tell buyers about your collection..."></textarea>
                            </div>

                            <div class="flex items-center gap-4 pt-4 border-t-2 border-gray-100">
                                <button type="submit" 
                                        class="bg-green-500 text-white px-8 py-4 border-2 border-black font-black uppercase hover:bg-black hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-y-1 transition-all">
                                    Update Storefront
                                </button>
                                <a href="${pageContext.request.contextPath}/seller/inventory" class="text-sm font-black uppercase underline decoration-2 underline-offset-4 hover:text-blue-600">
                                    Manage Inventory →
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </main>

        <jsp:include page="/includes/footer.jsp" />
    </body>
</html>