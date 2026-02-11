<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Inventory | Seller Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-7xl mx-auto px-6 py-12 w-full flex-grow">

            <div class="flex flex-col md:flex-row justify-between items-end mb-10 gap-6">
                <div>
                    <h1 class="text-5xl font-black uppercase tracking-tighter italic">Stock <span class="text-blue-600">Control.</span></h1>
                    <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Update pricing and availability in real-time</p>
                </div>

                <div class="flex gap-4">
                    <a href="${pageContext.request.contextPath}/seller/add-book" 
                       class="bg-yellow-300 border-4 border-black px-6 py-3 font-black uppercase text-sm shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                        + Add New ISBN
                    </a>
                </div>
            </div>

            <div class="bg-white border-4 border-black shadow-[12px_12px_0px_0px_rgba(0,0,0,1)] overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-black text-white uppercase text-xs tracking-[0.2em]">
                                <th class="p-5 border-r border-gray-800">Book Details</th>
                                <th class="p-5 border-r border-gray-800">Category</th>
                                <th class="p-5 border-r border-gray-800 text-center">In Stock</th>
                                <th class="p-5 border-r border-gray-800">Unit Price</th>
                                <th class="p-5">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y-4 divide-black">
                            <c:forEach var="book" items="${sellerBooks}">
                                <tr class="hover:bg-blue-50 transition-colors">
                                    <td class="p-5 border-r-2 border-black">
                                        <div class="flex items-center gap-4">
                                            <div class="w-12 h-16 bg-gray-100 border-2 border-black flex-shrink-0">
                                                <img src="${book.imageUrl}" alt="Cover" class="w-full h-full object-cover">
                                            </div>
                                            <div>
                                                <p class="font-black text-lg leading-tight">${book.title}</p>
                                                <p class="text-xs text-gray-500 font-bold uppercase">ISBN: ${book.isbn}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-5 border-r-2 border-black font-bold uppercase text-sm italic">
                                        ${book.category}
                                    </td>
                                    <td class="p-5 border-r-2 border-black text-center">
                                        <span class="inline-block border-2 border-black px-4 py-1 font-black ${book.stock < 5 ? 'bg-red-400' : 'bg-green-400'}">
                                            ${book.stock}
                                        </span>
                                    </td>
                                    <td class="p-5 border-r-2 border-black font-black text-xl">
                                        $${book.price}
                                    </td>
                                    <td class="p-5">
                                        <form action="${pageContext.request.contextPath}/seller/inventory" method="POST" class="flex items-center gap-2">
                                            <input type="hidden" name="bookId" value="${book.id}">
                                            <input type="number" name="newStock" placeholder="Add Qty" 
                                                   class="w-20 border-2 border-black p-2 font-bold outline-none focus:bg-yellow-50">
                                            <button type="submit" class="bg-black text-white p-2 font-black uppercase text-[10px] hover:bg-blue-600 transition-colors">
                                                Update
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                            <%-- Empty State --%>
                            <c:if test="${empty sellerBooks}">
                                <tr>
                                    <td colspan="5" class="p-20 text-center">
                                        <p class="font-black uppercase text-gray-300 text-2xl mb-4">Your warehouse is empty</p>
                                        <a href="${pageContext.request.contextPath}/seller/add-book" class="text-blue-600 underline font-bold uppercase">List your first book now →</a>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="mt-12 flex justify-between items-center opacity-50 hover:opacity-100 transition-opacity">
                <p class="text-xs font-black uppercase text-gray-400 tracking-widest">Export Inventory Data (CSV)</p>
                <p class="text-xs font-black uppercase text-red-600 tracking-widest cursor-pointer hover:underline">Delete All Listings</p>
            </div>

        </main>

        <jsp:include page="/includes/footer.jsp" />
    </body>
</html>