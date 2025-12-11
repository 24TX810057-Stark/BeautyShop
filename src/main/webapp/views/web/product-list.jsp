<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Sản phẩm</h3>

	<div class="row mt-3">
		<c:forEach var="p" items="${products}">
			<div class="col-3 mb-4">
				<div class="card p-2">
					<img
						src="${pageContext.request.contextPath}/assets/images/${p.image}"
						class="card-img-top">

					<h6 class="mt-2">${p.name}</h6>

					<p class="text-danger fw-bold">${p.price}đ</p>

					<a href="product-detail?id=${p.id}" class="btn btn-sm btn-primary">Xem
						chi tiết</a>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>