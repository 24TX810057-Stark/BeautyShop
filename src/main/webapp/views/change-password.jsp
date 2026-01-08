<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

	<div class="container d-flex justify-content-center mt-5">
		<div class="col-md-4 bg-white p-4 shadow rounded">

			<h5 class="text-center mb-3">ĐỔI MẬT KHẨU</h5>

			<c:if test="${not empty error}">
				<div class="alert alert-danger">${error}</div>
			</c:if>

			<form method="post"
				action="${pageContext.request.contextPath}/change-password">

				<div class="mb-3">
					<label class="form-label">Mật khẩu mới</label> <input
						type="password" name="newPassword" class="form-control" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Nhập lại mật khẩu</label> <input
						type="password" name="confirmPassword" class="form-control"
						required>
				</div>

				<button class="btn btn-primary w-100">ĐỔI MẬT KHẨU</button>
			</form>

		</div>
	</div>

</body>
</html>
