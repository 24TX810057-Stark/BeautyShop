<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản lý - Manager</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Manager Header</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/web/home">Trang Web</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white fw-semibold">
                Xin chào, ${sessionScope.account.username}!
            </div>
            <div class="card-body">
                <h5 class="card-title">Bảng điều khiển của Manager</h5>
                <p class="card-text text-muted">
                    Đây là khu vực dành cho <strong>Manager</strong>. Bạn có thể xem thống kê, quản lý người dùng, hoặc duyệt nội dung.
                </p>

                <div class="row g-3 mt-3">
                    <div class="col-md-4">
                        <div class="card text-center border-0 shadow-sm">
                            <div class="card-body">
                                <h6 class="fw-bold">Quản lý nhân viên</h6>
                                <p class="small text-muted">Thêm, sửa, xóa nhân viên</p>
                                <a href="#" class="btn btn-outline-primary btn-sm">Đi đến</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center border-0 shadow-sm">
                            <div class="card-body">
                                <h6 class="fw-bold">Báo cáo doanh thu</h6>
                                <p class="small text-muted">Xem báo cáo và thống kê</p>
                                <a href="#" class="btn btn-outline-primary btn-sm">Xem ngay</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center border-0 shadow-sm">
                            <div class="card-body">
                                <h6 class="fw-bold">Phê duyệt yêu cầu</h6>
                                <p class="small text-muted">Duyệt nội dung hoặc yêu cầu từ user</p>
                                <a href="#" class="btn btn-outline-primary btn-sm">Xem danh sách</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
