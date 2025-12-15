<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<c:if test="${not empty product}">
	<!-- Breadcrumb -->
	<div class="breadcrumb-custom">
		<a href="${pageContext.request.contextPath}/home"><i
			class="bi bi-house"></i> Trang chủ</a> <span class="mx-2">/</span> <a
			href="${pageContext.request.contextPath}/product">Sản phẩm</a> <span
			class="mx-2">/</span> <span class="current">${product.name}</span>
	</div>

	<div class="row">
		<!-- Product Gallery -->
		<div class="col-lg-5 col-md-6 mb-4">
			<div class="product-gallery">
				<div class="product-gallery__main">
					<c:choose>
						<c:when test="${not empty product.image}">
							<img
								src="${pageContext.request.contextPath}/assets/images/${product.image}"
								alt="${product.name}" id="mainImage">
						</c:when>
						<c:otherwise>
							<div class="product-gallery__placeholder">
								<i class="bi bi-image"></i>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<!-- Product Info -->
		<div class="col-lg-7 col-md-6">
			<div class="product-info">
				<h1 class="product-info__name">${product.name}</h1>

				<!-- Price Box -->
				<div class="product-info__price-box">
					<c:choose>
						<c:when test="${product.salePrice > 0}">
							<span class="product-info__price-current"> <fmt:formatNumber
									value="${product.salePrice}" type="number" />đ
							</span>
							<span class="product-info__price-old"> <fmt:formatNumber
									value="${product.price}" type="number" />đ
							</span>
							<span class="product-info__discount"> - <fmt:formatNumber
									value="${(product.price - product.salePrice) / product.price * 100}"
									maxFractionDigits="0" />%
							</span>
						</c:when>
						<c:otherwise>
							<span class="product-info__price-current"> <fmt:formatNumber
									value="${product.price}" type="number" />đ
							</span>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- Promotions -->
				<div class="product-info__promotions">
					<div class="promo-item">
						<i class="bi bi-gift"></i> <span>Freeship đơn từ 300K</span>
					</div>
					<div class="promo-item">
						<i class="bi bi-shield-check"></i> <span>Cam kết chính hãng
							100%</span>
					</div>
					<div class="promo-item">
						<i class="bi bi-arrow-repeat"></i> <span>Đổi trả trong 7
							ngày</span>
					</div>
				</div>

				<!-- Quantity -->
				<div class="product-info__quantity">
					<label>Số lượng:</label>
					<div class="quantity-selector">
						<button type="button" class="qty-btn" onclick="decreaseQty()">-</button>
						<input type="number" id="quantity" value="1" min="1" max="99">
						<button type="button" class="qty-btn" onclick="increaseQty()">+</button>
					</div>
				</div>

				<!-- Action Buttons -->
				<div class="product-info__actions">

					<!-- Thêm vào giỏ -->
					<form action="${pageContext.request.contextPath}/cart"
						method="post" class="d-inline">
						<input type="hidden" name="productId" value="${product.id}">
						<button type="submit" class="btn btn-add-cart">
							<i class="bi bi-cart-plus"></i> Thêm vào giỏ
						</button>
					</form>

					<!-- Mua ngay -->
					<form action="${pageContext.request.contextPath}/cart"
						method="post" class="d-inline">
						<input type="hidden" name="productId" value="${product.id}">
						<input type="hidden" name="buyNow" value="true">
						<button type="submit" class="btn btn-buy-now">Mua ngay</button>
					</form>

				</div>

				<!-- Guarantees -->
				<div class="product-info__guarantees">
					<div class="guarantee-item">
						<i class="bi bi-truck"></i>
						<div>
							<strong>Giao hàng nhanh</strong> <span>Nhận hàng trong 2-3
								ngày</span>
						</div>
					</div>
					<div class="guarantee-item">
						<i class="bi bi-patch-check"></i>
						<div>
							<strong>Chính hãng</strong> <span>Cam kết 100% chính hãng</span>
						</div>
					</div>
					<div class="guarantee-item">
						<i class="bi bi-headset"></i>
						<div>
							<strong>Hỗ trợ 24/7</strong> <span>Hotline: 1900 xxxx</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Product Description -->
	<div class="row mt-4">
		<div class="col-12">
			<div class="product-description">
				<h3 class="product-description__title">
					<i class="bi bi-file-text"></i> Mô tả sản phẩm
				</h3>
				<div class="product-description__content">
					<c:choose>
						<c:when test="${not empty product.description}">
										${product.description}
									</c:when>
						<c:otherwise>
							<p>Chưa có mô tả cho sản phẩm này.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<script>
					function decreaseQty() {
						const input = document.getElementById('quantity');
						if (parseInt(input.value) > 1) {
							input.value = parseInt(input.value) - 1;
						}
					}

					function increaseQty() {
						const input = document.getElementById('quantity');
						if (parseInt(input.value) < 99) {
							input.value = parseInt(input.value) + 1;
						}
					}
				</script>
</c:if>

<c:if test="${empty product}">
	<div class="empty-state">
		<i class="bi bi-box"></i>
		<h5>Không tìm thấy sản phẩm</h5>
		<p>Sản phẩm này không tồn tại hoặc đã bị xóa.</p>
		<a href="${pageContext.request.contextPath}/product"
			class="btn btn-primary">Xem sản phẩm khác</a>
	</div>
</c:if>