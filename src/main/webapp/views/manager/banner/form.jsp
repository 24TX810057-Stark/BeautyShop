<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <title>${empty banner ? 'Thêm' : 'Sửa'} Banner</title>

        <div class="container-fluid">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h4 class="mb-1">
                        <i class="bi bi-${empty banner ? 'plus-lg' : 'pencil'} me-2"></i>
                        ${empty banner ? 'Thêm banner mới' : 'Sửa banner'}
                    </h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath}/manager/banners">Banner</a></li>
                            <li class="breadcrumb-item active">${empty banner ? 'Thêm mới' : 'Chỉnh sửa'}</li>
                        </ol>
                    </nav>
                </div>
                <a href="${pageContext.request.contextPath}/manager/banners" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Quay lại
                </a>
            </div>

            <!-- Form Card -->
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-6">
                    <div class="card shadow-sm">
                        <div class="card-header bg-white py-3">
                            <h6 class="mb-0 fw-semibold">
                                <i class="bi bi-info-circle me-2"></i>Thông tin banner
                            </h6>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manager/banners" method="post"
                                enctype="multipart/form-data">
                                <input type="hidden" name="action" value="${empty banner ? 'add' : 'edit'}">

                                <c:if test="${not empty banner}">
                                    <input type="hidden" name="id" value="${banner.id}">
                                </c:if>

                                <!-- Tiêu đề -->
                                <div class="mb-4">
                                    <label for="title" class="form-label fw-semibold">
                                        Tiêu đề banner
                                    </label>
                                    <input type="text" class="form-control" id="title" name="title"
                                        value="${banner.title}" placeholder="Nhập tiêu đề (tuỳ chọn)">
                                    <div class="form-text">Tiêu đề có thể hiển thị trên banner (tuỳ chọn)</div>
                                </div>

                                <!-- Mô tả -->
                                <div class="mb-4">
                                    <label for="description" class="form-label fw-semibold">
                                        Mô tả
                                    </label>
                                    <textarea class="form-control" id="description" name="description" rows="3"
                                        placeholder="Nhập mô tả (tuỳ chọn)">${banner.description}</textarea>
                                </div>

                                <!-- Link -->
                                <div class="mb-4">
                                    <label for="link" class="form-label fw-semibold">
                                        Đường dẫn liên kết
                                    </label>
                                    <input type="text" class="form-control" id="link" name="link" value="${banner.link}"
                                        placeholder="VD: /products hoặc https://...">
                                    <div class="form-text">Link khi người dùng click vào banner</div>
                                </div>

                                <!-- Thứ tự hiển thị -->
                                <div class="mb-4">
                                    <label for="displayOrder" class="form-label fw-semibold">
                                        Thứ tự hiển thị <span class="text-danger">*</span>
                                    </label>
                                    <input type="number" class="form-control" id="displayOrder" name="displayOrder"
                                        value="${empty banner ? 0 : banner.displayOrder}" min="0" required>
                                    <div class="form-text">Số nhỏ hơn sẽ hiển thị trước. VD: 1, 2, 3...</div>
                                </div>

                                <!-- Trạng thái -->
                                <div class="mb-4">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="isActive" name="isActive"
                                            ${empty banner || banner.active ? 'checked' : '' }>
                                        <label class="form-check-label fw-semibold" for="isActive">
                                            Hiển thị banner
                                        </label>
                                    </div>
                                    <div class="form-text">Bật để banner hiển thị trên trang web</div>
                                </div>

                                <!-- Upload hình ảnh -->
                                <div class="mb-4">
                                    <label for="imageFile" class="form-label fw-semibold">
                                        Hình ảnh banner ${empty banner ? '<span class="text-danger">*</span>' : ''}
                                    </label>
                                    <input type="file" class="form-control" id="imageFile" name="imageFile"
                                        accept="image/*" onchange="previewImage(this)" ${empty banner ? 'required' : ''
                                        }>
                                    <div class="form-text">Định dạng: JPG, PNG, GIF. Tối đa 5MB. Kích thước đề nghị:
                                        1920x600px</div>
                                </div>

                                <!-- Preview Image -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold">Xem trước</label>
                                    <div class="p-3 bg-light rounded text-center" id="imagePreviewContainer">
                                        <c:choose>
                                            <c:when test="${not empty banner.image}">
                                                <img src="${pageContext.request.contextPath}/uploads/${banner.image}"
                                                    alt="${banner.title}" id="imagePreview" class="rounded img-fluid"
                                                    style="max-height: 200px; object-fit: cover;">
                                                <p class="text-muted small mt-2 mb-0">Ảnh hiện tại. Tải ảnh mới để thay
                                                    thế.</p>
                                            </c:when>
                                            <c:otherwise>
                                                <div id="noImagePlaceholder" class="text-muted py-4">
                                                    <i class="bi bi-image display-4 d-block mb-2"></i>
                                                    <span>Chưa có hình ảnh</span>
                                                </div>
                                                <img src="" alt="Preview" id="imagePreview"
                                                    class="rounded img-fluid d-none"
                                                    style="max-height: 200px; object-fit: cover;">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <!-- Buttons -->
                                <div class="d-flex gap-2 pt-3 border-top">
                                    <button type="submit" class="btn btn-primary px-4">
                                        <i class="bi bi-${empty banner ? 'plus-lg' : 'check-lg'} me-1"></i>
                                        ${empty banner ? 'Thêm banner' : 'Cập nhật'}
                                    </button>
                                    <a href="${pageContext.request.contextPath}/manager/banners"
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