<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<h3>Quản lý đơn hàng <span class="badge bg-primary">${totalItems} đơn</span></h3>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>ID</th>
					<th>Người đặt</th>
					<th>Tổng tiền</th>
					<th>Trạng thái</th>
					<th>Ngày tạo</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="o">
					<tr>
						<td>#${o.id}</td>
						<td>${o.receiverName}</td>
						<td>${o.totalAmount}</td>
						<td>${o.status}</td>
						<td>${o.createdAt}</td>
						<td><a class="btn btn-sm btn-primary"
								href="${pageContext.request.contextPath}/manager/order-detail?id=${o.id}">
								Chi tiết </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<%-- Pagination --%>
			<jsp:include page="/common/manager/pagination.jsp" />