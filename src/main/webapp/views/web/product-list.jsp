<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

			<!-- Breadcrumb -->
			<div class="breadcrumb-custom">
				<a href="${pageContext.request.contextPath}/home"><i class="bi bi-house"></i> Trang chủ</a>
				<span class="mx-2">/</span>
				<span class="current">Tất cả sản phẩm</span>
			</div>

			<div class="row">
				<!-- Sidebar Filter -->
				<div class="col-lg-3 col-md-4 mb-4">
					<div class="filter-sidebar">
						<div class="filter-sidebar__title">
							<i class="bi bi-funnel"></i> Bộ Lọc Sản Phẩm
						</div>

						<!-- Categories -->
						<div class="filter-group">
							<h6 class="filter-group__title">Danh mục</h6>
							<ul class="filter-group__list">
								<li><a href="#">Chăm sóc da mặt</a></li>
								<li><a href="#">Trang điểm</a></li>
								<li><a href="#">Chăm sóc cơ thể</a></li>
								<li><a href="#">Chăm sóc tóc</a></li>
								<li><a href="#">Nước hoa</a></li>
							</ul>
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

						<!-- Brand Filter -->
						<div class="filter-group">
							<h6 class="filter-group__title">Thương hiệu</h6>
							<ul class="filter-group__list">
								<li><a href="#">Innisfree</a></li>
								<li><a href="#">The Face Shop</a></li>
								<li><a href="#">Laneige</a></li>
								<li><a href="#">Etude House</a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Product Grid -->
				<div class="col-lg-9 col-md-8">
					<!-- Header -->
					<div class="block-header">
						<div class="block-header__left">
							<h3 class="block-header__title"><i class="bi bi-grid"></i> Tất Cả Sản Phẩm</h3>
						</div>
					</div>

					<!-- Sort Bar -->
					<div class="sort-bar">
						<div class="sort-bar__left">
							<span class="sort-bar__count">
								<strong>8</strong> sản phẩm
							</span>
						</div>
						<div class="sort-bar__right">
							<span>Sắp xếp:</span>
							<select class="form-select form-select-sm">
								<option>Mới nhất</option>
								<option>Giá thấp đến cao</option>
								<option>Giá cao đến thấp</option>
								<option>Bán chạy nhất</option>
							</select>
						</div>
					</div>

					<!-- Products Grid -->
					<div class="row">
						<!-- Product 1 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<span class="product-card__badge">-25%</span>
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Serum dưỡng da Innisfree Green Tea</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">299,000đ</span>
									<span class="product-card__price-old">399,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-half"></i>
									</div>
									<span>Đã bán 128</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
						<!-- Product 2 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<span class="product-card__badge">-30%</span>
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Mặt nạ ngủ Laneige Water Sleeping</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">450,000đ</span>
									<span class="product-card__price-old">650,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
									</div>
									<span>Đã bán 256</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
						<!-- Product 3 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Toner COSRX AHA/BHA Clarifying</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">320,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star"></i>
									</div>
									<span>Đã bán 89</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
						<!-- Product 4 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<span class="product-card__badge">-20%</span>
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Son môi Maybelline SuperStay Matte</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">175,000đ</span>
									<span class="product-card__price-old">219,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-half"></i>
									</div>
									<span>Đã bán 312</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
						<!-- Product 5 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Kem dưỡng ẩm Klairs Rich Moist</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">480,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
									</div>
									<span>Đã bán 198</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
						<!-- Product 6 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<span class="product-card__badge">-15%</span>
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Kem chống nắng Anessa Perfect UV</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">550,000đ</span>
									<span class="product-card__price-old">650,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star"></i>
									</div>
									<span>Đã bán 456</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
						<!-- Product 7 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<span class="product-card__badge product-card__badge--new">NEW</span>
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Nước tẩy trang Bioderma Sensibio</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">350,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
									</div>
									<span>Đã bán 234</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
						<!-- Product 8 -->
						<div class="col-6 col-md-4 col-lg-3 mb-4">
							<div class="product-card">
								<div class="product-card__thumb">
									<span class="product-card__badge">-10%</span>
									<div class="product-card__placeholder">
										<i class="bi bi-image"></i>
									</div>
								</div>
								<h4 class="product-card__name">Cushion Clio Kill Cover Fixer</h4>
								<div class="product-card__price">
									<span class="product-card__price-current">378,000đ</span>
									<span class="product-card__price-old">420,000đ</span>
								</div>
								<div class="product-card__meta">
									<div class="product-card__rating">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star"></i>
									</div>
									<span>Đã bán 156</span>
								</div>
								<div class="product-card__buy">
									<a href="${pageContext.request.contextPath}/product-detail" class="btn-buy">Xem chi
										tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>