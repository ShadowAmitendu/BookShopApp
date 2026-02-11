<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Contact Us - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-5xl mx-auto">
        <!-- Page Header -->
        <div class="text-center mb-12">
            <h1 class="text-5xl font-black uppercase mb-4">Get In Touch</h1>
            <p class="text-gray-600 text-lg">Have questions? We'd love to hear from you!</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Contact Info -->
            <div class="space-y-6">
                <!-- Email -->
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h3 class="text-lg font-black uppercase mb-3">
                        <i class="fas fa-envelope text-blue-600 mr-2"></i>Email
                    </h3>
                    <p class="font-bold">support@bookshelf.com</p>
                    <p class="text-sm text-gray-600">We reply within 24 hours</p>
                </div>

                <!-- Phone -->
                <div class="bg-white border-4 border-black flat-shadow p-6">
                    <h3 class="text-lg font-black uppercase mb-3">
                        <i class="fas fa-phone text-green-600 mr-2"></i>Phone
                    </h3>
                    <p class="font-bold">+1 (555) BOOK-HELP</p>
                    <p class="text-sm text-gray-600">Mon-Fri, 9AM-6PM EST</p>
                </div>

                <!-- Location -->
                <div class="bg-yellow-200 border-4 border-black flat-shadow p-6">
                    <h3 class="text-lg font-black uppercase mb-3">
                        <i class="fas fa-map-marker-alt text-red-600 mr-2"></i>Address
                    </h3>
                    <p class="font-bold text-sm">123 Bibliophile Ave<br/>Fiction District, NY 10001</p>
                </div>
            </div>

            <!-- Contact Form -->
            <div class="lg:col-span-2">
                <div class="bg-white border-4 border-black flat-shadow p-8">
                    <h2 class="text-2xl font-black uppercase mb-6">Send us a Message</h2>

                    <form action="${pageContext.request.contextPath}/contact" method="post" class="space-y-4">
                        <div>
                            <label for="name" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                Full Name *
                            </label>
                            <input type="text"
                                   id="name"
                                   name="name"
                                   required
                                   class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                        </div>

                        <div>
                            <label for="email" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                Email Address *
                            </label>
                            <input type="email"
                                   id="email"
                                   name="email"
                                   required
                                   class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                        </div>

                        <div>
                            <label for="subject" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                Subject *
                            </label>
                            <input type="text"
                                   id="subject"
                                   name="subject"
                                   required
                                   class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                        </div>

                        <div>
                            <label for="message" class="block text-sm font-bold uppercase tracking-wider mb-2">
                                Message *
                            </label>
                            <textarea id="message"
                                      name="message"
                                      rows="6"
                                      required
                                      class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"></textarea>
                        </div>

                        <button type="submit"
                                class="w-full bg-black text-white px-6 py-4 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                            <i class="fas fa-paper-plane mr-2"></i>Send Message
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

<div class="mb-12">
    <h1 class="text-5xl md:text-6xl font-black uppercase tracking-tighter italic">Get In <span
            class="text-blue-600">Touch.</span></h1>
    <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Questions? Feedback? We're
        listening.</p>
</div>

<div class="grid grid-cols-1 lg:grid-cols-5 gap-12">

    <div class="lg:col-span-2 space-y-6">
        <div class="bg-yellow-300 border-4 border-black p-8 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
            <h3 class="text-xl font-black uppercase mb-2">Visit Our HQ</h3>
            <p class="font-bold text-sm leading-tight">123 Bibliophile Ave,<br/>Fiction District, NY 10001</p>
        </div>

        <div class="bg-white border-4 border-black p-8 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)]">
            <h3 class="text-xl font-black uppercase mb-2">Direct Line</h3>
            <p class="font-bold text-sm leading-tight text-blue-600 underline">support@bookshelf.com</p>
            <p class="font-bold text-sm leading-tight mt-1">+1 (555) BOOK-HELP</p>
        </div>

        <div class="bg-pink-400 border-4 border-black p-6 rotate-1">
            <p class="font-black uppercase text-center text-sm italic">Average response time: &lt; 24 Hours ⚡</p>
        </div>
    </div>

    <div class="lg:col-span-3">
        <div class="bg-white border-4 border-black p-8 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)]">

            <c:if test="${not empty sessionScope.user}">
                <div class="mb-6 bg-blue-50 border-2 border-blue-600 p-4 flex items-center gap-3">
                    <span class="text-2xl">👋</span>
                    <p class="text-xs font-black uppercase text-blue-700">
                        Welcome back, ${sessionScope.user.name}! We've filled in your details below.
                    </p>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/contact" method="POST" class="space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <label class="block text-sm font-black uppercase mb-2">Your Name</label>
                        <input type="text" name="name"
                               value="${not empty sessionScope.user ? sessionScope.user.name : ''}"
                               required
                               class="w-full border-2 border-black p-4 focus:bg-yellow-50 outline-none font-bold transition-all
                                           ${not empty sessionScope.user ? 'bg-gray-50' : ''}"
                               placeholder="Full Name">
                    </div>
                    <div>
                        <label class="block text-sm font-black uppercase mb-2">Email Address</label>
                        <input type="email" name="email"
                               value="${not empty sessionScope.user ? sessionScope.user.email : ''}"
                               required
                               class="w-full border-2 border-black p-4 focus:bg-yellow-50 outline-none font-bold transition-all
                                           ${not empty sessionScope.user ? 'bg-gray-50' : ''}"
                               placeholder="email@example.com">
                    </div>
                </div>

                <div>
                    <label class="block text-sm font-black uppercase mb-2">Subject</label>
                    <select name="subject"
                            class="w-full border-2 border-black p-4 focus:bg-yellow-50 outline-none font-bold appearance-none bg-white">
                        <option value="GENERAL">General Inquiry</option>
                        <option value="ORDER">Order Issue</option>
                        <option value="SELLER">Become a Seller</option>
                        <option value="TECH">Technical Bug</option>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-black uppercase mb-2">Message</label>
                    <textarea name="message" rows="5" required
                              class="w-full border-2 border-black p-4 focus:bg-yellow-50 outline-none font-bold"
                              placeholder="How can we help you today?"></textarea>
                </div>

                <button type="submit"
                        class="bg-black text-white px-10 py-5 border-2 border-black font-black uppercase hover:bg-blue-600 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] active:translate-y-1 transition-all w-full md:w-auto">
                    Send Message →
                </button>
            </form>
        </div>
    </div>
</div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
