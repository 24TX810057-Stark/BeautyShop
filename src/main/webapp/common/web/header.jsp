<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- TOP HEADER -->
<header class="top-header">
	<div
		class="container d-flex flex-wrap justify-content-between align-items-center py-2">

		<!-- Logo -->
		<a href="${pageContext.request.contextPath}/home"> <img
			src="${pageContext.request.contextPath}/assets/images/logo.png"
			alt="Logo" class="header-logo">
		</a>

		<!-- Search box -->
		<form action="${pageContext.request.contextPath}/search" method="get"
			class="search-box d-flex align-items-center flex-grow-1 mx-3 mt-2 mt-md-0">

			<input type="text" name="keyword" class="form-control search-input"
				placeholder="Bạn cần tìm ...." value="${param.keyword}">

			<button type="submit" class="search-btn">
				<i class="bi bi-search"></i>
			</button>
		</form>

		<!-- User + Cart -->
		<div class="header-icons d-flex align-items-center">
			<a href="${pageContext.request.contextPath}/profile" class="mx-2">
				<i class="bi bi-person"></i>
			</a> <a href="${pageContext.request.contextPath}/cart"
				class="mx-2 position-relative"> <i class="bi bi-cart3"></i> <span
				class="cart-count"> <c:out
						value="${sessionScope.cartCount != null ? sessionScope.cartCount : 0}" />
			</span>

			</a>
		</div>


	</div>
	<!-- đóng container -->
</header>
<!-- đóng header -->

<!-- MENU BAR -->
<nav class="menu-bar">
	<div
		class="container d-flex align-items-center justify-content-between">

		<!-- Nút menu mobile (CHỈ DI CHUYỂN VỊ TRÍ) -->
		<button class="btn d-md-none" type="button" data-bs-toggle="collapse"
			data-bs-target="#mobileMenu">
			<i class="bi bi-list fs-3"></i>
		</button>

		<!-- Dropdown Danh mục (GIỮ NGUYÊN) -->
		<div class="category-dropdown">
			<div class="category-btn">
				<i class="bi bi-list"></i> DANH MỤC SẢN PHẨM
			</div>

			<ul class="category-menu">
				<li><a href="#">CHĂM SÓC DA MẶT</a></li>
				<li><a href="#">TRANG ĐIỂM</a></li>
				<li><a href="#">CHĂM SÓC CƠ THỂ</a></li>
				<li><a href="#">PHỤ KIỆN/DỤNG CỤ LÀM ĐẸP</a></li>
				<li><a href="#">DƯỢC MỸ PHẨM</a></li>
				<li><a href="#">BEST SELLER</a></li>
			</ul>
		</div>

		<!-- Menu desktop (CHỈ DI CHUYỂN VỊ TRÍ) -->
		<ul class="menu-list d-none d-lg-flex">
			<li><a
				href="${pageContext.request.contextPath}/product?type=new">SẢN
					PHẨM MỚI</a></li>
			<li><a
				href="${pageContext.request.contextPath}/product?type=deal-100k">DEAL
					HOT DƯỚI 100K</a></li>
			<li><a href="${pageContext.request.contextPath}/news">TIN
					TỨC</a></li>
			<li><a href="${pageContext.request.contextPath}/order-tracking">TRA
					CỨU ĐƠN HÀNG</a></li>
			<li><a href="#">BEAUTY & COSMETICS</a></li>
		</ul>
	</div>

	<!-- Menu mobile (CHỈ DI CHUYỂN VỊ TRÍ) -->
	<div class="collapse d-lg-none" id="mobileMenu">
		<ul class="menu-list mobile">
			<li><a
				href="${pageContext.request.contextPath}/product?type=new">SẢN
					PHẨM MỚI</a></li>
			<li><a
				href="${pageContext.request.contextPath}/product?type=deal-100k">DEAL
					HOT</a></li>
			<li><a href="${pageContext.request.contextPath}/news">TIN
					TỨC</a></li>
			<li><a href="${pageContext.request.contextPath}/order-tracking">TRA
					CỨU ĐƠN</a></li>
		</ul>
	</div>
</nav>
