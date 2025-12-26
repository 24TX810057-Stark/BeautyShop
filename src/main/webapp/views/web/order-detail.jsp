<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<c:set var="s" value="${order.status}" />

<div class="shopee-stepbar">

	<div class="step ${s != 'PENDING' ? 'active' : 'active'}">
		<div class="icon">📝</div>
		<div class="label">Đơn Hàng Đã Đặt</div>
	</div>

	<div class="line ${s != 'PENDING' ? 'active' : ''}"></div>

	<div
		class="step ${s == 'PAID_CONFIRMED' || s == 'WAITING_PICKUP' || s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}">
		<div class="icon">💰</div>
		<div class="label">Đã Thanh Toán</div>
	</div>

	<div
		class="line ${s == 'WAITING_PICKUP' || s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}"></div>

	<div
		class="step ${s == 'WAITING_PICKUP' || s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}">
		<div class="icon">📦</div>
		<div class="label">Đã Giao Cho ĐVVC</div>
	</div>

	<div
		class="line ${s == 'DELIVERING' || s == 'COMPLETED' ? 'active' : ''}"></div>

	<div class="step ${s == 'DELIVERING' ? 'active current' : ''}">
		<div class="icon">🚚</div>
		<div class="label">Chờ Giao Hàng</div>
	</div>

	<div class="line ${s == 'COMPLETED' ? 'active' : ''}"></div>

	<div class="step ${s == 'COMPLETED' ? 'active' : ''}">
		<div class="icon">⭐</div>
		<div class="label">Đánh Giá</div>
	</div>

</div>

<!-- ===== MÔ TẢ TRẠNG THÁI ===== -->
<p class="order-status-desc">
	<c:choose>
		<c:when test="${s == 'PENDING'}">
            Đơn hàng đã được đặt. Vui lòng chờ xác nhận.
        </c:when>
		<c:when test="${s == 'PAID_CONFIRMED'}">
            Đơn hàng đã được xác nhận thanh toán.
        </c:when>
		<c:when test="${s == 'WAITING_PICKUP'}">
            Người bán đang chuẩn bị hàng.
        </c:when>
		<c:when test="${s == 'DELIVERING'}">
            Đơn hàng đang được giao đến bạn.
        </c:when>
		<c:when test="${s == 'COMPLETED'}">
            Đơn hàng đã giao thành công.
        </c:when>
	</c:choose>
</p>

<!-- ================= CHI TIẾT ĐƠN HÀNG ================= -->
<div class="order-box">
	<h3>Chi tiết đơn hàng #${order.id}</h3>

	<p>
		Ngày đặt:
		<fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" />
	</p>

	<p>
		<b>Tổng tiền:</b>
		<fmt:formatNumber value="${order.totalAmount}" type="currency" />
	</p>

	<table class="order-table">
		<tr>
			<th>Sản phẩm</th>
			<th>Giá</th>
			<th>Số lượng</th>
			<th>Tạm tính</th>
		</tr>

		<c:forEach items="${order.items}" var="item">
			<tr>
				<td>${item.productName}</td>
				<td><fmt:formatNumber value="${item.price}" type="currency" />
				</td>
				<td>${item.quantity}</td>
				<td><fmt:formatNumber value="${item.price * item.quantity}"
						type="currency" /></td>
			</tr>
		</c:forEach>
	</table>
</div>
