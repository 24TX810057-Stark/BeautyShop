<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<h3>Chi tiết đơn hàng #${order.id}</h3>

<p>
	<b>Người nhận:</b> ${order.receiverName}
</p>
<p>
	<b>SĐT:</b> ${order.phone}
</p>
<p>
	<b>Địa chỉ:</b> ${order.address}
</p>
<p>
	<b>Tổng tiền:</b> ${order.totalAmount}
</p>

<hr>

<form
	action="${pageContext.request.contextPath}/manager/order/update-status"
	method="post">
	<input type="hidden" name="orderId" value="${order.id}"> <label>Trạng
		thái đơn hàng</label> <select name="status" class="form-select w-25">
		<option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>Đã
			đặt</option>
		<option value="PAID_CONFIRMED"
			${order.status == 'PAID_CONFIRMED' ? 'selected' : ''}>Đã xác
			nhận TT</option>
		<option value="WAITING_PICKUP"
			${order.status == 'WAITING_PICKUP' ? 'selected' : ''}>Chờ
			lấy hàng</option>
		<option value="DELIVERING"
			${order.status == 'DELIVERING' ? 'selected' : ''}>Đang giao</option>
		<option value="COMPLETED"
			${order.status == 'COMPLETED' ? 'selected' : ''}>Hoàn tất</option>
	</select>

	<button class="btn btn-success mt-3">Cập nhật</button>
</form>
