<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- ==== Chào mừng người dùng ==== -->
<div id="mainBanner" class="mb-4">
	<img src="${pageContext.request.contextPath}/images/banner.png"
		alt="Fashion Banner" class="img-fluid rounded shadow-sm w-100">
	<!-- style="height: 45vh; object-fit: cover;" -->

</div>

<!-- ==== Chào mừng người dùng ==== -->
<div class="alert alert-light text-center shadow-sm border">
	<h4>
		Chào mừng ${name} đến với <b>Gucci store</b>!
	</h4>
	<p class="text-muted mb-0">Khám phá những xu hướng thời trang mới
		nhất hôm nay</p>
</div>



<%-- <div class="alert alert-light text-center shadow-sm border my-4">
	<h4>
		Chào mừng ${name} đến với <b>Gucci store</b>!
	</h4>
	<p class="text-muted mb-0">Khám phá những xu hướng thời trang mới
		nhất hôm nay</p>
</div>

<!-- ==== Banner ==== -->
<div id="mainBanner" class="mb-4">
	<img src="${pageContext.request.contextPath}/images/banner.png"
		alt="Fashion Banner" class="img-fluid rounded shadow-sm w-100">
</div>
 --%>





<!-- ==== Danh mục sản phẩm ==== -->
<h3 class="text-center mb-4">Danh mục sản phẩm</h3>
<div class="d-flex justify-content-center flex-wrap gap-3 mb-5">
	<c:forEach var="cat" items="${listCategory}">
		<a
			href="${pageContext.request.contextPath}/product?cid=${cat.categoryId}"
			class="btn btn-outline-dark rounded-pill px-4 py-2">${cat.categoryName}</a>
	</c:forEach>
</div>

<!-- ==== Sản phẩm nổi bật ==== -->
<h3 class="text-center mb-4">Sản phẩm nổi bật</h3>
<div class="row">
	<c:forEach var="p" items="${listProduct}">
		<div class="col-md-3 mb-4">
			<div class="card h-100 shadow-sm border-0">
				<img
					src="${pageContext.request.contextPath}/image?fname=products/${p.image}"
					class="card-img-top" alt="${p.name}">
				<div class="card-body text-center">
					<h6 class="fw-bold">${p.name}</h6>
					<p class="text-danger fw-semibold">${p.price}₫</p>
				</div>
				<div class="card-footer bg-transparent text-center">
					<a
						href="${pageContext.request.contextPath}/cart/add?id=${p.productId}"
						class="btn btn-sm btn-outline-primary">Thêm vào giỏ</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<!-- ==== Ưu đãi đặc biệt ==== -->
<div class="mt-5 text-center bg-light p-4 rounded">
	<h4>Ưu đãi hot trong tuần</h4>
	<p>
		Giảm ngay <b>20%</b> cho đơn hàng trên <b>500.000₫</b> – Áp dụng đến
		31/10!
	</p>
	<a href="${pageContext.request.contextPath}/product"
		class="btn btn-dark">Mua ngay</a>
</div>
