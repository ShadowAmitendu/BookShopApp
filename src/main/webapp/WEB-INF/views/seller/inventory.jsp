<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Inventory Management - BookShelf" />
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp" />

<jsp:include page="/WEB-INF/components/alerts.jsp" />

<main class="flex-grow py-12 px-4">
    <div class="max-w-7xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-box mr-3"></i>Inventory Management
            </h1>
            <p class="text-gray-600 text-lg">Manage your book inventory and pricing</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
            <!-- Sidebar -->
            <div class="lg:col-span-1">
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h3 class="text-lg font-black uppercase mb-4">Quick Actions</h3>
                    <div class="space-y-3">
                        <a href="${pageContext.request.contextPath}/seller/add-book"
                           class="block bg-blue-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-blue-600 transition-colors">
                            <i class="fas fa-plus mr-2"></i>Add New Book
                        </a>
                        <button onclick="showAddInventoryModal()"
                                class="block w-full text-left bg-green-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-green-600 transition-colors">
                            <i class="fas fa-plus-circle mr-2"></i>Add to Inventory
                        </button>
                        <a href="${pageContext.request.contextPath}/seller/orders"
                           class="block bg-purple-500 text-white px-4 py-3 font-bold border-2 border-black hover:bg-purple-600 transition-colors">
                            <i class="fas fa-shopping-bag mr-2"></i>View Orders
                        </a>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="lg:col-span-3">
                <!-- Inventory Table -->
                <div class="bg-white border-4 border-black flat-shadow">
                    <div class="p-6 border-b-4 border-black">
                        <h2 class="text-2xl font-black uppercase">Your Inventory</h2>
                    </div>

                    <c:choose>
                        <c:when test="${not empty inventory and inventory.size() > 0}">
                            <div class="overflow-x-auto">
                                <table class="w-full">
                                    <thead class="bg-gray-100">
                                        <tr>
                                            <th class="px-6 py-3 text-left font-black uppercase">Book</th>
                                            <th class="px-6 py-3 text-left font-black uppercase">Stock</th>
                                            <th class="px-6 py-3 text-left font-black uppercase">Price</th>
                                            <th class="px-6 py-3 text-left font-black uppercase">Status</th>
                                            <th class="px-6 py-3 text-left font-black uppercase">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y-2 divide-gray-200">
                                        <c:forEach var="item" items="${inventory}">
                                            <tr>
                                                <td class="px-6 py-4">
                                                    <div class="flex items-center space-x-3">
                                                        <div class="w-12 h-16 flex-shrink-0">
                                                            <img src="https://via.placeholder.com/48x64?text=Book"
                                                                 alt="Book cover"
                                                                 class="w-full h-full object-cover border-2 border-black">
                                                        </div>
                                                        <div>
                                                            <p class="font-bold">Book Title ${item.bookId}</p>
                                                            <p class="text-sm text-gray-600">ISBN: ${item.bookId}</p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <span class="font-bold">${item.quantity}</span>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <span class="font-bold text-blue-600">₹${item.sellerPrice}</span>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <span class="px-2 py-1 font-bold border-2 border-black text-xs
                                                        ${item.status == 'AVAILABLE' ? 'bg-green-200 text-green-800' : 'bg-red-200 text-red-800'}">
                                                        ${item.status}
                                                    </span>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <div class="flex space-x-2">
                                                        <button onclick="editInventory(${item.id}, ${item.quantity}, ${item.sellerPrice})"
                                                                class="bg-blue-500 text-white px-3 py-1 font-bold border-2 border-black hover:bg-blue-600 transition-colors text-sm">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button onclick="deleteInventory(${item.id})"
                                                                class="bg-red-500 text-white px-3 py-1 font-bold border-2 border-black hover:bg-red-600 transition-colors text-sm">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Empty Inventory -->
                            <div class="p-12 text-center">
                                <i class="fas fa-box-open text-6xl text-gray-400 mb-4"></i>
                                <h3 class="text-2xl font-black uppercase mb-2">No Inventory Yet</h3>
                                <p class="text-gray-600 mb-6">Start by adding books to your inventory</p>
                                <a href="${pageContext.request.contextPath}/seller/add-book"
                                   class="inline-block bg-black text-white px-6 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                                    <i class="fas fa-plus mr-2"></i>Add Your First Book
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Edit Inventory Modal -->
<div id="editModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center">
    <div class="bg-white border-4 border-black p-6 max-w-md w-full mx-4">
        <div class="flex justify-between items-center mb-6">
            <h3 class="text-xl font-black uppercase">Edit Inventory</h3>
            <button onclick="closeModal()" class="text-2xl">&times;</button>
        </div>

        <form action="${pageContext.request.contextPath}/seller/inventory" method="post">
            <input type="hidden" name="action" value="update" id="editAction">
            <input type="hidden" name="itemId" id="editItemId">

            <div class="space-y-4 mb-6">
                <div>
                    <label for="editQuantity" class="block text-sm font-bold uppercase tracking-wider mb-2">
                        Quantity
                    </label>
                    <input type="number"
                           id="editQuantity"
                           name="quantity"
                           min="0"
                           required
                           class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                </div>

                <div>
                    <label for="editPrice" class="block text-sm font-bold uppercase tracking-wider mb-2">
                        Price (₹)
                    </label>
                    <input type="number"
                           id="editPrice"
                           name="price"
                           min="0"
                           step="0.01"
                           required
                           class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                </div>
            </div>

            <div class="flex space-x-3">
                <button type="submit"
                        class="flex-1 bg-black text-white px-4 py-3 font-bold border-2 border-black hover:bg-gray-800 transition-colors uppercase">
                    Update
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

<jsp:include page="/WEB-INF/components/footer.jsp" />

<script>
function editInventory(itemId, quantity, price) {
    document.getElementById('editItemId').value = itemId;
    document.getElementById('editQuantity').value = quantity;
    document.getElementById('editPrice').value = price;
    document.getElementById('editModal').classList.remove('hidden');
}

function closeModal() {
    document.getElementById('editModal').classList.add('hidden');
}

function deleteInventory(itemId) {
    if (confirm('Delete this item from inventory?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/seller/inventory';

        const actionInput = document.createElement('input');
        actionInput.type = 'hidden';
        actionInput.name = 'action';
        actionInput.value = 'delete';

        const itemIdInput = document.createElement('input');
        itemIdInput.type = 'hidden';
        itemIdInput.name = 'itemId';
        itemIdInput.value = itemId;

        form.appendChild(actionInput);
        form.appendChild(itemIdInput);
        document.body.appendChild(form);
        form.submit();
    }
}

function showAddInventoryModal() {
    showToast('info', 'Add to inventory feature coming soon!');
}
</script>

