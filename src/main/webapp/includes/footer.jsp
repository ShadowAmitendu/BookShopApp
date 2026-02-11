<%-- 
    Document   : footer
    Created on : 11 Feb 2026, 7:47:54 am
    Author     : amite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="mt-auto bg-white border-t-4 border-black py-12 w-full">
    <div class="max-w-7xl mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-8">

        <div class="text-center md:text-left">
            <h2 class="text-2xl font-black uppercase italic tracking-tighter">
                Book<span class="text-blue-600">Shelf.</span>
            </h2>
            <p class="text-sm font-bold text-gray-500 uppercase tracking-widest mt-1">
                Built with Java & Oracle • 2026
            </p>
        </div>

        <div class="flex flex-wrap justify-center gap-x-8 gap-y-2 text-sm font-black uppercase tracking-tight">
            <a href="#" class="hover:underline decoration-2 underline-offset-4">Privacy Policy</a>
            <a href="#" class="hover:underline decoration-2 underline-offset-4">Terms of Service</a>
            <a href="${pageContext.request.contextPath}/sellerProfile" class="hover:text-pink-500 transition-colors">Become a Seller</a>
            <a href="${pageContext.request.contextPath}/admin" class="hover:text-blue-600 transition-colors">Admin Portal</a>
        </div>

        <div class="flex gap-4">
            <div class="w-10 h-10 border-2 border-black bg-yellow-300 flex items-center justify-center font-bold shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                Fb
            </div>
            <div class="w-10 h-10 border-2 border-black bg-pink-400 flex items-center justify-center font-bold shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                Tw
            </div>
            <div class="w-10 h-10 border-2 border-black bg-blue-400 flex items-center justify-center font-bold shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                Ig
            </div>
        </div>
    </div>

    <div class="max-w-7xl mx-auto px-6 mt-10 pt-6 border-t-2 border-gray-100 flex justify-between items-center text-[10px] font-bold uppercase text-gray-400 tracking-widest">
        <span>&copy; BookStoreApp Project</span>
        <span class="flex items-center gap-2">
            <span class="w-2 h-2 bg-green-500 rounded-full"></span> 
            System Status: Operational
        </span>
    </div>
</footer>

