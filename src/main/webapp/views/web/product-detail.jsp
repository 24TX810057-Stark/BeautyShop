<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
		<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

			<!-- Breadcrumb -->
			<div class="breadcrumb-custom">
				<a href="${pageContext.request.contextPath}/home"><i class="bi bi-house"></i> Trang chủ</a>
				<span class="mx-2">/</span>
				<a href="#">Sản phẩm</a>
				<span class="mx-2">/</span>
				<span class="current">Serum dưỡng da Innisfree Green Tea Seed</span>
			</div>

			<div class="product-detail">
				<div class="row">
					<!-- Product Image Gallery -->
					<div class="col-lg-5 col-md-6 mb-4">
						<div class="product-gallery">
							<div class="product-gallery__main">
								<div class="product-gallery__placeholder">
									<i class="bi bi-image"></i>
								</div>
								<span class="product-gallery__badge">-25%</span>
							</div>
						</div>
					</div>

					<!-- Product Info -->
					<div class="col-lg-7 col-md-6">
						<div class="product-info">
							<div class="product-info__brand">Innisfree</div>
							<h1 class="product-info__name">Serum dưỡng da Innisfree Green Tea Seed</h1>

							<div class="product-info__rating">
								<div class="stars">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-half"></i>
								</div>
								<span class="rating-text">4.5/5</span>
								<span class="divider">|</span>
								<span class="sold">Đã bán 250+</span>
							</div>

							<div class="product-info__price-box">
								<span class="price-current">299,000đ</span>
								<span class="price-old">399,000đ</span>
								<span class="discount-percent">-25%</span>
							</div>

							<!-- Promotions -->
							<div class="product-info__promos">
								<div class="promo-item">
									<i class="bi bi-gift"></i>
									<span>Tặng mặt nạ dưỡng da khi mua từ 2 sản phẩm</span>
								</div>
								<div class="promo-item">
									<i class="bi bi-truck"></i>
									<span>Miễn phí vận chuyển đơn từ 300K</span>
								</div>
							</div>

							<!-- Quantity -->
							<div class="product-info__quantity">
								<label>Số lượng:</label>
								<div class="quantity-selector">
									<button type="button" class="qty-btn" onclick="decreaseQty()">
										<i class="bi bi-dash"></i>
									</button>
									<input type="number" id="quantity" value="1" min="1" max="99">
									<button type="button" class="qty-btn" onclick="increaseQty()">
										<i class="bi bi-plus"></i>
									</button>
								</div>
								<span class="stock-info">Còn 150 sản phẩm</span>
							</div>

							<!-- Actions -->
							<div class="product-info__actions">
								<a href="#" class="btn btn-add-cart">
									<i class="bi bi-cart-plus"></i> Thêm vào giỏ hàng
								</a>
								<a href="#" class="btn btn-buy-now">
									Mua ngay
								</a>
							</div>

							<!-- Guarantees -->
							<div class="product-info__guarantees">
								<div class="guarantee-item">
									<i class="bi bi-shield-check"></i>
									<span>Cam kết chính hãng 100%</span>
								</div>
								<div class="guarantee-item">
									<i class="bi bi-arrow-repeat"></i>
									<span>Đổi trả trong 7 ngày</span>
								</div>
								<div class="guarantee-item">
									<i class="bi bi-headset"></i>
									<span>Hỗ trợ 24/7</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Product Description -->
				<div class="product-description">
					<div class="section-soft-bg">
						<h3 class="product-description__title">
							<i class="bi bi-file-text"></i> Mô tả sản phẩm
						</h3>
						<div class="product-description__content">
							<p><strong>Serum dưỡng da Innisfree Green Tea Seed</strong> là sản phẩm dưỡng da được chiết
								xuất từ lá trà xanh tươi Jeju, giúp cấp ẩm sâu và bảo vệ làn da khỏi các tác nhân gây
								hại từ môi trường.</p>

							<h5>Thành phần chính:</h5>
							<ul>
								<li>Chiết xuất trà xanh Jeju tươi</li>
								<li>Hạt trà xanh Jeju</li>
								<li>Niacinamide</li>
								<li>Hyaluronic Acid</li>
							</ul>

							<h5>Công dụng:</h5>
							<ul>
								<li>Cấp ẩm sâu cho làn da</li>
								<li>Làm sáng và đều màu da</li>
								<li>Chống oxy hóa, bảo vệ da</li>
								<li>Làm dịu và phục hồi da</li>
							</ul>

							<h5>Cách sử dụng:</h5>
							<p>Sau bước làm sạch và toner, lấy một lượng serum vừa đủ, thoa đều lên mặt và cổ. Massage
								nhẹ nhàng để serum thẩm thấu vào da. Sử dụng mỗi ngày, sáng và tối để đạt hiệu quả tốt
								nhất.</p>

							<h5>Thông tin sản phẩm:</h5>
							<ul>
								<li><strong>Thương hiệu:</strong> Innisfree</li>
								<li><strong>Xuất xứ:</strong> Hàn Quốc</li>
								<li><strong>Dung tích:</strong> 80ml</li>
								<li><strong>Loại da phù hợp:</strong> Mọi loại da</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<script>
				function increaseQty() {
					const input = document.getElementById('quantity');
					let value = parseInt(input.value) || 1;
					if (value < 99) {
						input.value = value + 1;
					}
				}

				function decreaseQty() {
					const input = document.getElementById('quantity');
					let value = parseInt(input.value) || 1;
					if (value > 1) {
						input.value = value - 1;
					}
				}
			</script>