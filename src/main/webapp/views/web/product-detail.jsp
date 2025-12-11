<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>${product.name}</h3>

	<img
		src="${pageContext.request.contextPath}/assets/images/${product.image}"
		style="width: 300px;">

	<p class="mt-3">${product.description}</p>

	<p class="text-danger fw-bold fs-4">${product.price}đ</p>

	<a class="btn btn-success"
		href="${pageContext.request.contextPath}/cart?add=${product.id}">
		Thêm vào giỏ hàng </a>

</body>
</html>