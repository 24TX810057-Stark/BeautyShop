<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập tài khoản</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
body {
	background-color: #fce4ec;
}

.login-wrapper {
	min-height: 100vh;
}

.login-box {
	max-width: 650px;
	width: 100%;
	border-radius: 12px;
}

.login-logo img {
	max-height: 60px;
}

.btn-login-main {
	background: linear-gradient(90deg, #ff4b7d, #ff2e93);
	border: none;
	font-weight: 600;
	letter-spacing: 0.5px;
}

.btn-login-main:hover {
	opacity: 0.9;
}

.login-subtitle {
	font-size: 14px;
	color: #555;
}

.recaptcha-text {
	font-size: 12px;
	color: #888;
}

.login-footer-link a {
	font-size: 14px;
	text-decoration: none;
}

.login-footer-link a:hover {
	text-decoration: underline;
}

.divider-line {
	height: 1px;
	background-color: #eee;
	margin: 16px 0 8px 0;
}
</style>
</head>
<body>

	<div
		class="d-flex justify-content-center align-items-center login-wrapper">
		<div class="login-box bg-white shadow-sm px-4 px-md-5 pt-3 pb-4">


			<div class="text-center mb-1">
				<img src="${pageContext.request.contextPath}/assets/images/logo.png"
					alt="Logo" style="width: 200px; height: auto;">
			</div>


			<!-- Tiêu đề -->
			<div class="text-center mb-2">
				<h5 class="mb-1 fw-bold">ĐĂNG NHẬP TÀI KHOẢN</h5>
				<p class="login-subtitle mb-0">Nhập email và mật khẩu của bạn:</p>
			</div>

			<div class="divider-line"></div>

			<!-- Thông báo lỗi -->
			<c:if test="${not empty error}">
				<div class="alert alert-danger text-center">${error}</div>
			</c:if>

			<!-- Form đăng nhập -->
			<form action="${pageContext.request.contextPath}/login" method="post"
				class="mt-3">
				<div class="mb-3">
					<label class="form-label small">Số điện thoại / Email</label> <input
						type="text" class="form-control" name="identifier"
						placeholder="Số điện thoại hoặc email" required>
				</div>

				<div class="mb-3">
					<label class="form-label small">Mật khẩu</label> <input
						type="password" class="form-control" name="password"
						placeholder="Mật khẩu" required>
				</div>

				<p class="recaptcha-text mb-3">
					This site is protected by reCAPTCHA and the Google <a href="#"
						target="_blank">Privacy Policy</a> and <a href="#" target="_blank">Terms
						of Service</a> apply.
				</p>

				<button type="submit"
					class="btn btn-login-main text-white w-100 py-2">ĐĂNG NHẬP
				</button>
			</form>

			<!-- Link dưới nút -->
			<div class="d-flex justify-content-between mt-3 login-footer-link">
				<span>Khách hàng mới? <a
					href="${pageContext.request.contextPath}/register">Tạo tài
						khoản</a>
				</span> <span> Quên mật khẩu? <a href="#">Khôi phục mật khẩu</a>
				</span>
			</div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
