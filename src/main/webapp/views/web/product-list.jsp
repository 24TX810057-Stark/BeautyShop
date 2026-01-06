<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!-- Breadcrumb -->
<div class="breadcrumb-custom">
	<a href="${pageContext.request.contextPath}/home"><i
		class="bi bi-house"></i> Trang chủ</a> <span class="mx-2">/</span> <span
		class="current">Tất cả sản phẩm</span>
</div>

<div class="row">
	<!-- Sidebar Filter -->
	<div class="col-lg-3 col-md-4 mb-4">
		<div class="filter-sidebar">
			<div class="filter-sidebar__title">
				<i class="bi bi-funnel"></i> Bộ Lọc Sản Phẩm
			</div>

			<!-- Categories -->
			<c:if test="${not empty categories}">
				<div class="filter-group">
					<h6 class="filter-group__title">Danh mục</h6>
					<ul class="filter-group__list">
						<c:forEach var="cat" items="${categories}">
							<li><a
								href="${pageContext.request.contextPath}/category?id=${cat.id}">${cat.name}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>

			<!-- Price Filter -->
			<div class="filter-group">
				<h6 class="filter-group__title">Khoảng giá</h6>
				<ul class="filter-group__list">

					<li><a
						href="${pageContext.request.contextPath}/product?max=100000
                ${not empty param.sort ? '&sort=' += param.sort : ''}">
							Dưới 100.000đ </a></li>

					<li><a
						href="${pageContext.request.contextPath}/product?min=100000&max=300000
                ${not empty param.sort ? '&sort=' += param.sort : ''}">
							100.000đ - 300.000đ </a></li>

					<li><a
						href="${pageContext.request.contextPath}/product?min=300000&max=500000
                ${not empty param.sort ? '&sort=' += param.sort : ''}">
							300.000đ - 500.000đ </a></li>

					<li><a
						href="${pageContext.request.contextPath}/product?min=500000
                ${not empty param.sort ? '&sort=' += param.sort : ''}">
							Trên 500.000đ </a></li>

				</ul>
			</div>


		</div>
	</div>

	<!-- Product Grid -->
	<div class="col-lg-9 col-md-8">
		<!-- Header -->
		<div class="block-header">
			<div class="block-header__left">
				<h3 class="block-header__title">
					<i class="bi bi-grid"></i> Tất Cả Sản Phẩm
				</h3>
			</div>
		</div>

		<!-- Sort Bar -->
		<div class="sort-bar">
			<div class="sort-bar__left">
				<span class="sort-bar__count"> <strong>${products.size()}</strong>
					sản phẩm
				</span>
			</div>

			<form method="get" class="sort-bar__right">
				<span>Sắp xếp:</span>

				<!-- GIỮ cid nếu đang lọc theo category -->
				<c:if test="${not empty param.cid}">
					<input type="hidden" name="cid" value="${param.cid}">
				</c:if>

				<select name="sort" class="form-select form-select-sm"
					onchange="this.form.submit()">

					<option value="new"
						${param.sort == 'new' || empty param.sort ? 'selected' : ''}>
						Mới nhất</option>

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
							<p>Hiện chưa có sản phẩm trong hệ thống.</p>
							<a href="${pageContext.request.contextPath}/home"
								class="btn btn-primary">Quay về trang chủ</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="prod" items="${products}">
						<div class="col-6 col-md-4 col-lg-3 mb-4">
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