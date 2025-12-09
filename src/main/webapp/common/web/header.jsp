<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- TOP HEADER -->
<header class="top-header">
	<div
		class="container d-flex justify-content-between align-items-center py-2">

		<!-- Logo -->
		<a href="${pageContext.request.contextPath}/home"> 
		<img src="${pageContext.request.contextPath}/assets/images/logo.png"
			alt="Logo" class="header-logo">
		</a>

		<!-- Search box -->
		<div class="search-box d-flex align-items-center">
			<input type="text" class="form-control search-input"
				placeholder="Bạn cần tìm ....">
			<button class="search-btn">
				<i class="bi bi-search"></i>
			</button>
		</div>

		<!-- User + Cart -->
		<div class="header-icons d-flex align-items-center">
			<a href="#" class="mx-2"><i class="bi bi-person"></i></a> <a href="#"
				class="mx-2 position-relative"> <i class="bi bi-cart3"></i> <span
				class="cart-count">0</span>
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

		<!-- Dropdown Danh mục -->
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

		<!-- Other menu items -->
		<ul class="menu-list">
			<li><a href="#">SẢN PHẨM MỚI</a></li>
			<li><a href="#">DEAL HOT DƯỚI 100K</a></li>
			<li><a href="#">TIN TỨC</a></li>
			<li><a href="#">TRA CỨU ĐƠN HÀNG</a></li>
			<li><a href="#">BEAUTY & COSMETICS</a></li>
		</ul>

	</div>
</nav>
