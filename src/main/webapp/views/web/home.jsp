<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!-- =============== PROMO BAR =============== -->
<div class="promo-bar">
	<div class="container">
		<div class="promo-bar__content">
			<span class="promo-item"><i class="bi bi-gift"></i> FREESHIP
				đơn từ 300K</span> <span class="promo-item"><i class="bi bi-percent"></i>
				Giảm 20% cho thành viên mới</span> <span class="promo-item"><i
				class="bi bi-star"></i> Tích điểm đổi quà hấp dẫn</span> <span
				class="promo-item"><i class="bi bi-shield-check"></i> Cam kết
				100% chính hãng</span>
		</div>
	</div>
</div>

<!-- =============== HERO SECTION: SIDEBAR + BANNER =============== -->
<section class="hero-section">
	<div class="row g-3">
		<!-- Category Sidebar -->
		<div class="col-lg-3 col-md-4">
			<div class="category-sidebar">
				<div class="category-sidebar__title">
					<i class="bi bi-grid-3x3-gap"></i> DANH MỤC SẢN PHẨM
				</div>
				<ul class="category-sidebar__list">
					<li><a href="#"><i class="bi bi-chevron-right"></i> Chăm
							sóc da mặt</a></li>
					<li><a href="#"><i class="bi bi-chevron-right"></i> Trang
							điểm</a></li>
					<li><a href="#"><i class="bi bi-chevron-right"></i> Chăm
							sóc cơ thể</a></li>
					<li><a href="#"><i class="bi bi-chevron-right"></i> Chăm
							sóc tóc</a></li>
					<li><a href="#"><i class="bi bi-chevron-right"></i> Nước
							hoa</a></li>
					<li><a href="#"><i class="bi bi-chevron-right"></i> Phụ
							kiện làm đẹp</a></li>
					<li><a href="#"><i class="bi bi-chevron-right"></i> Dược
							mỹ phẩm</a></li>
					<li><a href="#"><i class="bi bi-chevron-right"></i> Best
							Seller</a></li>
				</ul>
			</div>
		</div>

		<!-- Hero Banner -->
		<div class="col-lg-9 col-md-8">
			<div class="hero-banner">
				<div id="heroCarousel" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#heroCarousel"
							data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#heroCarousel"
							data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#heroCarousel"
							data-bs-slide-to="2"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="hero-banner__slide hero-banner__slide--1">
								<div class="hero-banner__content">
									<span class="hero-banner__tag">Hot Deal</span>
									<h2 class="hero-banner__title">Siêu Sale Cuối Năm</h2>
									<p class="hero-banner__desc">Giảm đến 50% tất cả sản phẩm
										chăm sóc da</p>
									<a href="#" class="btn btn-main">Mua Ngay</a>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="hero-banner__slide hero-banner__slide--2">
								<div class="hero-banner__content">
									<span class="hero-banner__tag">New Arrival</span>
									<h2 class="hero-banner__title">Bộ Sưu Tập Mới</h2>
									<p class="hero-banner__desc">Mỹ phẩm cao cấp từ Hàn Quốc</p>
									<a href="#" class="btn btn-main">Khám Phá</a>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="hero-banner__slide hero-banner__slide--3">
								<div class="hero-banner__content">
									<span class="hero-banner__tag">Best Seller</span>
									<h2 class="hero-banner__title">Top Sản Phẩm Bán Chạy</h2>
									<p class="hero-banner__desc">Được yêu thích nhất tháng 12</p>
									<a href="#" class="btn btn-main">Xem Ngay</a>
								</div>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#heroCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#heroCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- =============== CATEGORY ICONS =============== -->
<section class="section-padding">
	<div class="block-header">
		<div class="block-header__left">
			<h3 class="block-header__title">Danh Mục Nổi Bật</h3>
		</div>
	</div>
	<div class="category-icons">
		<div class="row justify-content-center">
			<div class="col-6 col-md-4 col-lg-2 mb-4">
				<a href="#" class="category-icon-card">
					<div class="category-icon-card__image">
						<i class="bi bi-droplet"
							style="font-size: 40px; color: var(--primary);"></i>
					</div>
					<p class="category-icon-card__name">Chăm sóc da</p>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-2 mb-4">
				<a href="#" class="category-icon-card">
					<div class="category-icon-card__image">
						<i class="bi bi-brush"
							style="font-size: 40px; color: var(--primary);"></i>
					</div>
					<p class="category-icon-card__name">Trang điểm</p>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-2 mb-4">
				<a href="#" class="category-icon-card">
					<div class="category-icon-card__image">
						<i class="bi bi-flower1"
							style="font-size: 40px; color: var(--primary);"></i>
					</div>
					<p class="category-icon-card__name">Nước hoa</p>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-2 mb-4">
				<a href="#" class="category-icon-card">
					<div class="category-icon-card__image">
						<i class="bi bi-scissors"
							style="font-size: 40px; color: var(--primary);"></i>
					</div>
					<p class="category-icon-card__name">Chăm sóc tóc</p>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-2 mb-4">
				<a href="#" class="category-icon-card">
					<div class="category-icon-card__image">
						<i class="bi bi-heart-pulse"
							style="font-size: 40px; color: var(--primary);"></i>
					</div>
					<p class="category-icon-card__name">Chăm sóc cơ thể</p>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-2 mb-4">
				<a href="#" class="category-icon-card">
					<div class="category-icon-card__image">
						<i class="bi bi-box-seam"
							style="font-size: 40px; color: var(--primary);"></i>
					</div>
					<p class="category-icon-card__name">Phụ kiện</p>
				</a>
			</div>
		</div>
	</div>
</section>

<!-- =============== FLASH SALE =============== -->
<section class="section-padding section-soft-bg">
	<div class="block-header">
		<div class="block-header__left">
			<h3 class="block-header__title">
				<i class="bi bi-lightning-charge-fill"></i> Flash Sale
			</h3>
			<span class="block-header__badge">Hot Deal</span>
			<div class="flashsale-timer">
				<span class="time-box" id="hours">00</span>: <span class="time-box"
					id="minutes">00</span>: <span class="time-box" id="seconds">00</span>
			</div>
		</div>
		<div class="block-header__view-all">
			<a href="#">Xem tất cả <i class="bi bi-arrow-right"></i></a>
		</div>
	</div>

	<div class="row">
		<c:forEach var="p" items="${productList}">

			<!-- Product 1 -->
			<div class="col-6 col-md-4 col-lg">
				<div class="product-card">

					<div class="product-card__thumb">
						<span class="product-card__badge">-30%</span>
						<!-- 	<div class="product-card__placeholder">
									<i class="bi bi-image"></i>
								</div> -->
						<!-- link ảnh sp thật -->
						<img src="${pageContext.request.contextPath}/uploads/${p.image}"
							class="product-card__img">



					</div>
					<div class="product-card__brand">Innisfree</div>

					<!-- <h4 class="product-card__name">Serum dưỡng da Green Tea Seed</h4> -->

					<h4 class="product-card__name">${p.name}</h4>

					<div class="product-card__price">
						<!-- <span class="product-card__price-current">299,000đ</span>  -->

						<span class="product-card__price-current"> <fmt:formatNumber
								value="${p.saleprice}" type="number" />đ
						</span>
						<!-- <span class="product-card__price-old">429,000đ</span> -->
						<span class="product-card__price-old"> <fmt:formatNumber
								value="${p.price}" type="number" />đ
						</span>


					</div>
					<div class="product-card__meta">
						<div class="product-card__rating">
							<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
								class="bi bi-star-half"></i>
						</div>
						<span>Đã bán 128</span>
					</div>

					<div class="product-card__buy">
						<a
							href="${pageContext.request.contextPath}/product/detail?id=${p.id}"
							class="btn-buy"> Xem chi tiết </a>
					</div>
				</div>

			</div>

		</c:forEach>
	</div>

	<!-- =============== FEATURED PRODUCTS =============== -->
	<section class="section-padding">
		<div class="block-header">
			<div class="block-header__left">
				<h3 class="block-header__title">
					<i class="bi bi-fire"></i> Sản Phẩm Nổi Bật
				</h3>
				<span class="block-header__badge">Best Seller</span>
			</div>
			<div class="block-header__view-all">
				<a href="#">Xem tất cả <i class="bi bi-arrow-right"></i></a>
			</div>
		</div>

		<div class="row">
			<c:forEach var="p" items="${featuredList}">

				<div class="col-6 col-md-4 col-lg-2-4 mb-4">
					<div class="product-card">

						<div class="product-card__thumb">
							<img src="${pageContext.request.contextPath}/uploads/${p.image}"
								class="product-card__img">
						</div>

						<h4 class="product-card__name">${p.name}</h4>

						<div class="product-card__price">
							<span class="product-card__price-current"> <fmt:formatNumber
									value="${p.salePrice}" type="number" />đ
							</span>

							<c:if test="${p.salePrice > 0}">
								<span class="product-card__price-old"> <fmt:formatNumber
										value="${p.price}" type="number" />đ
								</span>
							</c:if>
						</div>

						<div class="product-card__buy">
							<a
								href="${pageContext.request.contextPath}/product/detail?id=${p.id}"
								class="btn-buy">Mua ngay</a>
						</div>

					</div>
				</div>

			</c:forEach>
		</div>
	</section>


	<!-- =============== NEW ARRIVALS =============== -->
	<section class="section-padding section-soft-bg">
	<div class="block-header">
		<div class="block-header__left">
			<h3 class="block-header__title">
				<i class="bi bi-box-seam"></i> Sản Phẩm Mới
			</h3>
			<span class="block-header__badge block-header__badge--new">New</span>
		</div>
		<div class="block-header__view-all">
			<a href="#">Xem tất cả <i class="bi bi-arrow-right"></i></a>
		</div>
	</div>

	<div class="row">
		<c:forEach var="p" items="${newList}">

			<div class="col-6 col-md-4 col-lg mb-4">
				<div class="product-card product-card--new">

					<div class="product-card__thumb">
						<span class="product-card__badge product-card__badge--new">NEW</span>
						<img src="${pageContext.request.contextPath}/uploads/${p.image}"
							 class="product-card__img">
					</div>

					<h4 class="product-card__name">${p.name}</h4>

					<div class="product-card__price">
						<span class="product-card__price-current">
							<fmt:formatNumber value="${p.price}" type="number"/>đ
						</span>
					</div>

					<div class="product-card__buy">
						<a href="${pageContext.request.contextPath}/product/detail?id=${p.id}"
						   class="btn-buy">Xem chi tiết</a>
					</div>

				</div>
			</div>

		</c:forEach>
	</div>
</section>


	<!-- Flash Sale Countdown Script -->
	<script>
		function updateCountdown() {
			const now = new Date();
			const endOfDay = new Date();
			endOfDay.setHours(23, 59, 59, 999);

			const diff = endOfDay - now;

			const hours = Math.floor(diff / (1000 * 60 * 60));
			const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
			const seconds = Math.floor((diff % (1000 * 60)) / 1000);

			document.getElementById('hours').textContent = hours.toString()
					.padStart(2, '0');
			document.getElementById('minutes').textContent = minutes.toString()
					.padStart(2, '0');
			document.getElementById('seconds').textContent = seconds.toString()
					.padStart(2, '0');
		}

		setInterval(updateCountdown, 1000);
		updateCountdown();
	</script>