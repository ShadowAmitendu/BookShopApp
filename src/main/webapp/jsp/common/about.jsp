<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us | BookShelf</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
        <style>body {
            font-family: 'Space Grotesk', sans-serif;
        }</style>
    </head>
    <body class="bg-[#F3F4F6] min-h-screen flex flex-col">

        <jsp:include page="/includes/header.jsp" />

        <main class="max-w-6xl mx-auto px-6 py-16 w-full flex-grow">

            <div class="mb-20">
                <h1 class="text-7xl md:text-9xl font-black uppercase tracking-tighter leading-none">
                    OUR <br/> <span class="text-pink-500">STORY.</span>
                </h1>
                <div class="mt-8 flex flex-col md:flex-row gap-8 items-start">
                    <p class="text-2xl font-bold max-w-2xl leading-tight border-l-8 border-black pl-6">
                        Founded in 2026, BookShelf was built with a simple goal: to create a high-performance, 
                        no-nonsense sanctuary for readers and sellers alike.
                    </p>
                    <div class="bg-yellow-300 border-4 border-black p-4 rotate-3 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] font-black uppercase text-sm">
                        Est. Feb 2026
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-12 mb-20">
                <div class="bg-white border-4 border-black p-10 shadow-[12px_12px_0px_0px_rgba(59,130,246,1)]">
                    <h2 class="text-4xl font-black uppercase tracking-tighter mb-4">The Mission.</h2>
                    <p class="text-gray-600 font-bold leading-relaxed">
                        We believe that finding a great book shouldn't be buried under layers of algorithms. 
                        Our platform focuses on speed, stability, and a clean interface that lets the 
                        literature speak for itself. Whether you're a student seeking technical guides or 
                        a collector of rare fiction, we've got a shelf for you.
                    </p>
                </div>
                <div class="bg-blue-600 border-4 border-black p-10 shadow-[12px_12px_0px_0px_rgba(0,0,0,1)] text-white">
                    <h2 class="text-4xl font-black uppercase tracking-tighter mb-4">The Vision.</h2>
                    <p class="font-bold leading-relaxed opacity-90">
                        To become the world's most transparent marketplace for independent book sellers. 
                        By using enterprise-grade technology like Oracle Database and Java Servlets, 
                        we ensure that every transaction is secure and every order is tracked with precision.
                    </p>
                </div>
            </div>

            <section class="mb-20">
                <h3 class="text-sm font-black uppercase tracking-[0.3em] text-gray-400 mb-8">Architectural Foundation</h3>



                [Image of Model View Controller architecture]


                <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                    <div class="bg-white border-2 border-black p-6 text-center hover:bg-yellow-50 transition-colors">
                        <p class="text-3xl mb-2">☕</p>
                        <p class="font-black uppercase text-xs">Java Servlets</p>
                    </div>
                    <div class="bg-white border-2 border-black p-6 text-center hover:bg-blue-50 transition-colors">
                        <p class="text-3xl mb-2">📑</p>
                        <p class="font-black uppercase text-xs">Jakarta JSP</p>
                    </div>
                    <div class="bg-white border-2 border-black p-6 text-center hover:bg-red-50 transition-colors">
                        <p class="text-3xl mb-2">💾</p>
                        <p class="font-black uppercase text-xs">Oracle JDBC</p>
                    </div>
                    <div class="bg-white border-2 border-black p-6 text-center hover:bg-pink-50 transition-colors">
                        <p class="text-3xl mb-2">🎨</p>
                        <p class="font-black uppercase text-xs">Tailwind CSS</p>
                    </div>
                </div>
            </section>

            <div class="border-t-4 border-black pt-16 text-center">
                <h2 class="text-4xl font-black uppercase tracking-tighter mb-8">Ready to start reading?</h2>
                <a href="${pageContext.request.contextPath}/books" 
                   class="inline-block bg-black text-white px-12 py-5 border-2 border-black font-black uppercase text-lg shadow-[8px_8px_0px_0px_rgba(236,72,153,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                    Browse the Catalog
                </a>
            </div>

        </main>

        <jsp:include page="/includes/footer.jsp" />

    </body>
</html>