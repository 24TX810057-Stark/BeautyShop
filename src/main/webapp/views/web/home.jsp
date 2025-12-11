<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>


<h3 class="mt-4">Danh mục sản phẩm</h3>

<div class="row mt-3">
	<c:forEach var="c" items="${categories}">
		<div class="col-2 text-center mb-4">
			<img
				src="${pageContext.request.contextPath}/assets/images/${c.image}"
				class="img-fluid rounded" style="height: 100px; object-fit: cover;">
			<p class="mt-2">${c.name}</p>
		</div>
	</c:forEach>
</div>



