<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container d-flex justify-content-center mt-5">
    <div class="col-md-4 bg-white p-4 shadow rounded">

        <h5 class="text-center mb-3">KHÔI PHỤC MẬT KHẨU</h5>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <c:if test="${not empty msg}">
            <div class="alert alert-success">${msg}</div>
        </c:if>

        <form method="post"
              action="${pageContext.request.contextPath}/forgot-password">

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email"
                       name="email"
                       class="form-control"
                       placeholder="Nhập email đã đăng ký"
                       required>
            </div>

            <button class="btn btn-primary w-100">
                GỬI MẬT KHẨU TẠM
            </button>
        </form>

        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login">
                ← Quay lại đăng nhập
            </a>
        </div>
    </div>
</div>

</body>
</html>
