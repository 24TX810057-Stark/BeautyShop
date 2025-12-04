<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><sitemesh:write property="title"
		default="Admin Dashboard" /></title>

<!-- Bootstrap + Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- CSS chung -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/base.css">

<!-- CSS riêng cho admin -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/manager.css">

</head>
<body>

	<!-- HEADER ADMIN -->
	<jsp:include page="/common/manager/header.jsp" />

	<div class="container-fluid">
		<div class="row flex-nowrap">

			<!-- SIDEBAR -->
			<jsp:include page="/common/manager/left.jsp" />

			<!-- MAIN CONTENT -->
			<main class="col py-3">
				<sitemesh:write property="body" />
			</main>

		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/common/footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
