<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <title>Quản lý Người dùng</title>

        <div class="container-fluid">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h4 class="mb-1"><i class="bi bi-people me-2"></i>Quản lý Người dùng</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
                            <li class="breadcrumb-item active">Người dùng</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <!-- Alert Message -->
            <c:if test="${not empty message}">
                <div class="alert alert-${messageType} alert-dismissible fade show" role="alert">
                    <i class="bi bi-${messageType == 'success' ? 'check-circle' : 'exclamation-triangle'} me-2"></i>
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Users Table -->
            <div class="card shadow-sm">
                <div class="card-header bg-white py-3">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="mb-0 fw-semibold">
                                <i class="bi bi-list-ul me-2"></i>Danh sách Người dùng
                            </h6>
                        </div>
                        <div class="col-auto">
                            <span class="badge bg-primary">${totalItems} người dùng</span>
                        </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th style="width: 60px;">ID</th>
                                    <th>Họ tên</th>
                                    <th>Email</th>
                                    <th>Điện thoại</th>
                                    <th class="text-center">Vai trò</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th style="width: 120px;" class="text-center">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty users}">
                                        <tr>
                                            <td colspan="7" class="text-center py-5">
                                                <div class="text-muted">
                                                    <i class="bi bi-inbox display-4 d-block mb-3"></i>
                                                    Chưa có người dùng nào
                                                </div>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="user" items="${users}">
                                            <tr>
                                                <td><span class="badge bg-secondary">${user.id}</span></td>
                                                <td>
                                                    <span class="fw-semibold">${user.fullName}</span>
                                                </td>
                                                <td>
                                                    <i class="bi bi-envelope me-1 text-muted"></i>${user.email}
                                                </td>
                                                <td>
                                                    <i class="bi bi-phone me-1 text-muted"></i>${user.phone}
                                                </td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${user.role == 'ADMIN'}">
                                                            <span class="badge bg-danger"><i
                                                                    class="bi bi-shield-check me-1"></i>Admin</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-info"><i
                                                                    class="bi bi-person me-1"></i>User</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${user.status == 1}">
                                                            <span class="badge bg-success"><i
                                                                    class="bi bi-check-circle me-1"></i>Active</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-secondary"><i
                                                                    class="bi bi-x-circle me-1"></i>Inactive</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="text-center">
                                                    <a href="${pageContext.request.contextPath}/manager/users?action=edit&id=${user.id}"
                                                        class="btn btn-sm btn-outline-primary me-1" title="Sửa">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                    <button type="button" class="btn btn-sm btn-outline-danger"
                                                        title="Xóa"
                                                        onclick="confirmDelete(${user.id}, '${user.fullName}')">
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

                <%-- Pagination --%>
                    <div class="card-footer bg-white">
                        <jsp:include page="/common/manager/pagination.jsp" />
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
                        <p>Bạn có chắc chắn muốn xóa người dùng <strong id="deleteUserName"></strong>?</p>
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
                document.getElementById('deleteUserName').textContent = name;
                document.getElementById('deleteLink').href = '${pageContext.request.contextPath}/manager/users?action=delete&id=' + id;
                new bootstrap.Modal(document.getElementById('deleteModal')).show();
            }
        </script>