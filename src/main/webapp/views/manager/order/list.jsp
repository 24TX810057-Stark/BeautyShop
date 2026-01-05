<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

			<title>Quản lý Đơn hàng</title>

			<div class="container-fluid">
				<!-- Header -->
				<div class="d-flex justify-content-between align-items-center mb-4">
					<div>
						<h4 class="mb-1"><i class="bi bi-cart-check me-2"></i>Quản lý Đơn hàng</h4>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
								<li class="breadcrumb-item active">Đơn hàng</li>
							</ol>
						</nav>
					</div>
				</div>

				<!-- Alert Message -->
				<c:if test="${not empty message}">
					<div class="alert alert-${messageType} alert-dismissible fade show" role="alert">
						<i class="bi bi-${messageType == 'success' ? 'check-circle' : 'exclamation-triangle'} me-2"></i>
						${message}
						<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
					</div>
				</c:if>

				<!-- Orders Table -->
				<div class="card shadow-sm">
					<div class="card-header bg-white py-3">
						<div class="row align-items-center">
							<div class="col">
								<h6 class="mb-0 fw-semibold">
									<i class="bi bi-list-ul me-2"></i>Danh sách Đơn hàng
								</h6>
							</div>
							<div class="col-auto">
								<span class="badge bg-primary">${totalItems} đơn hàng</span>
							</div>
						</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<table class="table table-hover align-middle mb-0">
								<thead class="table-light">
									<tr>
										<th style="width: 80px;">Mã đơn</th>
										<th>Người nhận</th>
										<th>Điện thoại</th>
										<th class="text-end">Tổng tiền</th>
										<th class="text-center">Trạng thái</th>
										<th>Ngày đặt</th>
										<th style="width: 100px;" class="text-center">Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty orders}">
											<tr>
												<td colspan="7" class="text-center py-5">
													<div class="text-muted">
														<i class="bi bi-inbox display-4 d-block mb-3"></i>
														Chưa có đơn hàng nào
													</div>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="o" items="${orders}">
												<tr>
													<td><span class="badge bg-secondary">${o.id}</span></td>
													<td>
														<span class="fw-semibold">${o.receiverName}</span>
														<c:if test="${not empty o.address}">
															<br><small class="text-muted"><i
																	class="bi bi-geo-alt me-1"></i>${o.address}</small>
														</c:if>
													</td>
													<td>
														<i class="bi bi-phone me-1 text-muted"></i>${o.phone}
													</td>
													<td class="text-end">
														<span class="fw-semibold text-primary">
															<fmt:formatNumber value="${o.totalAmount}" type="number"
																groupingUsed="true" />đ
														</span>
													</td>
													<td class="text-center">
														<c:choose>
															<c:when test="${o.status == 'PENDING'}">
																<span class="badge bg-warning text-dark"><i
																		class="bi bi-clock me-1"></i>Chờ xử lý</span>
															</c:when>
															<c:when test="${o.status == 'CONFIRMED'}">
																<span class="badge bg-info"><i
																		class="bi bi-check me-1"></i>Đã xác nhận</span>
															</c:when>
															<c:when test="${o.status == 'SHIPPING'}">
																<span class="badge bg-primary"><i
																		class="bi bi-truck me-1"></i>Đang giao</span>
															</c:when>
															<c:when test="${o.status == 'COMPLETED'}">
																<span class="badge bg-success"><i
																		class="bi bi-check-circle me-1"></i>Hoàn
																	thành</span>
															</c:when>
															<c:when test="${o.status == 'CANCELLED'}">
																<span class="badge bg-danger"><i
																		class="bi bi-x-circle me-1"></i>Đã hủy</span>
															</c:when>
															<c:otherwise>
																<span class="badge bg-secondary">${o.status}</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<small class="text-muted">
															<i class="bi bi-calendar me-1"></i>
															<fmt:formatDate value="${o.createdAt}"
																pattern="dd/MM/yyyy HH:mm" />
														</small>
													</td>
													<td class="text-center">
														<a href="${pageContext.request.contextPath}/manager/order-detail?id=${o.id}"
															class="btn btn-sm btn-outline-primary" title="Chi tiết">
															<i class="bi bi-eye me-1"></i>Xem
														</a>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>

					<%-- Pagination --%>
						<div class="card-footer bg-white">
							<jsp:include page="/common/manager/pagination.jsp" />
						</div>
				</div>
			</div>