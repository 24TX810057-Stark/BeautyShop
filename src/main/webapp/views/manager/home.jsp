<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="container mt-4">
	<div class="card shadow-sm">
		<div class="card-header bg-primary text-white fw-semibold">Xin
			chào, ${sessionScope.account.fullName}!</div>
		<div class="card-body">
			<h5 class="card-title">Bảng điều khiển của Manager</h5>
			<p class="card-text text-muted">
				Đây là khu vực dành cho <strong>Manager</strong>. Bạn có thể xem
				thống kê, quản lý người dùng, hoặc duyệt nội dung.
			</p>

			<div class="col-md-4">
				<div class="card text-center border-0 shadow-sm">
					<div class="card-body">
						<h6 class="fw-bold">Báo cáo doanh thu</h6>
						<p class="small text-muted">Xem báo cáo và thống kê</p>

						<a href="${pageContext.request.contextPath}/manager/revenue"
							class="btn btn-outline-primary btn-sm"> Xem ngay </a>

					</div>
				</div>
			</div>

		</div>
	</div>
</div>

