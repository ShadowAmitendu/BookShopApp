<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile | BookShelf</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-5xl mx-auto px-6 py-16 w-full flex-grow">

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-12">

                <div class="lg:col-span-1">
                    <div class="bg-white border-4 border-black p-6 shadow-[10px_10px_0px_0px_rgba(0,0,0,1)] sticky top-24">
                        <div class="w-full aspect-square bg-blue-600 border-4 border-black mb-6 flex items-center justify-center overflow-hidden relative">
                            <span class="text-white text-[120px] font-black opacity-20 absolute -bottom-8 -right-4 italic">
                                ${sessionScope.user.name.substring(0,1).toUpperCase()}
                            </span>
                            <div class="relative z-10 text-center text-white">
                                <div class="w-20 h-20 bg-yellow-300 border-4 border-black mx-auto mb-2 flex items-center justify-center">
                                    <span class="text-black text-3xl font-black">${sessionScope.user.name.substring(0,1).toUpperCase()}</span>
                                </div>
                            </div>
                        </div>

                        <div class="space-y-1 mb-6">
                            <h2 class="text-2xl font-black uppercase tracking-tighter">${sessionScope.user.name}</h2>
                            <p class="text-gray-500 font-bold text-xs uppercase tracking-widest italic">Reader since 2026</p>
                        </div>

                        <div class="border-t-4 border-black pt-6 flex flex-col gap-3">
                            <a href="${pageContext.request.contextPath}/orders" 
                               class="bg-yellow-300 border-2 border-black py-3 text-center font-black uppercase text-sm hover:bg-black hover:text-white transition-all">
                                Order History
                            </a>
                            <a href="${pageContext.request.contextPath}/logout" 
                               class="border-2 border-black py-3 text-center font-black uppercase text-sm hover:bg-gray-100 transition-all">
                                Sign Out
                            </a>
                        </div>
                    </div>
                </div>

                <div class="lg:col-span-2 space-y-10">

                    <section class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">
                        <h3 class="text-3xl font-black uppercase tracking-tighter mb-6 border-b-4 border-black pb-2 inline-block">
                            Account <span class="text-blue-600">Details.</span>
                        </h3>

                        <form action="${pageContext.request.contextPath}/profile" method="POST" class="space-y-6">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-sm font-black uppercase mb-2">Display Name</label>
                                    <input type="text" name="name" value="${sessionScope.user.name}" 
                                           class="w-full border-2 border-black p-4 focus:bg-blue-50 outline-none transition-colors font-bold">
                                </div>
                                <div>
                                    <label class="block text-sm font-black uppercase mb-2">Email Address</label>
                                    <input type="email" value="${sessionScope.user.email}" readonly
                                           class="w-full border-2 border-gray-200 bg-gray-50 p-4 text-gray-400 font-bold cursor-not-allowed">
                                    <p class="text-[10px] text-gray-400 mt-1 font-bold uppercase">Email cannot be changed</p>
                                </div>
                            </div>

                            <div>
                                <label class="block text-sm font-black uppercase mb-2">Change Password</label>
                                <input type="password" name="newPassword" 
                                       class="w-full border-2 border-black p-4 focus:bg-blue-50 outline-none transition-colors"
                                       placeholder="Leave blank to keep current">
                            </div>

                            <div class="flex justify-between items-center pt-6">
                                <p class="text-xs font-bold text-gray-400 uppercase max-w-xs">Updating your info will require you to re-verify your session.</p>
                                <button type="submit" 
                                        class="bg-blue-600 text-white px-8 py-4 border-2 border-black font-black uppercase hover:bg-black hover:shadow-[4px_4px_0px_0px_rgba(59,130,246,1)] transition-all">
                                    Save Profile
                                </button>
                            </div>
                        </form>
                    </section>

                    <section class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">
                        <h3 class="text-xl font-black uppercase tracking-tight mb-4">Shipping Address</h3>
                        <div class="border-2 border-dashed border-black p-6 text-center">
                            <p class="text-gray-400 font-bold uppercase text-sm mb-4">No address saved yet</p>
                            <button class="bg-black text-white px-4 py-2 text-xs font-black uppercase border-2 border-black hover:bg-blue-600 transition-colors">
                                + Add New Address
                            </button>
                        </div>
                    </section>

                    <div class="border-4 border-red-600 p-6 flex justify-between items-center bg-red-50">
                        <div>
                            <h4 class="text-red-600 font-black uppercase">Close Account</h4>
                            <p class="text-xs font-bold text-red-700">All your data will be permanently removed.</p>
                        </div>
                        <button class="bg-red-600 text-white px-4 py-2 text-xs font-black uppercase border-2 border-black hover:bg-black transition-colors">
                            Delete
                        </button>
                    </div>
                </div>
            </div>

        </main>

        <jsp:include page="/includes/footer.jsp" />
    </body>
</html>