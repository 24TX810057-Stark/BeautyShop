<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div id="mainBanner" class="mb-4">
	<img src="${pageContext.request.contextPath}/images/banner.png"
		class="img-fluid rounded shadow-sm w-100">
</div>

<div class="alert alert-light text-center shadow-sm border">
	<h4>
		Chào mừng ${name} đến với <b>Thiên Đường Mỹ Phẩm</b>!
	</h4>
	<p class="text-muted mb-0">===========Test===========</p>
</div>

<h3 class="section-title text-center my-4">Danh mục sản phẩm</h3>
<div class="d-flex justify-content-center flex-wrap gap-3 mb-5">
	<c:forEach var="cat" items="${listCategory}">
		<a
			href="${pageContext.request.contextPath}/product?cid=${cat.categoryId}"
			class="btn btn-outline-dark rounded-pill px-4 py-2">
			${cat.categoryName} </a>
	</c:forEach>
</div>

<!-- Sản phẩm nổi bật -->
<div class="block-header mb-3">
	<div class="block-header__left">
		<h3 class="block-header__title mb-0">Sản phẩm nổi bật</h3>
	</div>
</div>

<div class="row g-3">
	<c:forEach var="p" items="${listProduct}">
		<div class="col-6 col-md-3">
			<div class="product-card">
				<div class="product-card__thumb">
					<img
						src="${pageContext.request.contextPath}/image?fname=products/${p.image}">
				</div>

				<div class="product-card__name">${p.name}</div>

				<div class="product-card__price">
					<span class="product-card__price-current">${p.price}₫</span>
				</div>

				<div class="product-card__buy">
					<a
						href="${pageContext.request.contextPath}/cart/add?id=${p.productId}"
						class="btn btn-buy"> Thêm vào giỏ </a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<div class="mt-5 text-center section-soft-bg">
	<h4>Ưu đãi hot trong tuần</h4>
	<p>Giảm 20% cho đơn trên 500.000₫ – Áp dụng đến 31/10!</p>
	<a href="${pageContext.request.contextPath}/product"
		class="btn btn-main"> Mua ngay </a>
</div>
