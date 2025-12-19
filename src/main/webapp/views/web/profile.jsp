<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<div class="account-wrapper">
	<div class="account-container">

		<!-- SIDEBAR -->
		<div class="account-sidebar">
			<div class="account-user">

				<div class="avatar-circle">
					<i class="bi bi-person-fill"></i>
				</div>

				<div class="user-info">
					<div class="user-name">${user.fullName}</div>
					<div class="user-email">${user.email}</div>
				</div>
			</div>

			<ul class="account-menu">
				<li
					class="${fn:contains(pageContext.request.requestURI, '/profile') ? 'active' : ''}">

					<a href="${pageContext.request.contextPath}/profile"> <i
						class="bi bi-person"></i> <span>Thông tin tài khoản</span>
				</a>
				</li>

				<li
					class="${fn:contains(pageContext.request.requestURI, '/order-tracking') ? 'active' : ''}">

					<a href="${pageContext.request.contextPath}/order-tracking"> <i
						class="bi bi-bag"></i> <span>Đơn hàng của tôi</span>
				</a>
				</li>


				<li class="logout"><a
					href="${pageContext.request.contextPath}/logout"> <i
						class="bi bi-box-arrow-right"></i> <span>Đăng xuất</span>
				</a></li>
			</ul>


		</div>

		<!-- CONTENT -->
		<div class="account-content">
			<h3>Thông tin tài khoản</h3>

			<div class="info-row">
				<span>Họ tên</span> <span>${user.fullName}</span>
			</div>

			<div class="info-row">
				<span>Email</span> <span>${user.email}</span>
			</div>

			<div class="info-row">
				<span>Số điện thoại</span> <span>${user.phone}</span>
			</div>

			<div class="info-row">
				<span>Trạng thái</span> <span class="status active">Hoạt động</span>
			</div>
		</div>

	</div>
</div>
