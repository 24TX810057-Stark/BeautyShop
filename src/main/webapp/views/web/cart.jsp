<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>


<div class="container mt-4">

	<!-- Breadcrumb -->
	<div class="breadcrumb-custom">
		<a href="${pageContext.request.contextPath}/home"> <i
			class="bi bi-house"></i> Trang chủ
		</a> <span class="mx-2">/</span> <span class="current"> Giỏ hàng
			(${cartCount}) </span>
	</div>


	<div class="row">
		<!-- LEFT: CART LIST -->
		<div class="col-lg-8">

			<!-- Policy boxes -->
			<div class="row mb-3">
				<div class="col-md-4">
					<div class="p-3 bg-info-subtle rounded">
						Đơn hàng 99k <br> <b>Khắc son miễn phí</b>
					</div>
				</div>
				<div class="col-md-4">
					<div class="p-3 bg-warning-subtle rounded">
						Đơn hàng trên 99k <br> <b>Freeship nội thành</b>
					</div>
				</div>
				<div class="col-md-4">
					<div class="p-3 bg-success-subtle rounded">
						Hỗ trợ đổi trả <br> <b>7 ngày</b>
					</div>
				</div>
			</div>

			<h5 class="mb-3">Giỏ hàng</h5>

			<c:if test="${empty cart}">
				<p class="text-muted">Giỏ hàng trống.</p>
			</c:if>

			<c:forEach var="item" items="${cart}">
				<div class="d-flex border-bottom py-3 align-items-center">

					<!-- Image -->
					<img
						src="${pageContext.request.contextPath}/assets/images/${item.product.image}"
						style="width: 80px; height: 80px; object-fit: cover" class="me-3">

					<!-- Info -->
					<div class="flex-grow-1">
						<div class="fw-semibold">${item.product.name}</div>
						<div class="text-muted small">130g</div>

						<!-- Quantity -->
						<div class="d-flex align-items-center mt-2">

							<!-- GIẢM -->
							<form action="${pageContext.request.contextPath}/cart"
								method="post" class="d-inline">
								<input type="hidden" name="action" value="dec"> <input
									type="hidden" name="productId" value="${item.product.id}">
								<button class="btn btn-outline-secondary btn-sm">-</button>
							</form>

							<span class="mx-2">${item.quantity}</span>

							<!-- TĂNG -->
							<form action="${pageContext.request.contextPath}/cart"
								method="post" class="d-inline">
								<input type="hidden" name="action" value="inc"> <input
									type="hidden" name="productId" value="${item.product.id}">
								<button class="btn btn-outline-secondary btn-sm">+</button>
							</form>

						</div>

					</div>

					<!-- Price -->
					<div class="text-end">
						<div class="fw-bold text-danger">
							<fmt:formatNumber value="${item.product.price * item.quantity}" />
							đ
						</div>
						<form action="${pageContext.request.contextPath}/cart"
							method="post" class="d-inline">
							<input type="hidden" name="action" value="remove"> <input
								type="hidden" name="productId" value="${item.product.id}">
							<button class="btn btn-link text-danger p-0">
								<i class="bi bi-x-lg"></i>
							</button>
						</form>

					</div>
				</div>
			</c:forEach>
		</div>

		<!-- RIGHT: ORDER SUMMARY -->
		<div class="col-lg-4">
			<div class="border rounded p-3">

				<h5 class="mb-3">Thông tin đơn hàng</h5>

				<div class="d-flex justify-content-between mb-2">
					<span>Tạm tính:</span> <span class="fw-bold"> <fmt:formatNumber
							value="${subTotal}" type="number" />đ
					</span>
				</div>

				<div class="d-flex justify-content-between mb-2">
					<span>Giá giảm:</span> <span class="text-danger"> <fmt:formatNumber
							value="${discount}" type="number" />đ
					</span>
				</div>

				<hr>

				<div class="d-flex justify-content-between mb-3">
					<span class="fw-bold">Tổng cộng:</span> <span
						class="fw-bold text-danger fs-5"> <fmt:formatNumber
							value="${total}" />đ
					</span>
				</div>

				<!-- Note -->
				<div class="mb-3">
					<label class="form-label">Ghi chú đơn hàng</label>
					<textarea class="form-control" rows="3" placeholder="Ghi chú"></textarea>
				</div>

				<div class="form-check mb-3">
					<input class="form-check-input" type="checkbox"> <label
						class="form-check-label"> Thông tin xuất hoá đơn </label>
				</div>

				<c:if test="${cartCount > 0}">
					<c:if test="${empty sessionScope.account}">
						<a
							href="${pageContext.request.contextPath}/login?redirect=checkout"
							class="btn btn-danger w-100 mb-2"> THANH TOÁN NGAY </a>
					</c:if>

					<c:if test="${not empty sessionScope.account}">
						<form action="${pageContext.request.contextPath}/checkout"
							method="get">
							<button type="submit" class="btn btn-danger w-100 mb-2">
								THANH TOÁN NGAY</button>
						</form>
					</c:if>
				</c:if>

				<a href="${pageContext.request.contextPath}/home"
					class="d-block text-center text-decoration-none"> ← Tiếp tục
					mua hàng </a>

			</div>
		</div>
	</div>
</div>
