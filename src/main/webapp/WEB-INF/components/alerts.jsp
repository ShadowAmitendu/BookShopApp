<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!-- Toast Container - Fixed position at top-right -->
<div id="toast-container" class="fixed top-4 right-4 z-50 space-y-3" style="max-width: 400px;"></div>

<!-- Initialize toasts from server-side messages -->
<c:if test="${not empty requestScope.success or not empty requestScope.error or not empty requestScope.info or not empty requestScope.warning}">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            <c:if test="${not empty requestScope.success}">
            showToast('success', '${requestScope.success}');
            </c:if>

            <c:if test="${not empty requestScope.error}">
            showToast('error', '${requestScope.error}');
            </c:if>

            <c:if test="${not empty requestScope.info}">
            showToast('info', '${requestScope.info}');
            </c:if>

            <c:if test="${not empty requestScope.warning}">
            showToast('warning', '${requestScope.warning}');
            </c:if>
        });
    </script>
</c:if>

<script>
    /**
     * Show a toast notification with slide-in animation
     * @param {string} type - Type of toast: 'success', 'error', 'info', 'warning'
     * @param {string} message - Message to display
     */
    function showToast(type, message) {
        const container = document.getElementById('toast-container');
        if (!container) return;

        // Create toast element
        const toast = document.createElement('div');
        toast.className = 'transform transition-all duration-500 ease-out';
        toast.style.transform = 'translateX(450px)'; // Start off-screen to the right
        toast.style.opacity = '0';

        // Set colors and icons based on type
        let bgColor, borderColor, textColor, icon;
        switch (type) {
            case 'success':
                bgColor = 'bg-green-100';
                borderColor = 'border-green-600';
                textColor = 'text-green-900';
                icon = 'fa-check-circle';
                break;
            case 'error':
                bgColor = 'bg-red-100';
                borderColor = 'border-red-600';
                textColor = 'text-red-900';
                icon = 'fa-exclamation-circle';
                break;
            case 'info':
                bgColor = 'bg-blue-100';
                borderColor = 'border-blue-600';
                textColor = 'text-blue-900';
                icon = 'fa-info-circle';
                break;
            case 'warning':
                bgColor = 'bg-yellow-100';
                borderColor = 'border-yellow-600';
                textColor = 'text-yellow-900';
                icon = 'fa-exclamation-triangle';
                break;
            default:
                bgColor = 'bg-gray-100';
                borderColor = 'border-gray-600';
                textColor = 'text-gray-900';
                icon = 'fa-bell';
        }

        toast.innerHTML = `
        <div class="${bgColor} border-4 ${borderColor} p-4 flat-shadow-sm min-w-[350px]">
            <div class="flex items-start">
                <i class="fas ${icon} ${textColor} text-2xl mr-3 flex-shrink-0"></i>
                <div class="flex-1">
                    <p class="font-bold ${textColor} break-words">${fn:escapeXml(message)}</p>
                </div>
                <button onclick="dismissToast(this)" class="ml-3 ${textColor} hover:opacity-70 transition-opacity flex-shrink-0">
                    <i class="fas fa-times text-xl"></i>
                </button>
            </div>
            <!-- Progress bar -->
            <div class="mt-3 h-1 ${bgColor} border-2 ${borderColor} overflow-hidden">
                <div class="h-full bg-current ${textColor} toast-progress" style="width: 100%; transition: width 5s linear;"></div>
            </div>
        </div>
    `;

        container.appendChild(toast);

        // Trigger slide-in animation
        setTimeout(() => {
            toast.style.transform = 'translateX(0)';
            toast.style.opacity = '1';
        }, 10);

        // Start progress bar animation
        setTimeout(() => {
            const progressBar = toast.querySelector('.toast-progress');
            if (progressBar) {
                progressBar.style.width = '0%';
            }
        }, 100);

        // Auto-dismiss after 5 seconds
        setTimeout(() => {
            dismissToast(toast);
        }, 5000);
    }

    /**
     * Dismiss a toast with slide-out animation
     * @param {Element} element - Toast element or child element
     */
    function dismissToast(element) {
        const toast = element.closest('.transform');
        if (!toast) return;

        // Slide out to the right
        toast.style.transform = 'translateX(450px)';
        toast.style.opacity = '0';

        // Remove from DOM after animation
        setTimeout(() => {
            if (toast.parentElement) {
                toast.remove();
            }
        }, 500);
    }

    /**
     * Escape HTML to prevent XSS
     * @param {string} text - Text to escape
     * @return {string} Escaped text
     */
    function escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }
</script>

<style>
    /* Ensure toast container is always on top */
    #toast-container {
        pointer-events: none;
    }

    #toast-container > * {
        pointer-events: auto;
    }

    /* Smooth animations for toast appearance */
    @keyframes slideInRight {
        from {
            transform: translateX(450px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    @keyframes slideOutRight {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(450px);
            opacity: 0;
        }
    }
</style>

