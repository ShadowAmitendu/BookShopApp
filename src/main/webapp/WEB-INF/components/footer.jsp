<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="bg-black border-t-4 border-black mt-auto">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Brand Section -->
            <div>
                <h3 class="text-yellow-300 text-2xl font-black mb-4">
                    <i class="fas fa-book mr-2"></i>BOOKSHELF
                </h3>
                <p class="text-gray-300 leading-relaxed">
                    Your one-stop destination for all your reading needs. Built with Java Servlets, JSP, and Oracle
                    Database.
                </p>
            </div>

            <!-- Quick Links -->
            <div>
                <h4 class="text-white text-lg font-bold mb-4 uppercase tracking-wider">Quick Links</h4>
                <ul class="space-y-2">
                    <li>
                        <a href="${pageContext.request.contextPath}/"
                           class="text-gray-300 hover:text-yellow-300 transition-colors">
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/books"
                           class="text-gray-300 hover:text-yellow-300 transition-colors">
                            Browse Books
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/about"
                           class="text-gray-300 hover:text-yellow-300 transition-colors">
                            About Us
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/contact"
                           class="text-gray-300 hover:text-yellow-300 transition-colors">
                            Contact
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Social Links -->
            <div>
                <h4 class="text-white text-lg font-bold mb-4 uppercase tracking-wider">Connect With Us</h4>
                <div class="flex space-x-4">
                    <a href="#"
                       class="w-12 h-12 bg-white border-2 border-black flex items-center justify-center hover:bg-yellow-300 transition-colors flat-shadow-sm">
                        <i class="fab fa-facebook text-black text-xl"></i>
                    </a>
                    <a href="#"
                       class="w-12 h-12 bg-white border-2 border-black flex items-center justify-center hover:bg-yellow-300 transition-colors flat-shadow-sm">
                        <i class="fab fa-twitter text-black text-xl"></i>
                    </a>
                    <a href="#"
                       class="w-12 h-12 bg-white border-2 border-black flex items-center justify-center hover:bg-yellow-300 transition-colors flat-shadow-sm">
                        <i class="fab fa-instagram text-black text-xl"></i>
                    </a>
                    <a href="#"
                       class="w-12 h-12 bg-white border-2 border-black flex items-center justify-center hover:bg-yellow-300 transition-colors flat-shadow-sm">
                        <i class="fab fa-linkedin text-black text-xl"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="border-t-2 border-gray-700 mt-8 pt-6 text-center">
            <p class="text-gray-400 text-sm font-bold">
                &copy; 2026 BOOKSHELF. All Rights Reserved. | Developed by Amitendu
            </p>
        </div>
    </div>
</footer>

</body>
</html>

