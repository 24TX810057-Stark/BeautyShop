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

<!-- =============== HERO SECTION =============== -->
<section class="hero-section">
	<div class="row g-3">
		<!-- Category Sidebar -->
		<div class="col-lg-3 col-md-4">
			<div class="category-sidebar">
				<div class="category-sidebar__title">
					<i class="bi bi-grid-3x3-gap"></i> DANH MỤC SẢN PHẨM
				</div>

				<ul class="category-sidebar__list">
					<c:forEach var="cat" items="${categories}">
						<c:if test="${cat.id != 6}">
							<li><a
								href="${pageContext.request.contextPath}/product?cid=${cat.id}">
									<i class="bi bi-chevron-right"></i> ${cat.name}
							</a></li>
						</c:if>
					</c:forEach>
				</ul>

			</div>
		</div>

		<!-- Hero Banner -->
		<div class="col-lg-9 col-md-8">
			<div class="hero-banner">
				<div id="heroCarousel" class="carousel slide"
					data-bs-ride="carousel">

					<!-- INDICATORS (chấm chia trang) -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#heroCarousel"
							data-bs-slide-to="0" class="active" aria-current="true"></button>
						<button type="button" data-bs-target="#heroCarousel"
							data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#heroCarousel"
							data-bs-slide-to="2"></button>
					</div>

					<!-- SLIDES -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/assets/images/banner-1.png"
								class="d-block w-100 hero-banner__img" alt="Banner 1">
						</div>

						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/assets/images/banner-2.png"
								class="d-block w-100 hero-banner__img" alt="Banner 2">
						</div>

						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/assets/images/banner-3.png"
								class="d-block w-100 hero-banner__img" alt="Banner 3">
						</div>
					</div>

					<!-- NÚT PREV / NEXT -->
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
				<a
					href="${pageContext.request.contextPath}/product?type=best-seller"
					class="category-icon-card best-seller-card">
					<div class="category-icon-card__image">
						<img
							src="${pageContext.request.contextPath}/assets/images/best-seller.png"
							alt="Best Seller">
					</div>
					<p class="category-icon-card__name">Best Seller</p>
				</a>
			</div>

			<c:forEach var="cat" items="${categories}">
				<c:if test="${cat.id != 6}">
					<div class="col-6 col-md-4 col-lg-2 mb-4">
						<a href="${pageContext.request.contextPath}/product?cid=${cat.id}"
							class="category-icon-card">
							<div class="category-icon-card__image">
								<c:choose>
									<c:when test="${not empty cat.image}">
										<img
											src="${pageContext.request.contextPath}/uploads/${cat.image}"
											alt="${cat.name}">
									</c:when>
									<c:otherwise>
										<i class="bi bi-box-seam"
											style="font-size: 40px; color: var(--primary);"></i>
									</c:otherwise>
								</c:choose>
							</div>
							<p class="category-icon-card__name">${cat.name}</p>
						</a>
					</div>
				</c:if>
			</c:forEach>

		</div>
	</div>
</section>

<!-- =============== FLASH SALE =============== -->
<c:if test="${not empty flashSaleProducts}">
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
				<a href="${pageContext.request.contextPath}/product">Xem tất cả
					<i class="bi bi-arrow-right"></i>
				</a>
			</div>
		</div>

		<div class="row">
			<c:forEach var="prod" items="${flashSaleProducts}">
				<div class="col-6 col-md-4 col-lg-3 mb-4">
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
							<span class="product-card__price-current"> <fmt:formatNumber
									value="${prod.salePrice}" type="number" />đ
							</span> <span class="product-card__price-old"> <fmt:formatNumber
									value="${prod.price}" type="number" />đ
							</span>
						</div>
						<div class="product-card__buy">
							<a
								href="${pageContext.request.contextPath}/product-detail?id=${prod.id}"
								class="btn-buy">Xem chi tiết</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</c:if>

<!-- =============== FEATURED PRODUCTS =============== -->
<c:if test="${not empty featuredProducts}">
	<section class="section-padding">
		<div class="block-header">
			<div class="block-header__left">
				<h3 class="block-header__title">
					<i class="bi bi-fire"></i> Sản Phẩm Nổi Bật
				</h3>
				<span class="block-header__badge">Best Seller</span>
			</div>
			<div class="block-header__view-all">
				<a href="${pageContext.request.contextPath}/product">Xem tất cả
					<i class="bi bi-arrow-right"></i>
				</a>
			</div>
		</div>

		<div class="row">
			<c:forEach var="prod" items="${featuredProducts}">
				<div class="col-6 col-md-4 col-lg-3 mb-4">
					<div class="product-card">
						<div class="product-card__thumb">
							<c:if test="${prod.salePrice > 0}">
								<span class="product-card__badge">Sale</span>
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
											value="${prod.salePrice}" type="number" />đ
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
								class="btn-buy">Mua ngay</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</c:if>

<!-- =============== NEW ARRIVALS =============== -->
<c:if test="${not empty newProducts}">
	<section class="section-padding section-soft-bg">
		<div class="block-header">
			<div class="block-header__left">
				<h3 class="block-header__title">
					<i class="bi bi-box-seam"></i> Sản Phẩm Mới
				</h3>
				<span class="block-header__badge block-header__badge--new">New</span>
			</div>
			<div class="block-header__view-all">
				<a href="${pageContext.request.contextPath}/product">Xem tất cả
					<i class="bi bi-arrow-right"></i>
				</a>
			</div>
		</div>

		<div class="row">
			<c:forEach var="prod" items="${newProducts}">
				<div class="col-6 col-md-4 col-lg-3 mb-4">
					<div class="product-card product-card--new">
						<div class="product-card__thumb">
							<span class="product-card__badge product-card__badge--new">NEW</span>
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
											value="${prod.salePrice}" type="number" />đ
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
				</div>
			</c:forEach>
		</div>
	</section>
</c:if>

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