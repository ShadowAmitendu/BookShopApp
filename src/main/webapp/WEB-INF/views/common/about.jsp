<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="About Us - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-5xl mx-auto">
        <!-- Page Header -->
        <div class="text-center mb-12">
            <h1 class="text-5xl font-black uppercase mb-4">About BookShelf</h1>
            <p class="text-gray-600 text-lg">Your trusted online bookstore since 2026</p>
        </div>

        <!-- Mission & Vision -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
            <div class="bg-white border-4 border-black flat-shadow p-8">
                <h2 class="text-2xl font-black uppercase mb-4">
                    <i class="fas fa-rocket mr-2"></i>Our Mission
                </h2>
                <p class="text-gray-700 leading-relaxed">
                    To create the world's most accessible and user-friendly online bookstore,
                    connecting readers with books they love and empowering independent sellers
                    to reach a global audience.
                </p>
            </div>

            <div class="bg-blue-500 text-white border-4 border-black flat-shadow p-8">
                <h2 class="text-2xl font-black uppercase mb-4">
                    <i class="fas fa-star mr-2"></i>Our Vision
                </h2>
                <p class="leading-relaxed">
                    To become the most trusted platform where book lovers discover, purchase,
                    and support independent authors and sellers worldwide.
                </p>
            </div>
        </div>

        <!-- Values -->
        <div class="bg-white border-4 border-black flat-shadow p-8 mb-12">
            <h2 class="text-3xl font-black uppercase mb-8 text-center">Our Core Values</h2>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="text-center p-6">
                    <div class="text-4xl mb-4">🌟</div>
                    <h3 class="font-bold uppercase mb-2">Quality</h3>
                    <p class="text-gray-600">We curate the best books and ensure every seller meets our standards.</p>
                </div>

                <div class="text-center p-6">
                    <div class="text-4xl mb-4">🤝</div>
                    <h3 class="font-bold uppercase mb-2">Community</h3>
                    <p class="text-gray-600">We support independent sellers and foster a community of readers.</p>
                </div>

                <div class="text-center p-6">
                    <div class="text-4xl mb-4">🔒</div>
                    <h3 class="font-bold uppercase mb-2">Trust</h3>
                    <p class="text-gray-600">We ensure secure transactions and transparent communication.</p>
                </div>
            </div>
        </div>

        <!-- Team -->
        <div class="bg-yellow-200 border-4 border-black flat-shadow p-8">
            <h2 class="text-3xl font-black uppercase mb-6 text-center">Our Team</h2>
            <p class="text-center text-gray-700 mb-6">
                Built by passionate developers and book enthusiasts, BookShelf combines
                cutting-edge technology with a love for literature.
            </p>
            <div class="text-center">
                <p class="font-bold">Founded: February 2026</p>
                <p class="text-gray-600">Based in: Global</p>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>
