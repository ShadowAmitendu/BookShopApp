<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders | BookShelf</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Space Grotesk', sans-serif; }</style>
</head>
<body class="bg-[#F3F4F6] min-h-screen flex flex-col">

    <jsp:include page="/includes/header.jsp" />

    <main class="max-w-5xl mx-auto px-6 py-12 w-full flex-grow">
        
        <div class="mb-12">
            <h1 class="text-5xl font-black uppercase tracking-tighter">Purchase <span class="text-yellow-400">History.</span></h1>
            <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Track and manage your recent book hauls</p>
        </div>

        <div class="space-y-8">
            <c:forEach var="order" items="${orderList}">
                <div class="bg-white border-4 border-black shadow-[10px_10px_0px_0px_rgba(0,0,0,1)] overflow-hidden">
                    
                    <div class="bg-black text-white p-4 flex flex-wrap justify-between items-center gap-4">
                        <div class="flex gap-6 text-xs font-black uppercase tracking-widest">
                            <div>
                                <span class="text-gray-400">Order Placed:</span> 
                                <span class="ml-1">${order.orderDate}</span>
                            </div>
                            <div>
                                <span class="text-gray-400">Order ID:</span> 
                                <span class="ml-1">#BS-${order.id}</span>
                            </div>
                        </div>
                        <div class="flex items-center gap-2">
                            <span class="text-xs font-black uppercase">Status:</span>
                            <span class="px-3 py-1 border-2 border-white text-[10px] font-black uppercase 
                                ${order.status == 'DELIVERED' ? 'bg-green-500' : (order.status == 'SHIPPED' ? 'bg-blue-500' : 'bg-yellow-400 text-black')}">
                                ${order.status}
                            </span>
                        </div>
                    </div>

                    <div class="p-6">
                        <div class="flex flex-col md:flex-row justify-between items-center gap-6">
                            <div class="flex items-center gap-6">
                                <div class="w-20 h-28 bg-gray-100 border-2 border-black flex-shrink-0 relative overflow-hidden">
                                    <img src="${order.bookImageUrl}" alt="Cover" class="w-full h-full object-cover">
                                </div>
                                <div>
                                    <h3 class="text-xl font-black leading-tight uppercase">${order.bookTitle}</h3>
                                    <p class="text-sm font-bold text-gray-500 italic">by ${order.author}</p>
                                    <p class="text-xs font-black mt-2 uppercase tracking-tight">Qty: ${order.quantity}</p>
                                </div>
                            </div>

                            <div class="flex flex-col items-center md:items-end gap-4">
                                <div class="text-right">
                                    <p class="text-[10px] font-black uppercase text-gray-400">Total Paid</p>
                                    <p class="text-3xl font-black text-blue-600">$${order.totalAmount}</p>
                                </div>
                                <div class="flex gap-2">
                                    <button class="bg-white border-2 border-black px-4 py-2 text-[10px] font-black uppercase hover:bg-gray-100 transition-all">
                                        View Invoice
                                    </button>
                                    <button class="bg-black text-white px-4 py-2 text-[10px] font-black uppercase hover:bg-pink-500 transition-all">
                                        Buy Again
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="border-t-2 border-black px-6 py-4 bg-gray-50 flex items-center gap-4">
                        <div class="flex-grow h-4 border-2 border-black bg-white flex overflow-hidden">
                            <div class="h-full bg-blue-600 border-r-2 border-black 
                                ${order.status == 'DELIVERED' ? 'w-full' : (order.status == 'SHIPPED' ? 'w-2/3' : 'w-1/3')}">
                            </div>
                        </div>
                        <span class="text-[10px] font-black uppercase tracking-widest text-gray-500">
                            ${order.status == 'DELIVERED' ? 'Package Received' : 'On the way'}
                        </span>
                    </div>
                </div>
            </c:forEach>

            <%-- Empty State --%>
            <c:if test="${empty orderList}">
                <div class="bg-white border-4 border-dashed border-black p-20 text-center">
                    <p class="text-gray-400 font-black text-2xl uppercase tracking-tighter mb-4">You haven't ordered any books yet.</p>
                    <a href="${pageContext.request.contextPath}/books" class="bg-blue-600 text-white px-8 py-4 font-black uppercase border-2 border-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] inline-block">
                        Start Shopping
                    </a>
                </div>
            </c:if>
        </div>
    </main>

    <jsp:include page="/includes/footer.jsp" />
</body>
</html>