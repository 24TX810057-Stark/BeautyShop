<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

            <title>Quản lý Sản phẩm</title>

            <div class="container-fluid">
                <!-- Header -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h4 class="mb-1"><i class="bi bi-box me-2"></i>Quản lý Sản phẩm</h4>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a
                                        href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
                                <li class="breadcrumb-item active">Sản phẩm</li>
                            </ol>
                        </nav>
                    </div>
                    <a href="${pageContext.request.contextPath}/manager/products?action=add" class="btn btn-primary">
                        <i class="bi bi-plus-lg me-1"></i> Thêm sản phẩm
                    </a>
                </div>

                <!-- Alert Message -->
                <c:if test="${not empty message}">
                    <div class="alert alert-${messageType} alert-dismissible fade show" role="alert">
                        <i class="bi bi-${messageType == 'success' ? 'check-circle' : 'exclamation-triangle'} me-2"></i>
                        ${message}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Products Table -->
                <div class="card shadow-sm">
                    <div class="card-header bg-white py-3">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="mb-0 fw-semibold">
                                    <i class="bi bi-list-ul me-2"></i>Danh sách Sản phẩm
                                </h6>
                            </div>
                            <div class="col-auto">
                                <span class="badge bg-primary">${products.size()} sản phẩm</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th style="width: 50px;">ID</th>
                                        <th style="width: 80px;">Ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Danh mục</th>
                                        <th class="text-end">Giá gốc</th>
                                        <th class="text-end">Giá sale</th>
                                        <th style="width: 120px;" class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty products}">
                                            <tr>
                                                <td colspan="7" class="text-center py-5">
                                                    <div class="text-muted">
                                                        <i class="bi bi-inbox display-4 d-block mb-3"></i>
                                                        Chưa có sản phẩm nào
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="prod" items="${products}">
                                                <tr>
                                                    <td><span class="badge bg-secondary">${prod.id}</span></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${not empty prod.image}">
                                                                <img src="${pageContext.request.contextPath}/assets/images/${prod.image}"
                                                                    alt="${prod.name}" class="rounded"
                                                                    style="width: 50px; height: 50px; object-fit: cover;">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="bg-light rounded d-flex align-items-center justify-content-center"
                                                                    style="width: 50px; height: 50px;">
                                                                    <i class="bi bi-image text-muted"></i>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <span class="fw-semibold">${prod.name}</span>
                                                    </td>
                                                    <td>
                                                        <c:forEach var="cat" items="${categories}">
                                                            <c:if test="${cat.id == prod.categoryId}">
                                                                <span class="badge bg-info">${cat.name}</span>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="text-end">
                                                        <fmt:formatNumber value="${prod.price}" type="number"
                                                            groupingUsed="true" />đ
                                                    </td>
                                                    <td class="text-end">
                                                        <c:choose>
                                                            <c:when test="${prod.salePrice > 0}">
                                                                <span class="text-danger fw-semibold">
                                                                    <fmt:formatNumber value="${prod.salePrice}"
                                                                        type="number" groupingUsed="true" />đ
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="text-muted">-</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="${pageContext.request.contextPath}/manager/products?action=edit&id=${prod.id}"
                                                            class="btn btn-sm btn-outline-primary me-1" title="Sửa">
                                                            <i class="bi bi-pencil"></i>
                                                        </a>
                                                        <button type="button" class="btn btn-sm btn-outline-danger"
                                                            title="Xóa"
                                                            onclick="confirmDelete(${prod.id}, '${prod.name}')">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Delete Confirmation Modal -->
            <div class="modal fade" id="deleteModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header border-0">
                            <h5 class="modal-title text-danger">
                                <i class="bi bi-exclamation-triangle me-2"></i>Xác nhận xóa
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn có chắc chắn muốn xóa sản phẩm <strong id="deleteProductName"></strong>?</p>
                            <p class="text-muted small mb-0">Hành động này không thể hoàn tác.</p>
                        </div>
                        <div class="modal-footer border-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <a href="#" id="deleteLink" class="btn btn-danger">
                                <i class="bi bi-trash me-1"></i>Xóa
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function confirmDelete(id, name) {
                    document.getElementById('deleteProductName').textContent = name;
                    document.getElementById('deleteLink').href = '${pageContext.request.contextPath}/manager/products?action=delete&id=' + id;
                    new bootstrap.Modal(document.getElementById('deleteModal')).show();
                }
            </script>