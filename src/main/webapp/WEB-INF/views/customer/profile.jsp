<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="My Profile - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-4xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-user-circle mr-3"></i>My Profile
            </h1>
            <p class="text-gray-600 text-lg">Manage your account information</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Profile Info -->
            <div class="lg:col-span-1">
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <div class="text-center">
                        <div class="w-24 h-24 bg-black border-4 border-yellow-300 rounded-full mx-auto mb-4 flex items-center justify-center">
                            <i class="fas fa-user text-3xl text-yellow-300"></i>
                        </div>
                        <h3 class="text-xl font-black uppercase">${userDetails.name}</h3>
                        <p class="text-gray-600">${userDetails.email}</p>
                        <span class="inline-block mt-2 px-3 py-1 font-bold border-2 border-black
                            ${userDetails.role == 'ADMIN' ? 'bg-red-200 text-red-800' :
                              userDetails.role == 'SELLER' ? 'bg-blue-200 text-blue-800' :
                              'bg-green-200 text-green-800'}">
                            ${userDetails.role}
                        </span>
                    </div>
                </div>
            </div>

            <!-- Profile Forms -->
            <div class="lg:col-span-2 space-y-6">
                <!-- Update Profile -->
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h2 class="text-2xl font-black uppercase mb-6">
                        <i class="fas fa-edit mr-2"></i>Update Profile
                    </h2>

                    <form action="${pageContext.request.contextPath}/profile" method="post">
                        <input type="hidden" name="action" value="update">

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                            <div>
                                <label for="name" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Full Name
                                </label>
                                <input type="text"
                                       id="name"
                                       name="name"
                                       value="${userDetails.name}"
                                       required
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                            </div>

                            <div>
                                <label for="email" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Email Address
                                </label>
                                <input type="email"
                                       id="email"
                                       name="email"
                                       value="${userDetails.email}"
                                       required
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                                       readonly>
                                <p class="text-xs text-gray-600 mt-1">Email cannot be changed</p>
                            </div>

                            <div>
                                <label for="phone" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Phone Number
                                </label>
                                <input type="tel"
                                       id="phone"
                                       name="phone"
                                       value="${userDetails.phoneNumber}"
                                       pattern="[0-9]{10}"
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                            </div>

                            <div>
                                <label for="role" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Account Type
                                </label>
                                <input type="text"
                                       value="${userDetails.role}"
                                       class="w-full px-4 py-3 border-2 border-black bg-gray-100"
                                       readonly>
                            </div>
                        </div>

                        <div class="mb-6">
                            <label for="address" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                Address
                            </label>
                            <textarea id="address"
                                      name="address"
                                      rows="3"
                                      class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">${userDetails.address}</textarea>
                        </div>

                        <button type="submit"
                                class="bg-black text-white px-6 py-3 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                            <i class="fas fa-save mr-2"></i>Update Profile
                        </button>
                    </form>
                </div>

                <!-- Change Password -->
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h2 class="text-2xl font-black uppercase mb-6">
                        <i class="fas fa-key mr-2"></i>Change Password
                    </h2>

                    <form action="${pageContext.request.contextPath}/profile" method="post">
                        <input type="hidden" name="action" value="changePassword">

                        <div class="space-y-4 mb-6">
                            <div>
                                <label for="currentPassword"
                                       class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Current Password
                                </label>
                                <input type="password"
                                       id="currentPassword"
                                       name="currentPassword"
                                       required
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                            </div>

                            <div>
                                <label for="newPassword" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    New Password
                                </label>
                                <input type="password"
                                       id="newPassword"
                                       name="newPassword"
                                       required
                                       minlength="8"
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                                <p class="text-xs text-gray-600 mt-1">Must be at least 8 characters with letters and
                                    numbers</p>
                            </div>

                            <div>
                                <label for="confirmPassword"
                                       class="block text-sm font-bold uppercase tracking-wider mb-2">
                                    Confirm New Password
                                </label>
                                <input type="password"
                                       id="confirmPassword"
                                       name="confirmPassword"
                                       required
                                       minlength="8"
                                       class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                            </div>
                        </div>

                        <button type="submit"
                                class="bg-black text-white px-6 py-3 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                            <i class="fas fa-key mr-2"></i>Change Password
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

<script>
    // Password confirmation validation
    document.querySelector('form[action*="changePassword"]').addEventListener('submit', function (e) {
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            e.preventDefault();
            showToast('error', 'New passwords do not match!');
            return false;
        }
    });
</script>

