<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard | BookShelf</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-7xl mx-auto px-6 py-12 w-full flex-grow">

            <div class="mb-12">
                <h1 class="text-6xl font-black uppercase tracking-tighter">System <span class="text-purple-600">Overview.</span></h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Global platform metrics and administrative tools</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
                <div class="bg-white border-4 border-black p-6 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
                    <p class="text-[10px] font-black uppercase text-gray-400">Total Revenue</p>
                    <p class="text-4xl font-black text-green-600">$42,900</p>
                    <div class="mt-2 text-[10px] font-bold text-green-600 uppercase">+12% from last month</div>
                </div>
                <div class="bg-white border-4 border-black p-6 shadow-[8px_8px_0px_0px_rgba(147,51,234,1)]">
                    <p class="text-[10px] font-black uppercase text-gray-400">Active Users</p>
                    <p class="text-4xl font-black text-purple-600">1,204</p>
                    <div class="mt-2 text-[10px] font-bold text-purple-600 uppercase">890 Customers / 314 Sellers</div>
                </div>
                <div class="bg-white border-4 border-black p-6 shadow-[8px_8px_0px_0px_rgba(59,130,246,1)]">
                    <p class="text-[10px] font-black uppercase text-gray-400">Books Listed</p>
                    <p class="text-4xl font-black text-blue-600">5,672</p>
                    <div class="mt-2 text-[10px] font-bold text-blue-600 uppercase">Across 24 Categories</div>
                </div>
                <div class="bg-yellow-300 border-4 border-black p-6 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
                    <p class="text-[10px] font-black uppercase text-black">Pending Approvals</p>
                    <p class="text-4xl font-black text-black">07</p>
                    <a href="${pageContext.request.contextPath}/admin/approve-seller" class="mt-2 block text-[10px] font-black underline uppercase">Review Now →</a>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

                <div class="lg:col-span-2 space-y-6">
                    <h3 class="text-2xl font-black uppercase tracking-tight italic border-b-4 border-black pb-2 inline-block">Management Tools</h3>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <a href="${pageContext.request.contextPath}/admin/users" class="group bg-white border-4 border-black p-8 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                            <div class="text-4xl mb-4">👥</div>
                            <h4 class="text-xl font-black uppercase">User Management</h4>
                            <p class="text-sm text-gray-500 font-bold mt-2">Edit roles, suspend accounts, and view user logs.</p>
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/inventory" class="group bg-white border-4 border-black p-8 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                            <div class="text-4xl mb-4">📚</div>
                            <h4 class="text-xl font-black uppercase">Global Inventory</h4>
                            <p class="text-sm text-gray-500 font-bold mt-2">Oversee all book listings and manage categories.</p>
                        </a>
                    </div>
                </div>

                <div class="lg:col-span-1">
                    <div class="bg-black text-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(147,51,234,1)]">
                        <h3 class="text-xl font-black uppercase mb-6 tracking-widest text-purple-400">Server Health</h3>
                        <div class="space-y-4">
                            <div class="flex justify-between items-center border-b border-gray-800 pb-2">
                                <span class="text-xs font-bold uppercase">Oracle DB</span>
                                <span class="text-[10px] bg-green-500 text-black px-2 py-0.5 font-black uppercase">Online</span>
                            </div>
                            <div class="flex justify-between items-center border-b border-gray-800 pb-2">
                                <span class="text-xs font-bold uppercase">Tomcat Server</span>
                                <span class="text-[10px] bg-green-500 text-black px-2 py-0.5 font-black uppercase">Stable</span>
                            </div>
                            <div class="flex justify-between items-center border-b border-gray-800 pb-2">
                                <span class="text-xs font-bold uppercase">Auth Service</span>
                                <span class="text-[10px] bg-green-500 text-black px-2 py-0.5 font-black uppercase">Active</span>
                            </div>
                        </div>
                        <div class="mt-8">
                            <p class="text-[10px] font-black uppercase text-gray-500 mb-1">Last System Backup</p>
                            <p class="text-xs font-bold">Feb 11, 2026 - 04:00 AM</p>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <jsp:include page="/includes/footer.jsp" />
    </body>
</html>