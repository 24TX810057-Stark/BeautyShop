<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<c:set var="s" value="${order.status}" />

<div class="shopee-stepbar">

	<!-- Đã đặt -->
	<div class="step active">
		<div class="icon">📝</div>
		<div class="label">Đã đặt hàng</div>
	</div>

	<div class="line ${s != 'PENDING' ? 'active' : ''}"></div>

	<!-- Đã thanh toán -->
	<div
		class="step ${s == 'PAID_CONFIRMED' || s == 'WAITING_PICKUP' || s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}">
		<div class="icon">💰</div>
		<div class="label">Đã thanh toán</div>
	</div>

	<div
		class="line ${s == 'WAITING_PICKUP' || s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}"></div>

	<!-- Đã bàn giao -->
	<div
		class="step ${s == 'WAITING_PICKUP' || s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}">
		<div class="icon">📦</div>
		<div class="label">Đã bàn giao đơn vị vận chuyển</div>
	</div>

	<div
		class="line ${s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}"></div>

	<!-- Đang giao -->
	<div
		class="step ${s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}">

		<div class="icon">🚚</div>
		<div class="label">Đang giao hàng</div>
	</div>

	<div class="line ${s == 'COMPLETED' ? 'active' : ''}"></div>

	<!-- Hoàn thành -->
	<div class="step ${s == 'COMPLETED' ? 'active' : ''}">
		<div class="icon">⭐</div>
		<div class="label">Hoàn thành</div>
	</div>

</div>

<!-- ===== MÔ TẢ TRẠNG THÁI ===== -->
<p class="order-status-desc">${order.statusText}</p>
<!-- ===== HỦY ĐƠN ===== -->
<c:if test="${order.status != 'DELIVERING' && order.status != 'COMPLETED'}">
	<p class="order-cancel-note">
		Hủy đơn hàng, vui lòng liên hệ <b>Hotline 1900 1234</b>
	</p>
</c:if>
<!-- ======== CHI TIẾT ĐƠN HÀNG (2 CỘT) =============== -->
<div class="order-wrapper">

	<!-- LEFT: DANH SÁCH SẢN PHẨM -->
	<div class="order-left">
		<h3>Sản phẩm</h3>

		<c:forEach items="${order.items}" var="item">

			<div class="order-item">
				<div class="order-item-thumb">
					<img src="${pageContext.request.contextPath}/uploads/${item.image}"
						alt="${item.productName}" />
				</div>

				<div class="order-item-info">
					<div class="name">${item.productName}</div>
					<div class="meta">
						<fmt:formatNumber value="${item.price}" type="currency" />
						× ${item.quantity}
					</div>
				</div>
			</div>


		</c:forEach>

	</div>

	<!-- RIGHT: TÓM TẮT ĐƠN HÀNG -->
	<div class="order-right">
		<h3>Tóm tắt đơn hàng</h3>

		<div class="summary-row">
			<span>Mã đơn</span> <span>#${order.id}</span>
		</div>

		<div class="summary-row">
			<span>Ngày đặt</span> <span> <fmt:formatDate
					value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" />
			</span>
		</div>

		<div class="summary-row total">
			<span>Tổng tiền</span> <span> <fmt:formatNumber
					value="${order.totalAmount}" type="currency" />
			</span>
		</div>
	</div>

</div>
