<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

			<title>Chi tiết Đơn hàng ${order.id}</title>

			<div class="container-fluid">
				<!-- Header -->
				<div class="d-flex justify-content-between align-items-center mb-4">
					<div>
						<h4 class="mb-1"><i class="bi bi-receipt me-2"></i>Chi tiết Đơn hàng ${order.id}</h4>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/manager/home">Dashboard</a></li>
								<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/manager/orders">Đơn hàng</a></li>
								<li class="breadcrumb-item active">${order.id}</li>
							</ol>
						</nav>
					</div>
					<a href="${pageContext.request.contextPath}/manager/orders" class="btn btn-outline-secondary">
						<i class="bi bi-arrow-left me-1"></i>Quay lại
					</a>
				</div>

				<div class="row">
					<!-- Order Info -->
					<div class="col-lg-8">
						<!-- Customer Info Card -->
						<div class="card shadow-sm mb-4">
							<div class="card-header bg-white py-3">
								<h6 class="mb-0 fw-semibold">
									<i class="bi bi-person me-2"></i>Thông tin người nhận
								</h6>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-6 mb-3">
										<label class="form-label text-muted small">Họ tên</label>
										<p class="mb-0 fw-semibold">${order.receiverName}</p>
									</div>
									<div class="col-md-6 mb-3">
										<label class="form-label text-muted small">Số điện thoại</label>
										<p class="mb-0"><i class="bi bi-phone me-1"></i>${order.phone}</p>
									</div>
									<div class="col-12 mb-3">
										<label class="form-label text-muted small">Địa chỉ giao hàng</label>
										<p class="mb-0"><i class="bi bi-geo-alt me-1"></i>${order.address}
											<c:if test="${not empty order.ward}">, ${order.ward}</c:if>
										</p>
									</div>
									<div class="col-md-6">
										<label class="form-label text-muted small">Ngày đặt hàng</label>
										<p class="mb-0"><i class="bi bi-calendar me-1"></i>
											<fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm" />
										</p>
									</div>
									<div class="col-md-6">
										<label class="form-label text-muted small">Trạng thái hiện tại</label>
										<p class="mb-0">
											<c:choose>
												<c:when test="${order.status == 'PENDING'}">
													<span class="badge bg-warning text-dark"><i
															class="bi bi-clock me-1"></i>Chờ xử lý</span>
												</c:when>
												<c:when test="${order.status == 'PAID_CONFIRMED'}">
													<span class="badge bg-info"><i class="bi bi-credit-card me-1"></i>Đã
														xác nhận TT</span>
												</c:when>
												<c:when test="${order.status == 'WAITING_PICKUP'}">
													<span class="badge bg-secondary"><i
															class="bi bi-box-seam me-1"></i>Chờ lấy hàng</span>
												</c:when>
												<c:when test="${order.status == 'DELIVERING'}">
													<span class="badge bg-primary"><i class="bi bi-truck me-1"></i>Đang
														giao</span>
												</c:when>
												<c:when test="${order.status == 'COMPLETED'}">
													<span class="badge bg-success"><i
															class="bi bi-check-circle me-1"></i>Hoàn tất</span>
												</c:when>
												<c:when test="${order.status == 'CANCELLED'}">
													<span class="badge bg-danger"><i class="bi bi-x-circle me-1"></i>Đã
														hủy</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-secondary">${order.status}</span>
												</c:otherwise>
											</c:choose>
										</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Order Items Card -->
						<div class="card shadow-sm">
							<div class="card-header bg-white py-3">
								<h6 class="mb-0 fw-semibold">
									<i class="bi bi-bag me-2"></i>Sản phẩm đặt mua
								</h6>
							</div>
							<div class="card-body p-0">
								<div class="table-responsive">
									<table class="table table-hover align-middle mb-0">
										<thead class="table-light">
											<tr>
												<th style="width: 80px;">Ảnh</th>
												<th>Sản phẩm</th>
												<th class="text-end">Đơn giá</th>
												<th class="text-center">SL</th>
												<th class="text-end">Thành tiền</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${order.items}">
												<tr>
													<td>
														<c:choose>
															<c:when test="${not empty item.image}">
																<img src="${pageContext.request.contextPath}/uploads/${item.image}"
																	alt="${item.productName}" class="rounded"
																	style="width: 60px; height: 60px; object-fit: cover;">
															</c:when>
															<c:otherwise>
																<div class="bg-light rounded d-flex align-items-center justify-content-center"
																	style="width: 60px; height: 60px;">
																	<i class="bi bi-image text-muted"></i>
																</div>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<span class="fw-semibold">${item.productName}</span>
													</td>
													<td class="text-end">
														<fmt:formatNumber value="${item.price}" type="number"
															groupingUsed="true" />đ
													</td>
													<td class="text-center">
														<span class="badge bg-secondary">${item.quantity}</span>
													</td>
													<td class="text-end fw-semibold">
														<fmt:formatNumber value="${item.price * item.quantity}"
															type="number" groupingUsed="true" />đ
													</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot class="table-light">
											<tr>
												<td colspan="4" class="text-end fw-semibold">Tổng cộng:</td>
												<td class="text-end">
													<span class="fs-5 fw-bold text-primary">
														<fmt:formatNumber value="${order.totalAmount}" type="number"
															groupingUsed="true" />đ
													</span>
												</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- Update Status -->
					<div class="col-lg-4">
						<div class="card shadow-sm">
							<div class="card-header bg-white py-3">
								<h6 class="mb-0 fw-semibold">
									<i class="bi bi-gear me-2"></i>Cập nhật trạng thái
								</h6>
							</div>
							<div class="card-body">
								<form action="${pageContext.request.contextPath}/manager/order/update-status"
									method="post">
									<input type="hidden" name="orderId" value="${order.id}">

									<div class="mb-3">
										<label class="form-label">Trạng thái đơn hàng</label>
										<select name="status" class="form-select">
											<option value="PENDING" ${order.status=='PENDING' ? 'selected' : '' }>
												⏳ Chờ xử lý
											</option>
											<option value="PAID_CONFIRMED" ${order.status=='PAID_CONFIRMED' ? 'selected'
												: '' }>
												💳 Đã xác nhận thanh toán
											</option>
											<option value="WAITING_PICKUP" ${order.status=='WAITING_PICKUP' ? 'selected'
												: '' }>
												📦 Chờ lấy hàng
											</option>
											<option value="DELIVERING" ${order.status=='DELIVERING' ? 'selected' : '' }>
												🚚 Đang giao hàng
											</option>
											<option value="COMPLETED" ${order.status=='COMPLETED' ? 'selected' : '' }>
												✅ Hoàn tất
											</option>
											<option value="CANCELLED" ${order.status=='CANCELLED' ? 'selected' : '' }>
												❌ Đã hủy
											</option>
										</select>
									</div>

									<button type="submit" class="btn btn-primary w-100">
										<i class="bi bi-check-lg me-1"></i>Cập nhật trạng thái
									</button>
								</form>
							</div>
						</div>

						<!-- Order Summary -->
						<div class="card shadow-sm mt-4">
							<div class="card-header bg-white py-3">
								<h6 class="mb-0 fw-semibold">
									<i class="bi bi-info-circle me-2"></i>Tóm tắt
								</h6>
							</div>
							<div class="card-body">
								<div class="d-flex justify-content-between mb-2">
									<span class="text-muted">Mã đơn hàng:</span>
									<span class="fw-semibold">${order.id}</span>
								</div>
								<div class="d-flex justify-content-between mb-2">
									<span class="text-muted">Số sản phẩm:</span>
									<span class="fw-semibold">${order.items.size()}</span>
								</div>
								<hr>
								<div class="d-flex justify-content-between">
									<span class="text-muted">Tổng thanh toán:</span>
									<span class="fs-5 fw-bold text-primary">
										<fmt:formatNumber value="${order.totalAmount}" type="number"
											groupingUsed="true" />đ
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>