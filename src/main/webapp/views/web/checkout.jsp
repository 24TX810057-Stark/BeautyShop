<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<form action="${pageContext.request.contextPath}/checkout" method="post">
	<div class="container my-4">
		<div class="row">

			<!-- LEFT -->
			<div class="col-lg-7">
				<c:if test="${not empty sessionScope.user}">
					<div class="card mb-3 p-3">
						Xin chào, <b>${sessionScope.user.fullName}</b>
					</div>
				</c:if>

				<!-- Shipping info -->
				<div class="card mb-3 p-3">
					<h6 class="mb-3">Thông tin giao hàng</h6>

					<input class="form-control mb-2" name="receiverName"
						value="${sessionScope.user.fullName}" placeholder="Nhập họ và tên">

					<input class="form-control mb-2" name="phone"
						value="${sessionScope.user.phone}"
						
						placeholder="Nhập số điện thoại"> <input
						class="form-control mb-2" name="email"
						value="${sessionScope.user.email}"						
						placeholder="Nhập email (không bắt buộc)"> <input
						class="form-control mb-2" name="address"
						placeholder="Địa chỉ, tên đường" required> <input
						class="form-control mb-2" name="ward"
						placeholder="Phường/Xã, Tỉnh/TP" required>

					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if>

				</div>

				<!-- Payment method -->
				<div class="card mb-3 p-3">
					<h6 class="mb-3">Phương thức thanh toán</h6>

					<div class="form-check mb-2">
						<input class="form-check-input" type="radio" name="payment"
							checked> <label class="form-check-label"> Thanh
							toán khi giao hàng (COD) </label>
					</div>

					<div class="form-check mb-2">
						<input class="form-check-input" type="radio" name="payment">
						<label class="form-check-label"> Thanh toán online qua ví
							MoMo </label>
					</div>

				</div>

				<!-- Note -->
				<div class="card p-3">
					<textarea name="Note" class="form-control" rows="3"
						placeholder="Ghi chú đơn hàng"></textarea>
				</div>

			</div>

			<!-- RIGHT -->
			<div class="col-lg-5">

				<!-- Cart summary -->
				<div class="card mb-3 p-3">
					<h6 class="mb-3">Giỏ hàng</h6>

					<c:forEach var="item" items="${cart}">
						<div class="d-flex mb-2">
							<img
								src="${pageContext.request.contextPath}/uploads/${item.product.image}"
								style="width: 60px; height: 60px; object-fit: cover"
								class="me-2">
							<div>
								<div class="fw-semibold">${item.product.name}</div>
								<div class="small text-muted">x ${item.quantity}</div>
								<div class="text-danger">
									<fmt:formatNumber value="${item.product.price}" />
									đ
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- Order summary -->
				<div class="card p-3">
					<h6 class="mb-3">Tóm tắt đơn hàng</h6>

					<div class="d-flex justify-content-between mb-2">
						<span>Tổng tiền hàng</span> <span><fmt:formatNumber
								value="${subTotal}" />đ</span>
					</div>

					<div class="d-flex justify-content-between mb-2">
						<span>Phí vận chuyển</span> <span>-</span>
					</div>

					<hr>

					<div class="d-flex justify-content-between fw-bold mb-3">
						<span>Tổng thanh toán</span> <span class="text-danger fs-5">
							<fmt:formatNumber value="${total}" />đ
						</span>
					</div>

					<button type="submit" class="btn btn-danger w-100">ĐẶT
						HÀNG</button>

				</div>

			</div>
		</div>
	</div>
</form>