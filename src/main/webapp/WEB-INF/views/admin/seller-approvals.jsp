<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Approve Sellers - BookShelf Admin" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-6xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-check-circle mr-3"></i>Approve Sellers
            </h1>
            <p class="text-gray-600 text-lg">Review and approve new seller applications</p>
        </div>

        <!-- Statistics -->
        <div class="bg-white border-4 border-black flat-shadow p-6 mb-8">
            <div class="flex justify-between items-center">
                <div>
                    <h3 class="text-xl font-black uppercase">Pending Approvals</h3>
                    <p class="text-gray-600">Sellers waiting for approval</p>
                </div>
                <div class="text-4xl font-black text-yellow-600">${pendingCount}</div>
            </div>
        </div>

        <!-- Pending Sellers -->
        <div class="bg-white border-4 border-black flat-shadow">
            <div class="p-6 border-b-4 border-black">
                <h2 class="text-2xl font-black uppercase">Pending Seller Applications</h2>
            </div>

            <c:choose>
                <c:when test="${not empty pendingSellers and pendingSellers.size() > 0}">
                    <div class="divide-y-2 divide-gray-200">
                        <c:forEach var="seller" items="${pendingSellers}">
                            <div class="p-6">
                                <div class="flex justify-between items-start mb-4">
                                    <div class="flex-1">
                                        <h3 class="text-xl font-black uppercase">${seller.name}</h3>
                                        <p class="text-gray-600 mb-2">${seller.email}</p>
                                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                                            <div>
                                                <p><span class="font-bold">Phone:</span> ${seller.phoneNumber != null ? seller.phoneNumber : 'Not provided'}</p>
                                                <p><span class="font-bold">Address:</span> ${seller.address != null ? seller.address : 'Not provided'}</p>
                                            </div>
                                            <div>
                                                <p><span class="font-bold">Applied:</span> ${seller.createdDate != null ? seller.createdDate : 'Recently'}</p>
                                                <p><span class="font-bold">Status:</span>
                                                    <span class="px-2 py-1 bg-yellow-200 text-yellow-800 font-bold border-2 border-black text-xs">
                                                        PENDING
                                                    </span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Action Buttons -->
                                <div class="flex space-x-3">
                                    <form action="${pageContext.request.contextPath}/admin/approve-sellers" method="post" class="inline">
                                        <input type="hidden" name="action" value="approve">
                                        <input type="hidden" name="sellerId" value="${seller.id}">
                                        <button type="submit"
                                                class="bg-green-500 text-white px-6 py-2 font-bold border-2 border-black hover:bg-green-600 transition-colors">
                                            <i class="fas fa-check mr-2"></i>Approve
                                        </button>
                                    </form>

                                    <form action="${pageContext.request.contextPath}/admin/approve-sellers" method="post" class="inline">
                                        <input type="hidden" name="action" value="reject">
                                        <input type="hidden" name="sellerId" value="${seller.id}">
                                        <button type="submit"
                                                onclick="return confirm('Reject this seller application?')"
                                                class="bg-red-500 text-white px-6 py-2 font-bold border-2 border-black hover:bg-red-600 transition-colors">
                                            <i class="fas fa-times mr-2"></i>Reject
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- No Pending Sellers -->
                    <div class="p-12 text-center">
                        <i class="fas fa-check-circle text-6xl text-green-400 mb-4"></i>
                        <h3 class="text-2xl font-black uppercase mb-2">All Caught Up!</h3>
                        <p class="text-gray-600 mb-6">No pending seller applications to review</p>
                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                           class="inline-block bg-black text-white px-6 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                            <i class="fas fa-arrow-left mr-2"></i>Back to Dashboard
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

