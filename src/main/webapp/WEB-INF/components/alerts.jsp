<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<div id="toast-container"
     class="fixed top-6 right-6 z-[9999] flex flex-col items-end space-y-4 pointer-events-none"></div>

<script>
    /**
     * Initializes toasts from server-side messages
     */
    document.addEventListener('DOMContentLoaded', function () {
        <c:if test="${not empty requestScope.success}">
        showToast('success', '${fn:escapeXml(requestScope.success)}');
        </c:if>
        <c:if test="${not empty requestScope.error}">
        showToast('error', '${fn:escapeXml(requestScope.error)}');
        </c:if>
        <c:if test="${not empty requestScope.info}">
        showToast('info', '${fn:escapeXml(requestScope.info)}');
        </c:if>
        <c:if test="${not empty requestScope.warning}">
        showToast('warning', '${fn:escapeXml(requestScope.warning)}');
        </c:if>
    });

    /**
     * Enhanced Neubrutalist Toast Notification
     */
    function showToast(type, message) {
        const container = document.getElementById('toast-container');
        if (!container) return;

        const toast = document.createElement('div');
        // Setting up the base wrapper
        toast.className = 'pointer-events-auto transition-all duration-500 ease-[cubic-bezier(0.175,0.885,0.32,1.275)] mb-4';

        // Neubrutalist Color Config
        const config = {
            success: {bg: 'bg-[#AFFC41]', icon: 'fa-check'},
            error: {bg: 'bg-[#FF5C5C]', icon: 'fa-xmark'},
            info: {bg: 'bg-[#33CCFF]', icon: 'fa-info'},
            warning: {bg: 'bg-[#FFD100]', icon: 'fa-exclamation'}
        }[type] || {bg: 'bg-white', icon: 'fa-bell'};

        toast.innerHTML = `
            <div class="${config.bg} border-4 border-black p-4 shadow-[8px_8px_0px_0px_rgba(0,0,0,1)] flex flex-col min-w-[320px] max-w-[400px] translate-x-[150%] opacity-0 transition-all duration-300 toast-inner">
                <div class="flex items-center justify-between mb-3">
                    <div class="flex items-center gap-3">
                        <div class="bg-black text-white w-8 h-8 flex items-center justify-center border-2 border-black flex-shrink-0">
                            <i class="fas ${config.icon} text-sm"></i>
                        </div>
                        <span class="font-black uppercase text-[10px] tracking-widest italic">System Message</span>
                    </div>
                    <button onclick="dismissToast(this.parentElement.parentElement.parentElement)" class="hover:bg-black hover:text-white w-6 h-6 flex items-center justify-center border-2 border-transparent hover:border-black transition-all">
                        <i class="fas fa-times"></i>
                    </button>
                </div>

                <div class="border-t-2 border-black pt-3">
                    <p class="font-black text-xs uppercase leading-tight tracking-tight">${message}</p>
                </div>

                <div class="mt-4 h-4 bg-white border-2 border-black relative overflow-hidden">
                    <div class="h-full bg-black toast-timer transition-all duration-[5000ms] linear" style="width: 100%;"></div>
                </div>
            </div>
        `;

        container.prepend(toast);

        // Animation Entrance
        setTimeout(() => {
            const inner = toast.querySelector('.toast-inner');
            inner.style.transform = 'translateX(0)';
            inner.style.opacity = '1';
        }, 100);

        // Start Progress Bar
        const timer = toast.querySelector('.toast-timer');
        setTimeout(() => {
            timer.style.width = '0%';
        }, 200);

        // Auto-dismiss
        const autoDismiss = setTimeout(() => dismissToast(toast), 5200);

        // Interaction: Pause on hover
        toast.addEventListener('mouseenter', () => {
            clearTimeout(autoDismiss);
            timer.style.transition = 'none';
        });
    }

    function dismissToast(toastElement) {
        if (!toastElement) return;
        const inner = toastElement.querySelector('.toast-inner');
        inner.style.transform = 'translateX(150%)';
        inner.style.opacity = '0';

        setTimeout(() => toastElement.remove(), 500);
    }
</script>