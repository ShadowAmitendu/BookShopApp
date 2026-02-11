<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Sign Up - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow flex items-center justify-center px-4 py-12">
    <div class="max-w-2xl w-full">
        <div class="bg-white border-4 border-black p-8 flat-shadow">
            <!-- Header -->
            <div class="text-center mb-8">
                <h2 class="text-3xl font-black uppercase mb-2">Create Account</h2>
                <p class="text-gray-600">Join BookShelf and start your reading journey</p>
            </div>

            <!-- Form -->
            <form action="${pageContext.request.contextPath}/signup" method="post">
                <div class="grid md:grid-cols-2 gap-6 mb-6">
                    <!-- Name -->
                    <div>
                        <label for="name" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Full Name
                        </label>
                        <input type="text"
                               id="name"
                               name="name"
                               required
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Enter your full name">
                    </div>

                    <!-- Email -->
                    <div>
                        <label for="email" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Email Address
                        </label>
                        <input type="email"
                               id="email"
                               name="email"
                               required
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Enter your email">
                    </div>

                    <!-- Phone -->
                    <div>
                        <label for="phone" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Phone Number
                        </label>
                        <input type="tel"
                               id="phone"
                               name="phone"
                               pattern="[0-9]{10}"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="10-digit phone number">
                    </div>

                    <!-- Role -->
                    <div>
                        <label for="role" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Register As
                        </label>
                        <select id="role"
                                name="role"
                                required
                                class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600 font-bold">
                            <option value="">Select Role</option>
                            <option value="CUSTOMER">Customer</option>
                            <option value="SELLER">Seller</option>
                        </select>
                    </div>

                    <!-- Password -->
                    <div>
                        <label for="password" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Password
                        </label>
                        <input type="password"
                               id="password"
                               name="password"
                               required
                               minlength="8"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Min. 8 characters">
                        <p class="text-xs text-gray-600 mt-1">Must be at least 8 characters with letters and numbers</p>
                    </div>

                    <!-- Confirm Password -->
                    <div>
                        <label for="confirmPassword" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Confirm Password
                        </label>
                        <input type="password"
                               id="confirmPassword"
                               name="confirmPassword"
                               required
                               minlength="8"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                               placeholder="Re-enter password">
                    </div>
                </div>

                <!-- Address -->
                <div class="mb-6">
                    <label for="address" class="block text-sm font-bold uppercase tracking-wider mb-2">
                        Address
                    </label>
                    <textarea id="address"
                              name="address"
                              rows="3"
                              class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"
                              placeholder="Enter your full address"></textarea>
                </div>

                <!-- Terms & Conditions -->
                <div class="mb-6">
                    <label class="flex items-start">
                        <input type="checkbox"
                               id="terms"
                               name="terms"
                               required
                               class="w-4 h-4 border-2 border-black mt-1">
                        <span class="ml-2 text-sm">
                            I agree to the <a href="#" class="text-blue-600 font-bold hover:underline">Terms & Conditions</a>
                            and <a href="#" class="text-blue-600 font-bold hover:underline">Privacy Policy</a>
                        </span>
                    </label>
                </div>

                <!-- Submit Button -->
                <button type="submit"
                        class="w-full bg-black text-white px-6 py-4 text-lg font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                    <i class="fas fa-user-plus mr-2"></i>Create Account
                </button>
            </form>

            <!-- Divider -->
            <div class="my-6 border-t-2 border-gray-300"></div>

            <!-- Login Link -->
            <div class="text-center">
                <p class="text-gray-600">
                    Already have an account?
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-black font-bold hover:text-blue-600">
                        Login
                    </a>
                </p>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

<script>
    // Password validation
    document.querySelector('form').addEventListener('submit', function (e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            e.preventDefault();
            alert('Passwords do not match!');
            return false;
        }
    });
</script>

