<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Approve Sellers | Admin Panel</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&border-4;display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-7xl mx-auto px-6 py-12 w-full flex-grow">

            <div class="mb-12 border-l-8 border-black pl-6">
                <h1 class="text-5xl font-black uppercase tracking-tighter">Seller <span class="text-purple-600">Verification.</span></h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Review and authorize new merchant accounts</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
                <div class="bg-white border-4 border-black p-6 shadow-[6px_6px_0px_0px_rgba(0,0,0,1)]">
                    <p class="text-[10px] font-black uppercase text-gray-400">Pending Requests</p>
                    <p class="text-3xl font-black text-yellow-500">${pendingCount != null ? pendingCount : '5'}</p>
                </div>
                <div class="bg-white border-4 border-black p-6 shadow-[6px_6px_0px_0px_rgba(0,0,0,1)]">
                    <p class="text-[10px] font-black uppercase text-gray-400">Active Sellers</p>
                    <p class="text-3xl font-black text-green-500">142</p>
                </div>
                <div class="bg-white border-4 border-black p-6 shadow-[6px_6px_0px_0px_rgba(0,0,0,1)] text-gray-300">
                    <p class="text-[10px] font-black uppercase">Rejected (30 Days)</p>
                    <p class="text-3xl font-black">12</p>
                </div>
            </div>

            <div class="bg-white border-4 border-black shadow-[12px_12px_0px_0px_rgba(0,0,0,1)] overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-black text-white uppercase text-xs tracking-widest">
                                <th class="p-5 border-r border-gray-800">Applicant Details</th>
                                <th class="p-5 border-r border-gray-800">Business Email</th>
                                <th class="p-5 border-r border-gray-800">Applied Date</th>
                                <th class="p-5 text-center">Decisions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y-4 divide-black">
                            <c:forEach var="seller" items="${pendingSellers}">
                                <tr class="hover:bg-purple-50 transition-colors">
                                    <td class="p-5 border-r-2 border-black">
                                        <p class="text-xl font-black uppercase leading-none">${seller.name}</p>
                                        <p class="text-[10px] font-bold text-purple-600 mt-1 uppercase">Storefront ID: #SEL-${seller.id}</p>
                                    </td>
                                    <td class="p-5 border-r-2 border-black font-bold">
                                        ${seller.email}
                                    </td>
                                    <td class="p-5 border-r-2 border-black font-black text-sm italic">
                                        ${seller.requestDate}
                                    </td>
                                    <td class="p-5">
                                        <div class="flex justify-center gap-3">
                                            <form action="${pageContext.request.contextPath}/admin/approve-seller" method="POST">
                                                <input type="hidden" name="sellerId" value="${seller.id}">
                                                <input type="hidden" name="action" value="approve">
                                                <button type="submit" 
                                                        class="bg-green-400 border-2 border-black px-4 py-2 text-xs font-black uppercase shadow-[3px_3px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                                                    Approve
                                                </button>
                                            </form>
                                            <form action="${pageContext.request.contextPath}/admin/approve-seller" method="POST">
                                                <input type="hidden" name="sellerId" value="${seller.id}">
                                                <input type="hidden" name="action" value="reject">
                                                <button type="submit" 
                                                        class="bg-red-400 border-2 border-black px-4 py-2 text-xs font-black uppercase shadow-[3px_3px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                                                    Reject
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <%-- Empty State --%>
                            <c:if test="${empty pendingSellers}">
                                <tr>
                                    <td colspan="4" class="p-20 text-center">
                                        <div class="text-4xl mb-4">✨</div>
                                        <p class="font-black uppercase text-gray-400 tracking-widest">Inbox Zero! No pending applications.</p>
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