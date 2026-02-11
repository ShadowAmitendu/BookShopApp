// BookShelf - Main JavaScript

document.addEventListener('DOMContentLoaded', function () {
    console.log('BookShelf App Loaded');

    // Form validation
    const forms = document.querySelectorAll('.needs-validation');
    forms.forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
    });

    // Add to cart functionality
    const addToCartButtons = document.querySelectorAll('.add-to-cart');
    addToCartButtons.forEach(button => {
        button.addEventListener('click', function () {
            const bookId = this.getAttribute('data-book-id');
            addToCart(bookId);
        });
    });

    // Confirm delete actions
    const deleteButtons = document.querySelectorAll('.btn-delete');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function (e) {
            if (!confirmAction('Are you sure you want to delete this item?')) {
                e.preventDefault();
            }
        });
    });
});

/**
 * Add a book to the shopping cart
 */
function addToCart(bookId) {
    const contextPath = getContextPath();

    showLoading();

    fetch(`${contextPath}/cart/add`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `bookId=${bookId}&quantity=1`
    })
        .then(response => response.json())
        .then(data => {
            hideLoading();
            if (data.success) {
                showToast('success', 'Book added to cart!');
                updateCartCount(data.cartCount);
            } else {
                showToast('error', data.message || 'Failed to add book to cart');
            }
        })
        .catch(error => {
            hideLoading();
            console.error('Error:', error);
            showToast('error', 'An error occurred. Please try again.');
        });
}

/**
 * Remove item from cart
 */
function removeFromCart(cartItemId) {
    const contextPath = getContextPath();

    if (!confirmAction('Remove this item from cart?')) {
        return;
    }

    showLoading();

    fetch(`${contextPath}/cart/remove`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `cartItemId=${cartItemId}`
    })
        .then(response => response.json())
        .then(data => {
            hideLoading();
            if (data.success) {
                showToast('success', 'Item removed from cart');
                setTimeout(() => location.reload(), 1000);
            } else {
                showToast('error', 'Failed to remove item');
            }
        })
        .catch(error => {
            hideLoading();
            console.error('Error:', error);
            showToast('error', 'An error occurred');
        });
}

/**
 * Update cart item quantity
 */
function updateCartQuantity(cartItemId, quantity) {
    const contextPath = getContextPath();

    if (quantity < 1) {
        removeFromCart(cartItemId);
        return;
    }

    showLoading();

    fetch(`${contextPath}/cart/update`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `cartItemId=${cartItemId}&quantity=${quantity}`
    })
        .then(response => response.json())
        .then(data => {
            hideLoading();
            if (data.success) {
                location.reload();
            } else {
                showToast('error', 'Failed to update quantity');
            }
        })
        .catch(error => {
            hideLoading();
            console.error('Error:', error);
        });
}

/**
 * Update cart count badge
 */
function updateCartCount(count) {
    const cartBadge = document.querySelector('.cart-count');
    if (cartBadge) {
        cartBadge.textContent = count;
    }
}

/**
 * Get application context path
 */
function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
}

/**
 * Search books
 */
function searchBooks(query) {
    const contextPath = getContextPath();
    window.location.href = `${contextPath}/books?search=${encodeURIComponent(query)}`;
}

/**
 * Filter books by category
 */
function filterByCategory(category) {
    const contextPath = getContextPath();
    window.location.href = `${contextPath}/books?category=${encodeURIComponent(category)}`;
}

/**
 * Show loading spinner
 */
function showLoading() {
    if (document.querySelector('.spinner-overlay')) return;

    const spinnerHTML = `
        <div class="spinner-overlay fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div class="bg-white border-4 border-black p-8 flat-shadow">
                <div class="flex flex-col items-center">
                    <div class="animate-spin rounded-full h-16 w-16 border-4 border-black border-t-yellow-300"></div>
                    <p class="mt-4 font-bold text-lg">Loading...</p>
                </div>
            </div>
        </div>
    `;
    document.body.insertAdjacentHTML('beforeend', spinnerHTML);
}

/**
 * Hide loading spinner
 */
function hideLoading() {
    const spinner = document.querySelector('.spinner-overlay');
    if (spinner) {
        spinner.remove();
    }
}

/**
 * Confirm action (replaces window.confirm with a nicer modal)
 * For now, using native confirm, can be enhanced later
 */
function confirmAction(message) {
    // You can replace this with a custom modal if needed
    return confirm(message);
}

/**
 * Password strength indicator
 */
function checkPasswordStrength(password) {
    const strengthMeter = document.getElementById('password-strength');
    if (!strengthMeter) return;

    let strength = 0;
    if (password.length >= 8) strength++;
    if (password.match(/[a-z]/)) strength++;
    if (password.match(/[A-Z]/)) strength++;
    if (password.match(/[0-9]/)) strength++;
    if (password.match(/[^a-zA-Z0-9]/)) strength++;

    const strengthTexts = ['Very Weak', 'Weak', 'Fair', 'Good', 'Strong'];
    const strengthColors = ['bg-red-600', 'bg-orange-600', 'bg-yellow-600', 'bg-blue-600', 'bg-green-600'];

    strengthMeter.className = `h-2 transition-all duration-300 ${strengthColors[strength - 1]}`;
    strengthMeter.style.width = `${strength * 20}%`;
    strengthMeter.setAttribute('data-strength', strengthTexts[strength - 1]);
}



