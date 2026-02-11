<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seller Dashboard | Incoming Orders</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-7xl mx-auto px-6 py-12 w-full">
            <div class="flex flex-col md:flex-row justify-between items-start mb-10 gap-4">
                <div>
                    <h1 class="text-5xl font-black uppercase tracking-tighter">Order <span class="text-pink-500">Management.</span></h1>
                    <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Tracking your sales and shipments</p>
                </div>

                <div class="flex gap-4">
                    <div class="bg-white border-4 border-black p-4 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                        <p class="text-[10px] font-black uppercase text-gray-400">Total Revenue</p>
                        <p class="text-2xl font-black text-blue-600">$1,240.50</p>
                    </div>
                    <div class="bg-white border-4 border-black p-4 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                        <p class="text-[10px] font-black uppercase text-gray-400">Open Orders</p>
                        <p class="text-2xl font-black text-pink-500">12</p>
                    </div>
                </div>
            </div>

            <div class="bg-white border-4 border-black shadow-[12px_12px_0px_0px_rgba(0,0,0,1)] overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-black text-white uppercase text-sm tracking-widest">
                                <th class="p-5 border-r border-gray-800">Order ID</th>
                                <th class="p-5 border-r border-gray-800">Book Details</th>
                                <th class="p-5 border-r border-gray-800">Customer</th>
                                <th class="p-5 border-r border-gray-800">Date</th>
                                <th class="p-5 border-r border-gray-800">Total</th>
                                <th class="p-5">Status / Action</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y-4 divide-black">
                            <c:forEach var="order" items="${orderList}">
                                <tr class="hover:bg-yellow-50 transition-colors">
                                    <td class="p-5 font-black border-r-2 border-black">#ORD-${order.id}</td>
                                    <td class="p-5 border-r-2 border-black">
                                        <p class="font-bold">${order.bookTitle}</p>
                                        <p class="text-xs text-gray-500 uppercase font-black">ISBN: ${order.isbn}</p>
                                    </td>
                                    <td class="p-5 border-r-2 border-black">
                                        <p class="font-bold">${order.customerName}</p>
                                        <p class="text-xs text-gray-400">${order.customerEmail}</p>
                                    </td>
                                    <td class="p-5 border-r-2 border-black font-bold text-sm">${order.orderDate}</td>
                                    <td class="p-5 border-r-2 border-black">
                                        <span class="text-lg font-black text-blue-600">$${order.totalPrice}</span>
                                    </td>
                                    <td class="p-5">
                                        <form action="${pageContext.request.contextPath}/seller/orders" method="POST" class="flex gap-2">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <select name="status" class="border-2 border-black bg-white px-2 py-1 text-xs font-black uppercase outline-none">
                                                <option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                                <option value="SHIPPED" ${order.status == 'SHIPPED' ? 'selected' : ''}>Shipped</option>
                                                <option value="CANCELLED" ${order.status == 'CANCELLED' ? 'selected' : ''}>Cancelled</option>
                                            </select>
                                            <button type="submit" class="bg-black text-white px-3 py-1 text-[10px] font-black uppercase hover:bg-pink-500 transition-colors">Update</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                            <%-- Empty State --%>
                            <c:if test="${empty orderList}">
                                <tr>
                                    <td colspan="6" class="p-20 text-center font-bold text-gray-400 uppercase tracking-widest">
                                        No incoming orders yet.
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

        <jsp:include page="/includes/footer.jsp" />
    </body>
</html>