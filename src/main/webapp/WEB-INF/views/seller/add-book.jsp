<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="/WEB-INF/components/head.jsp">
    <jsp:param name="title" value="Add New Book - BookShelf"/>
</jsp:include>

<jsp:include page="/WEB-INF/components/navbar.jsp"/>

<jsp:include page="/WEB-INF/components/alerts.jsp"/>

<main class="flex-grow py-12 px-4">
    <div class="max-w-4xl mx-auto">
        <!-- Page Header -->
        <div class="mb-8">
            <h1 class="text-5xl font-black uppercase mb-2">
                <i class="fas fa-plus-circle mr-3"></i>Add New Book
            </h1>
            <p class="text-gray-600 text-lg">Add a new book to the BookShelf catalog</p>
        </div>

        <!-- Add Book Form -->
        <div class="bg-white border-4 border-black flat-shadow p-8">
            <form action="${pageContext.request.contextPath}/seller/add-book" method="post">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <!-- ISBN -->
                    <div>
                        <label for="isbn" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            ISBN (Optional)
                        </label>
                        <input type="text"
                               id="isbn"
                               name="isbn"
                               pattern="^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                        <p class="text-xs text-gray-600 mt-1">Leave empty if not available</p>
                    </div>

                    <!-- Title -->
                    <div>
                        <label for="title" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Book Title *
                        </label>
                        <input type="text"
                               id="title"
                               name="title"
                               required
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                    </div>

                    <!-- Author -->
                    <div>
                        <label for="author" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Author *
                        </label>
                        <input type="text"
                               id="author"
                               name="author"
                               required
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                    </div>

                    <!-- Publisher -->
                    <div>
                        <label for="publisher" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Publisher
                        </label>
                        <input type="text"
                               id="publisher"
                               name="publisher"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                    </div>

                    <!-- Publication Year -->
                    <div>
                        <label for="publicationYear" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Publication Year
                        </label>
                        <input type="number"
                               id="publicationYear"
                               name="publicationYear"
                               min="1000"
                               max="2030"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                    </div>

                    <!-- Category -->
                    <div>
                        <label for="category" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Category *
                        </label>
                        <select id="category"
                                name="category"
                                required
                                class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600 font-bold">
                            <option value="">Select Category</option>
                            <option value="Fiction">Fiction</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Self-Help">Self-Help</option>
                            <option value="Science">Science</option>
                            <option value="Biography">Biography</option>
                            <option value="History">History</option>
                            <option value="Technology">Technology</option>
                            <option value="Business">Business</option>
                            <option value="Health">Health</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <!-- Price -->
                    <div>
                        <label for="price" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Price (₹) *
                        </label>
                        <input type="number"
                               id="price"
                               name="price"
                               min="0"
                               step="0.01"
                               required
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                    </div>

                    <!-- Image URL -->
                    <div>
                        <label for="imageUrl" class="block text-sm font-bold uppercase tracking-wider mb-2">
                            Cover Image URL
                        </label>
                        <input type="url"
                               id="imageUrl"
                               name="imageUrl"
                               placeholder="https://example.com/book-cover.jpg"
                               class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600">
                        <p class="text-xs text-gray-600 mt-1">Leave empty for default image</p>
                    </div>
                </div>

                <!-- Description -->
                <div class="mb-6">
                    <label for="description" class="block text-sm font-bold uppercase tracking-wider mb-2">
                        Description
                    </label>
                    <textarea id="description"
                              name="description"
                              rows="4"
                              placeholder="Brief description of the book..."
                              class="w-full px-4 py-3 border-2 border-black focus:outline-none focus:border-blue-600"></textarea>
                </div>

                <!-- Submit Buttons -->
                <div class="flex flex-col sm:flex-row gap-4">
                    <button type="submit"
                            class="flex-1 bg-black text-white px-6 py-4 font-bold border-2 border-black flat-shadow-sm hover:flat-shadow transition-all uppercase">
                        <i class="fas fa-save mr-2"></i>Add Book to Catalog
                    </button>

                    <a href="${pageContext.request.contextPath}/seller/inventory"
                       class="flex-1 text-center bg-gray-500 text-white px-6 py-4 font-bold border-2 border-black hover:bg-gray-600 transition-colors uppercase">
                        <i class="fas fa-arrow-left mr-2"></i>Back to Inventory
                    </a>
                </div>
            </form>
        </div>

        <!-- Help Section -->
        <div class="mt-8 bg-blue-50 border-4 border-blue-600 p-6">
            <h3 class="text-xl font-black uppercase mb-4">
                <i class="fas fa-info-circle mr-2"></i>Tips for Adding Books
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                <div>
                    <h4 class="font-bold mb-2">Required Fields</h4>
                    <ul class="space-y-1 text-gray-700">
                        <li>• Book Title</li>
                        <li>• Author</li>
                        <li>• Category</li>
                        <li>• Price</li>
                    </ul>
                </div>
                <div>
                    <h4 class="font-bold mb-2">Optional Fields</h4>
                    <ul class="space-y-1 text-gray-700">
                        <li>• ISBN (for identification)</li>
                        <li>• Publisher & Publication Year</li>
                        <li>• Cover Image URL</li>
                        <li>• Book Description</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp"/>

