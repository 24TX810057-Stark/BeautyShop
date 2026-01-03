<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <title>Chỉnh sửa Người dùng</title>

        <div class="container-fluid">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h4 class="mb-1"><i class="bi bi-person-gear me-2"></i>Chỉnh sửa Người dùng</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/users">Người
                                    dùng</a></li>
                            <li class="breadcrumb-item active">Chỉnh sửa</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card shadow-sm">
                        <div class="card-header bg-white py-3">
                            <h6 class="mb-0 fw-semibold">
                                <i class="bi bi-info-circle me-2"></i>Thông tin người dùng
                            </h6>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manager/users" method="post">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="${user.id}">

                                <!-- Info fields (readonly) -->
                                <div class="mb-3">
                                    <label class="form-label">Họ tên</label>
                                    <input type="text" class="form-control" value="${user.fullName}" readonly disabled>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" value="${user.email}" readonly disabled>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Điện thoại</label>
                                    <input type="text" class="form-control" value="${user.phone}" readonly disabled>
                                </div>

                                <hr>

                                <!-- Editable fields -->
                                <div class="mb-3">
                                    <label class="form-label">Vai trò <span class="text-danger">*</span></label>
                                    <select name="role" class="form-select" required>
                                        <option value="USER" ${user.role=='USER' ? 'selected' : '' }>User</option>
                                        <option value="ADMIN" ${user.role=='ADMIN' ? 'selected' : '' }>Admin</option>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label">Trạng thái <span class="text-danger">*</span></label>
                                    <select name="status" class="form-select" required>
                                        <option value="1" ${user.status==1 ? 'selected' : '' }>Active</option>
                                        <option value="0" ${user.status==0 ? 'selected' : '' }>Inactive</option>
                                    </select>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <a href="${pageContext.request.contextPath}/manager/users"
                                        class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-left me-1"></i>Quay lại
                                    </a>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-check-lg me-1"></i>Cập nhật
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>