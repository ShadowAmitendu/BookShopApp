<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Books | Bookshelf</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Space Grotesk', sans-serif; }</style>
</head>
<body class="bg-[#F3F4F6] min-h-screen flex flex-col">

    <jsp:include page="/includes/header.jsp" />

    <main class="max-w-7xl mx-auto px-6 py-12 w-full">
        <div class="flex flex-col md:flex-row justify-between items-end mb-12 gap-6">
            <div>
                <h1 class="text-5xl font-black uppercase tracking-tighter">The <span class="text-blue-600">Library.</span></h1>
                <p class="text-gray-500 font-bold uppercase text-xs mt-2 tracking-widest">Explore our handpicked selection</p>
            </div>
            
            <form action="search" class="flex border-4 border-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                <input type="text" name="q" placeholder="Search books..." class="p-3 outline-none w-64 md:w-80 font-bold">
                <button class="bg-black text-white px-6 font-black uppercase hover:bg-blue-600 transition-colors">Find</button>
            </form>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            <c:forEach var="book" items="${bookList}">
                <div class="group bg-white border-4 border-black p-4 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                    <div class="aspect-[3/4] mb-4 bg-gray-100 border-2 border-black overflow-hidden relative">
                        <img src="${book.imageUrl}" alt="${book.title}" class="w-full h-full object-cover">
                        <span class="absolute top-2 right-2 bg-yellow-300 border-2 border-black px-2 py-0.5 text-[10px] font-black uppercase">
                            ${book.category}
                        </span>
                    </div>

                    <h3 class="text-xl font-black leading-none truncate">${book.title}</h3>
                    <p class="text-gray-500 font-bold text-sm mb-4">${book.author}</p>
                    
                    <div class="flex justify-between items-center mt-auto pt-4 border-t-2 border-black">
                        <span class="text-2xl font-black">$${book.price}</span>
                        <form action="cart" method="POST">
                            <input type="hidden" name="bookId" value="${book.id}">
                            <button class="w-10 h-10 bg-blue-600 text-white border-2 border-black flex items-center justify-center hover:bg-black transition-colors shadow-[2px_2px_0px_0px_rgba(0,0,0,1)]">
                                <span class="font-black">+</span>
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <jsp:include page="/includes/footer.jsp" />
</body>
</html>