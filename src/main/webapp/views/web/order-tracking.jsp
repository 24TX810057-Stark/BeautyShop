<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
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
			<h3>Đơn hàng của tôi</h3>

			<c:if test="${empty orders}">
				<p class="text-muted">Bạn chưa có đơn hàng nào.</p>
			</c:if>
			
			<c:forEach var="o" items="${orders}">
				<a class="text-decoration-none text-dark"
					href="${pageContext.request.contextPath}/order-detail?id=${o.id}">
					<div class="border rounded p-3 mb-3">
						<div>
							<b>Mã đơn:</b> #${o.id}
						</div>

						<div>
							<b>Ngày đặt:</b>
							<fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy HH:mm" />
						</div>

						<div>
							<b>Trạng thái:</b> ${o.statusText}
						</div>

						<div class="text-danger fw-bold">
							Tổng tiền:
							<fmt:formatNumber value="${o.totalAmount}" />
							đ
						</div>
					</div>
				</a>
			</c:forEach>

		</div>

	</div>
</div>
