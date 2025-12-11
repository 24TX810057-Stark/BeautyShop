<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 class="mt-4">Sản phẩm thuộc danh mục</h3>

	<div class="row mt-3">
		<c:forEach var="p" items="${products}">
			<div class="col-md-3 text-center mb-4">
				<img
					src="${pageContext.request.contextPath}/assets/images/${p.image}"
					class="img-fluid" style="height: 200px; object-fit: cover;">
				<h5 class="mt-2">${p.name}</h5>
				<p>
					<span class="text-danger fw-bold">${p.salePrice}đ</span> <span
						class="text-muted text-decoration-line-through">${p.price}đ</span>
				</p>
			</div>
		</c:forEach>
	</div>

</body>
</html>