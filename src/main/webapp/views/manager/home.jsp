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
							<p class="small text-muted">Duyệt nội dung hoặc yêu cầu từ
								user</p>
							<a href="#" class="btn btn-outline-primary btn-sm">Xem danh
								sách</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

</body>
</html>
