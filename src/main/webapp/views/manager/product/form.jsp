<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <title>${empty product ? 'Thêm' : 'Sửa'} Sản phẩm</title>

            <div class="container-fluid">
                <!-- Header -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h4 class="mb-1">
                            <i class="bi bi-${empty product ? 'plus-lg' : 'pencil'} me-2"></i>
                            ${empty product ? 'Thêm sản phẩm mới' : 'Sửa sản phẩm'}
                        </h4>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a
                                        href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
                                <li class="breadcrumb-item"><a
                                        href="${pageContext.request.contextPath}/manager/products">Sản phẩm</a></li>
                                <li class="breadcrumb-item active">${empty product ? 'Thêm mới' : 'Chỉnh sửa'}</li>
                            </ol>
                        </nav>
                    </div>
                    <a href="${pageContext.request.contextPath}/manager/products" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-1"></i> Quay lại
                    </a>
                </div>

                <!-- Form Card -->
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card shadow-sm mb-4">
                            <div class="card-header bg-white py-3">
                                <h6 class="mb-0 fw-semibold">
                                    <i class="bi bi-info-circle me-2"></i>Thông tin sản phẩm
                                </h6>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/manager/products" method="post"
                                    enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="${empty product ? 'add' : 'edit'}">

                                    <c:if test="${not empty product}">
                                        <input type="hidden" name="id" value="${product.id}">
                                    </c:if>

                                    <!-- Tên sản phẩm -->
                                    <div class="mb-3">
                                        <label for="name" class="form-label fw-semibold">
                                            Tên sản phẩm <span class="text-danger">*</span>
                                        </label>
                                        <input type="text" class="form-control" id="name" name="name"
                                            value="${product.name}" placeholder="Nhập tên sản phẩm..." required>
                                    </div>

                                    <!-- Danh mục -->
                                    <div class="mb-3">
                                        <label for="categoryId" class="form-label fw-semibold">
                                            Danh mục <span class="text-danger">*</span>
                                        </label>
                                        <select class="form-select" id="categoryId" name="categoryId" required>
                                            <option value="">-- Chọn danh mục --</option>
                                            <c:forEach var="cat" items="${categories}">
                                                <option value="${cat.id}" ${product.categoryId==cat.id ? 'selected' : ''
                                                    }>
                                                    ${cat.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="row">
                                        <!-- Giá gốc -->
                                        <div class="col-md-6 mb-3">
                                            <label for="price" class="form-label fw-semibold">
                                                Giá gốc (VNĐ) <span class="text-danger">*</span>
                                            </label>
                                            <input type="number" class="form-control" id="price" name="price"
                                                value="${product.price > 0 ? product.price : ''}"
                                                placeholder="Ví dụ: 299000" min="0" step="1000" required>
                                        </div>

                                        <!-- Giá sale -->
                                        <div class="col-md-6 mb-3">
                                            <label for="salePrice" class="form-label fw-semibold">
                                                Giá sale (VNĐ)
                                            </label>
                                            <input type="number" class="form-control" id="salePrice" name="salePrice"
                                                value="${product.salePrice > 0 ? product.salePrice : ''}"
                                                placeholder="Để trống nếu không sale" min="0" step="1000">
                                        </div>
                                    </div>

                                    <!-- Mô tả -->
                                    <div class="mb-3">
                                        <label for="description" class="form-label fw-semibold">Mô tả</label>
                                        <textarea class="form-control" id="description" name="description" rows="4"
                                            placeholder="Nhập mô tả sản phẩm...">${product.description}</textarea>
                                    </div>

                                    <!-- Upload hình ảnh -->
                                    <div class="mb-4">
                                        <label for="imageFile" class="form-label fw-semibold">Hình ảnh sản phẩm</label>
                                        <input type="file" class="form-control" id="imageFile" name="imageFile"
                                            accept="image/*" onchange="previewImage(this)">
                                        <div class="form-text">Định dạng: JPG, PNG, GIF. Tối đa 5MB</div>
                                    </div>

                                    <!-- Preview Image -->
                                    <div class="mb-4">
                                        <label class="form-label fw-semibold">Xem trước</label>
                                        <div class="p-3 bg-light rounded text-center" id="imagePreviewContainer">
                                            <c:choose>
                                                <c:when test="${not empty product.image}">
                                                    <img src="${pageContext.request.contextPath}/uploads/${product.image}"
                                                        alt="${product.name}" id="imagePreview" class="rounded"
                                                        style="max-width: 200px; max-height: 150px; object-fit: cover;">
                                                    <p class="text-muted small mt-2 mb-0">Ảnh hiện tại. Tải ảnh mới để
                                                        thay thế.</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <div id="noImagePlaceholder" class="text-muted py-4">
                                                        <i class="bi bi-image display-4 d-block mb-2"></i>
                                                        <span>Chưa có hình ảnh</span>
                                                    </div>
                                                    <img src="" alt="Preview" id="imagePreview" class="rounded d-none"
                                                        style="max-width: 200px; max-height: 150px; object-fit: cover;">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <!-- Buttons -->
                                    <div class="d-flex gap-2 pt-3 border-top">
                                        <button type="submit" class="btn btn-primary px-4">
                                            <i class="bi bi-${empty product ? 'plus-lg' : 'check-lg'} me-1"></i>
                                            ${empty product ? 'Thêm sản phẩm' : 'Cập nhật'}
                                        </button>
                                        <a href="${pageContext.request.contextPath}/manager/products"
                                            class="btn btn-outline-secondary">
                                            Hủy
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Tips -->
                    <div class="col-lg-4">
                        <div class="card shadow-sm">
                            <div class="card-header bg-white py-3">
                                <h6 class="mb-0 fw-semibold">
                                    <i class="bi bi-lightbulb me-2"></i>Hướng dẫn
                                </h6>
                            </div>
                            <div class="card-body">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-2">
                                        <i class="bi bi-check-circle text-success me-2"></i>
                                        <strong>Tên sản phẩm:</strong> Rõ ràng, đầy đủ thông tin
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check-circle text-success me-2"></i>
                                        <strong>Giá:</strong> Nhập số, không cần dấu chấm
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check-circle text-success me-2"></i>
                                        <strong>Giá sale:</strong> Để trống nếu không giảm giá
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check-circle text-success me-2"></i>
                                        <strong>Hình ảnh:</strong> Nên dùng ảnh vuông, rõ nét
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function previewImage(input) {
                    const preview = document.getElementById('imagePreview');
                    const placeholder = document.getElementById('noImagePlaceholder');

                    if (input.files && input.files[0]) {
                        const reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                            preview.classList.remove('d-none');
                            if (placeholder) {
                                placeholder.classList.add('d-none');
                            }
                        }

                        reader.readAsDataURL(input.files[0]);
                    }
                }
            </script>