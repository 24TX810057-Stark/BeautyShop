<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <title>${empty category ? 'Thêm' : 'Sửa'} Danh mục</title>

        <div class="container-fluid">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h4 class="mb-1">
                        <i class="bi bi-${empty category ? 'plus-lg' : 'pencil'} me-2"></i>
                        ${empty category ? 'Thêm danh mục mới' : 'Sửa danh mục'}
                    </h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath}/manager/categories">Danh mục</a></li>
                            <li class="breadcrumb-item active">${empty category ? 'Thêm mới' : 'Chỉnh sửa'}</li>
                        </ol>
                    </nav>
                </div>
                <a href="${pageContext.request.contextPath}/manager/categories" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Quay lại
                </a>
            </div>

            <!-- Form Card -->
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-6">
                    <div class="card shadow-sm">
                        <div class="card-header bg-white py-3">
                            <h6 class="mb-0 fw-semibold">
                                <i class="bi bi-info-circle me-2"></i>Thông tin danh mục
                            </h6>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manager/categories" method="post"
                                enctype="multipart/form-data">
                                <input type="hidden" name="action" value="${empty category ? 'add' : 'edit'}">

                                <c:if test="${not empty category}">
                                    <input type="hidden" name="id" value="${category.id}">
                                </c:if>

                                <!-- Tên danh mục -->
                                <div class="mb-4">
                                    <label for="name" class="form-label fw-semibold">
                                        Tên danh mục <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control form-control-lg" id="name" name="name"
                                        value="${category.name}" placeholder="Nhập tên danh mục..." required autofocus>
                                    <div class="form-text">Ví dụ: Chăm sóc da mặt, Trang điểm, ...</div>
                                </div>

                                <!-- Upload hình ảnh -->
                                <div class="mb-4">
                                    <label for="imageFile" class="form-label fw-semibold">
                                        Hình ảnh danh mục
                                    </label>
                                    <input type="file" class="form-control" id="imageFile" name="imageFile"
                                        accept="image/*" onchange="previewImage(this)">
                                    <div class="form-text">Định dạng: JPG, PNG, GIF. Tối đa 5MB</div>
                                </div>

                                <!-- Preview Image -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold">Xem trước</label>
                                    <div class="p-3 bg-light rounded text-center" id="imagePreviewContainer">
                                        <c:choose>
                                            <c:when test="${not empty category.image}">
                                                <img src="${pageContext.request.contextPath}/assets/images/${category.image}"
                                                    alt="${category.name}" id="imagePreview" class="rounded"
                                                    style="max-width: 200px; max-height: 150px; object-fit: cover;">
                                                <p class="text-muted small mt-2 mb-0">Ảnh hiện tại. Tải ảnh mới để thay
                                                    thế.</p>
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
                                        <i class="bi bi-${empty category ? 'plus-lg' : 'check-lg'} me-1"></i>
                                        ${empty category ? 'Thêm danh mục' : 'Cập nhật'}
                                    </button>
                                    <a href="${pageContext.request.contextPath}/manager/categories"
                                        class="btn btn-outline-secondary">
                                        Hủy
                                    </a>
                                </div>
                            </form>
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