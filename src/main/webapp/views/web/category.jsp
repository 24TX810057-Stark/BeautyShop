<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!-- Breadcrumb -->
<div class="breadcrumb-custom">
	<a href="${pageContext.request.contextPath}/home"><i
		class="bi bi-house"></i> Trang chủ</a> <span class="mx-2">/</span> <span
		class="current">${not empty categoryName ? categoryName : 'Danh mục'}</span>
</div>

<div class="row">
	<!-- Sidebar Filter -->
	<div class="col-lg-3 col-md-4 mb-4">
		<div class="filter-sidebar">
			<div class="filter-sidebar__title">
				<i class="bi bi-funnel"></i> Bộ Lọc Sản Phẩm
			</div>

			<!-- Price Filter -->
			<div class="filter-group">
				<h6 class="filter-group__title">Khoảng giá</h6>
				<ul class="filter-group__list">
					<li><a href="#">Dưới 100.000đ</a></li>
					<li><a href="#">100.000đ - 300.000đ</a></li>
					<li><a href="#">300.000đ - 500.000đ</a></li>
					<li><a href="#">Trên 500.000đ</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- Product Grid -->
	<div class="col-lg-9 col-md-8">
		<!-- Sort Bar -->
		<div class="sort-bar">
			<div class="sort-bar__left">
				<span class="sort-bar__count"> <strong>${products.size()}</strong>
					sản phẩm
				</span>
			</div>

			<form method="get" class="sort-form">
				<input type="hidden" name="id" value="${param.id}"> <span>Sắp
					xếp:</span> <select name="sort" class="form-select form-select-sm"
					onchange="this.form.submit()">
					<option value="new" ${param.sort == 'new' ? 'selected' : ''}>Mới
						nhất</option>
					<option value="price_asc"
						${param.sort == 'price_asc' ? 'selected' : ''}>Giá thấp
						đến cao</option>
					<option value="price_desc"
						${param.sort == 'price_desc' ? 'selected' : ''}>Giá cao
						đến thấp</option>
				</select>
			</form>

		</div>

		<!-- Products Grid -->
		<div class="row">
			<c:choose>
				<c:when test="${empty products}">
					<div class="col-12">
						<div class="empty-state">
							<i class="bi bi-inbox"></i>
							<h5>Không có sản phẩm nào</h5>
							<p>Danh mục này hiện chưa có sản phẩm.</p>
							<a href="${pageContext.request.contextPath}/home"
								class="btn btn-primary">Quay về trang chủ</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="prod" items="${products}">
						<div class="col-6 col-md-4 col-lg-4 mb-4">
							<a href="${pageContext.request.contextPath}/product-detail?id=${prod.id}">
								<div class="product-card">
									<div class="product-card__thumb">
										<c:if test="${prod.salePrice > 0 && prod.price > 0}">
											<span class="product-card__badge"> - <fmt:formatNumber
													value="${(prod.price - prod.salePrice) / prod.price * 100}"
													maxFractionDigits="0" />%
											</span>
										</c:if>
										<c:choose>
											<c:when test="${not empty prod.image}">
												<img
													src="${pageContext.request.contextPath}/uploads/${prod.image}"
													alt="${prod.name}">
											</c:when>
											<c:otherwise>
												<div class="product-card__placeholder">
													<i class="bi bi-image"></i>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<h4 class="product-card__name">${prod.name}</h4>
									<div class="product-card__price">
										<c:choose>
											<c:when test="${prod.salePrice > 0}">
												<span class="product-card__price-current"> <fmt:formatNumber
														value="${prod.salePrice}" type="number" /> đ
												</span>
												<span class="product-card__price-old"> <fmt:formatNumber
														value="${prod.price}" type="number" />đ
												</span>
											</c:when>
											<c:otherwise>
												<span class="product-card__price-current"> <fmt:formatNumber
														value="${prod.price}" type="number" />đ
												</span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="product-card__buy">
										<a
											href="${pageContext.request.contextPath}/product-detail?id=${prod.id}"
											class="btn-buy">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>