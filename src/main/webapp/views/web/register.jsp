<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/base.css">

</head>
<body
	style="background: linear-gradient(180deg, #ffd6e7, #ffeaf2, #ffffff);">

	<div class="container d-flex align-items-center justify-content-center"
		style="min-height: 90vh;">
		<div class="col-md-7">

			<div class="card shadow p-4"
				style="border-radius: 20px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);">

				<div class="text-center mb-3">
					<i class="fa-solid fa-user-plus"
						style="font-size: 40px; color: #ff4b7d;"></i>
				</div>

				<div class="card-header text-white text-center"
					style="background: linear-gradient(90deg, #ff4b7d, #ff2e93); border-top-left-radius: 20px; border-top-right-radius: 20px;">

					<h4>Tạo tài khoản mới</h4>
				</div>

				<div class="card-body p-4">

					<!-- Thông báo lỗi -->
					<c:if test="${not empty alert}">
						<div class="alert alert-danger text-center">${alert}</div>
					</c:if>

					<!-- Form đăng ký -->
					<form action="${pageContext.request.contextPath}/register"
						method="post">
						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								class="form-control" name="email" required>
						</div>


						<div class="mb-3">
							<label class="form-label">Mật khẩu</label> <input type="password"
								class="form-control" name="password" required>
						</div>


						<div class="mb-3">
							<label class="form-label">Họ và tên</label> <input type="text"
								class="form-control" name="fullName" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Số điện thoại</label> <input
								type="text" class="form-control" name="phone" required>
						</div>

						<button type="submit" class="btn w-100 text-white"
							style="background: linear-gradient(90deg, #ff4b7d, #ff2e93); border: none;">
							Tạo tài khoản</button>

					</form>

					<div class="text-center mt-3">
						<p>
							Bạn đã có tài khoản? <a
								href="${pageContext.request.contextPath}/login">Đăng nhập</a>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/common/footer.jsp" />

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
