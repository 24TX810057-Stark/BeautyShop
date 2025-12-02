<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core1" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card shadow-sm">
					<div class="card-body">
						<h3 class="text-center mb-4">Đăng nhập</h3>

						<core1:if test="${alert != null}">
							<div class="alert alert-danger text-center">${alert}</div>
						</core1:if>

						<form action="login" method="post">
							<div class="mb-3 input-group">
								<span class="input-group-text"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" placeholder="Tài khoản"
									name="username" required>
							</div>

							<div class="mb-3 input-group">
								<span class="input-group-text"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control"
									placeholder="Mật khẩu" name="password" required>
							</div>

							<button 
							
							type="submit" class="btn btn-primary w-100">Đăng nhập
							
							</button>
							
						</form>

						<div class="mt-3 text-center">
							<p>
								Bạn chưa có tài khoản?
								
								
		<a href="${pageContext.request.contextPath}/register">Đăng ký</a>

							</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
