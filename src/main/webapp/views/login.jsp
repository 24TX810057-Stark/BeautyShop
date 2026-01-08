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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/login.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/base.css">


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
				</span> <span> Quên mật khẩu? <a
					href="${pageContext.request.contextPath}/forgot-password">Khôi
						phục mật khẩu</a>
				</span>
			</div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
