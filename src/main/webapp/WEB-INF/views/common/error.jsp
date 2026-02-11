<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops! | BookShelf Error</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
    <style>body {
        font-family: 'Space Grotesk', sans-serif;
    }</style>
</head>
<body class="bg-[#F3F4F6] min-h-screen flex flex-col">

<jsp:include page="/includes/header.jsp"/>

<main class="flex-grow flex items-center justify-center px-6 py-20">
    <div class="max-w-2xl w-full text-center">

        <div class="bg-white border-4 border-black p-12 shadow-[16px_16px_0px_0px_rgba(239,68,68,1)] relative">

            <div class="absolute -top-6 left-1/2 -translate-x-1/2 bg-black text-white px-6 py-2 font-black uppercase tracking-[0.3em] text-sm">
                Error Detected
            </div>

            <h1 class="text-8xl md:text-9xl font-black uppercase tracking-tighter mb-4 text-red-600">
                Oops.
            </h1>

            <h2 class="text-2xl font-black uppercase mb-6 tracking-tight">
                Something went <span class="bg-yellow-300 px-2 italic">sideways.</span>
            </h2>

            <div class="bg-red-50 border-2 border-black p-6 mb-10 text-left">
                <p class="text-xs font-black uppercase text-red-600 mb-2 tracking-widest">System Diagnosis:</p>
                <p class="font-bold text-gray-700 leading-relaxed">
                    <c:choose>
                        <c:when test="${not empty message}">
                            ${message}
                        </c:when>
                        <c:otherwise>
                            The page you are looking for has been moved, deleted, or never existed in this library.
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>

            <div class="flex flex-col sm:flex-row gap-4 justify-center">
                <a href="${pageContext.request.contextPath}/"
                   class="bg-black text-white px-8 py-4 font-black uppercase border-2 border-black hover:bg-blue-600 hover:shadow-[4px_4px_0px_0px_rgba(0,0,0,1)] transition-all">
                    Back to Home
                </a>
                <button onclick="history.back()"
                        class="bg-white text-black px-8 py-4 font-black uppercase border-2 border-black hover:bg-gray-100 transition-all">
                    Go Back
                </button>
            </div>
        </div>

        <div class="mt-10 flex justify-center gap-4 opacity-30">
            <div class="w-8 h-8 bg-black rotate-45"></div>
            <div class="w-8 h-8 bg-red-600 -rotate-12"></div>
            <div class="w-8 h-8 bg-blue-600 rotate-12"></div>
        </div>

    </div>
</main>

<jsp:include page="/includes/footer.jsp"/>

</body>
</html>