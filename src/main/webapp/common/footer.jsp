<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<footer class="footer">
	<div class="container">

		<div class="row align-items-start">

			<!-- Logo + thông tin -->
			<div class="col-md-4 mb-2">

				<img class="footer-logo"
					src="${pageContext.request.contextPath}/assets/images/logo.png">

				<h6 class="footer-title">Beauty & Cosmetic Store</h6>

				<p class="mb-1">Chi nhánh Thủ Đức: 43 Võ Văn Ngân, P.Linh Chiểu,
					Thủ Đức</p>
				<p class="mb-1">Chi nhánh Sala: Căn hộ B-00.12A, Tháp trệt, KĐT
					Sala</p>

				<p class="mb-1">
					<strong>Hotline:</strong> 0123 456 789
				</p>
				<p class="mb-1">
					<strong>Email:</strong> cskh@beautycosmetic.vn
				</p>

			</div>

			<!-- Cột icon + thông tin -->
			<div class="col-md-8">

				<div class="d-flex justify-content-between flex-wrap mb-3">

					<div class="footer-service-box">
						<img
							src="${pageContext.request.contextPath}/assets/icons/free-ship.png">
						<p>GIAO HÀNG MIỄN PHÍ</p>
					</div>

					<div class="footer-service-box">
						<img
							src="${pageContext.request.contextPath}/assets/icons/gift.png">
						<p>GÓI QUÀ MIỄN PHÍ</p>
					</div>

					<div class="footer-service-box">
						<img src="${pageContext.request.contextPath}/assets/icons/vat.png">
						<p>XUẤT VAT TRONG 24H</p>
					</div>

					<div class="footer-service-box">
						<img
							src="${pageContext.request.contextPath}/assets/icons/support.png">
						<p>ĐỔI TRẢ 7 NGÀY</p>
					</div>

				</div>

				<!-- Hàng text phía dưới -->
				<div class="row mt-3 footer-text-row">

					<div class="col-md-4 col-sm-6 mb-3">
						<h6>Chăm sóc khách hàng</h6>
						<ul class="list-unstyled mb-0">
							<li><a
								href="${pageContext.request.contextPath}/page/return-policy"
								class="footer-link"> Chính sách đổi trả </a></li>

							<li><a
								href="${pageContext.request.contextPath}/page/privacy-policy"
								class="footer-link">Chính sách bảo mật</a></li>

							<li><a
								href="${pageContext.request.contextPath}/page/payment-policy"
								class="footer-link">Chính sách thanh toán</a></li>

							<li><a href="${pageContext.request.contextPath}/page/terms"
								class="footer-link">Điều khoản dịch vụ</a></li>

							<li><a
								href="${pageContext.request.contextPath}/page/buy-guide"
								class="footer-link">Hướng dẫn mua hàng</a></li>

						</ul>
					</div>

					<div class="col-md-4 col-sm-6 mb-3">
						<h6>Giờ mở cửa</h6>
						<p class="mb-1">
							Từ 9:00 - 21:30 tất cả các ngày trong tuần<br>(kể cả ngày
							lễ, Tết).
						</p>
						<h6 class="mt-2">Góp ý - khiếu nại</h6>
						<p class="mb-0">📞 0123 456 789</p>
					</div>

					<div class="col-md-4 col-sm-6 mb-3">
						<h6>Thông tin công ty</h6>
						<ul class="list-unstyled mb-0">
							<li><a href="${pageContext.request.contextPath}/page/about"
								class="footer-link">Giới thiệu</a></li>

							<li><a
								href="${pageContext.request.contextPath}/page/contact"
								class="footer-link">Liên hệ hợp tác</a></li>

							<li><a
								href="${pageContext.request.contextPath}/page/recruitment"
								class="footer-link">Tuyển dụng</a></li>

						</ul>
					</div>

				</div>
			</div>

		</div>

		<div class="footer-bottom">© 2025 Beauty & Cosmetic Store – All
			Rights Reserved</div>
	</div>
</footer>
