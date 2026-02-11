<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Manage Users - BookShelf Admin"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-7xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-users mr-3"></i>Manage Users
            </h1>
            <p class="text-gray-600 text-lg">View and manage all user accounts</p>
        </div>

        <!-- User Statistics -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-blue-600 mb-2">${userList.size()}</div>
                <div class="text-sm font-bold uppercase">Total Users</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-green-600 mb-2">
                    <c:set var="customerCount" value="0"/>
                    <c:forEach var="user" items="${userList}">
                        <c:if test="${user.role == 'CUSTOMER'}">
                            <c:set var="customerCount" value="${customerCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${customerCount}
                </div>
                <div class="text-sm font-bold uppercase">Customers</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-purple-600 mb-2">
                    <c:set var="sellerCount" value="0"/>
                    <c:forEach var="user" items="${userList}">
                        <c:if test="${user.role == 'SELLER'}">
                            <c:set var="sellerCount" value="${sellerCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${sellerCount}
                </div>
                <div class="text-sm font-bold uppercase">Sellers</div>
            </div>
            <div class="bg-white border-4 border-black flat-shadow p-6 text-center">
                <div class="text-3xl font-black text-red-600 mb-2">
                    <c:set var="adminCount" value="0"/>
                    <c:forEach var="user" items="${userList}">
                        <c:if test="${user.role == 'ADMIN'}">
                            <c:set var="adminCount" value="${adminCount + 1}"/>
                        </c:if>
                    </c:forEach>
                    ${adminCount}
                </div>
                <div class="text-sm font-bold uppercase">Admins</div>
            </div>
        </div>

        <!-- Users Table -->
        <div class="bg-white border-4 border-black flat-shadow">
            <div class="p-6 border-b-4 border-black">
                <h2 class="text-2xl font-black uppercase">All Users</h2>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-gray-100">
                    <tr>
                        <th class="px-6 py-3 text-left font-black uppercase">User</th>
                        <th class="px-6 py-3 text-left font-black uppercase">Role</th>
                        <th class="px-6 py-3 text-left font-black uppercase">Contact</th>
                        <th class="px-6 py-3 text-left font-black uppercase">Status</th>
                        <th class="px-6 py-3 text-left font-black uppercase">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y-2 divide-gray-200">
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td class="px-6 py-4">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 bg-black border-2 border-yellow-300 rounded-full flex items-center justify-center">
                                        <i class="fas fa-user text-yellow-300 text-sm"></i>
                                    </div>
                                    <div>
                                        <p class="font-bold">${user.name}</p>
                                        <p class="text-sm text-gray-600">${user.email}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                    <span class="px-3 py-1 font-bold border-2 border-black text-xs
                                        ${user.role == 'ADMIN' ? 'bg-red-200 text-red-800' :
                                          user.role == 'SELLER' ? 'bg-blue-200 text-blue-800' :
                                          'bg-green-200 text-green-800'}">
                                            ${user.role}
                                    </span>
                            </td>
                            <td class="px-6 py-4">
                                <div class="text-sm">
                                    <p>
                                        <i class="fas fa-phone mr-1"></i>${user.phoneNumber != null ? user.phoneNumber : 'N/A'}
                                    </p>
                                    <p class="truncate max-w-xs" title="${user.address}"><i
                                            class="fas fa-map-marker-alt mr-1"></i>${user.address != null ? user.address : 'N/A'}
                                    </p>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                    <span class="px-2 py-1 bg-green-200 text-green-800 font-bold border-2 border-black text-xs">
                                        ACTIVE
                                    </span>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex space-x-2">
                                    <button onclick="editUser(${user.id}, '${user.name}', '${user.email}', '${user.role}')"
                                            class="bg-blue-500 text-white px-3 py-1 font-bold border-2 border-black hover:bg-blue-600 transition-colors text-sm">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <form action="${pageContext.request.contextPath}/admin/manage-users" method="post"
                                          class="inline">
                                        <input type="hidden" name="action" value="toggleStatus">
                                        <input type="hidden" name="userId" value="${user.id}">
                                        <button type="submit"
                                                class="bg-yellow-500 text-white px-3 py-1 font-bold border-2 border-black hover:bg-yellow-600 transition-colors text-sm">
                                            <i class="fas fa-ban"></i>
                                        </button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/admin/manage-users" method="post"
                                          class="inline">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="userId" value="${user.id}">
                                        <button type="submit"
                                                onclick="return confirm('Delete this user permanently?')"
                                                class="bg-red-500 text-white px-3 py-1 font-bold border-2 border-black hover:bg-red-600 transition-colors text-sm">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<!-- Edit User Modal -->
<div id="editModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
    <div class="bg-white border-4 border-black p-6 max-w-md w-full mx-4">
        <div class="flex justify-between items-center mb-6">
            <h3 class="text-xl font-black uppercase">Edit User</h3>
            <button onclick="closeModal()" class="text-2xl">&times;</button>
        </div>

        <form action="${pageContext.request.contextPath}/admin/manage-users" method="post">
            <input type="hidden" name="action" value="update" id="editAction">
            <input type="hidden" name="userId" id="editUserId">

            <div class="space-y-4 mb-6">
                <div>
                    <label for="editName" class="block text-sm font-bold uppercase tracking-wider mb-2">
                        Name
                    </label>
                    <input type="text"
                           id="editName"
                           name="name"
                           required
                           class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                </div>

                <div>
                    <label for="editEmail" class="block text-sm font-bold uppercase tracking-wider mb-2">
                        Email
                    </label>
                    <input type="email"
                           id="editEmail"
                           name="email"
                           required
                           class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                </div>

                <div>
                    <label for="editRole" class="block text-sm font-bold uppercase tracking-wider mb-2">
                        Role
                    </label>
                    <select id="editRole"
                            name="role"
                            required
                            class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600 font-bold">
                        <option value="CUSTOMER">Customer</option>
                        <option value="SELLER">Seller</option>
                        <option value="ADMIN">Admin</option>
                    </select>
                </div>
            </div>

            <div class="flex space-x-3">
                <button type="submit"
                        class="flex-1 bg-black text-white px-4 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                    Update User
                </button>
                <button type="button"
                        onclick="closeModal()"
                        class="flex-1 bg-gray-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-gray-600 transition-colors uppercase">
                    Cancel
                </button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

<script>
    function editUser(userId, name, email, role) {
        document.getElementById('editUserId').value = userId;
        document.getElementById('editName').value = name;
        document.getElementById('editEmail').value = email;
        document.getElementById('editRole').value = role;
        document.getElementById('editModal').classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('editModal').classList.add('hidden');
    }
</script>

