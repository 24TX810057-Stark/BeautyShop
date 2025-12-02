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

<!-- Bootstrap + Icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
}

.sidebar {
	background-color: #212529;
	color: white;
	min-height: calc(100vh - 56px - 40px); /* trừ header & footer */
	padding-top: 1rem;
}

.sidebar a {
	color: #adb5bd;
	text-decoration: none;
	display: block;
	padding: 8px 16px;
	border-radius: 6px;
	transition: all 0.2s;
}

.sidebar a:hover, .sidebar a.active {
	color: white;
	background-color: #343a40;
}

main {
	padding: 1.5rem;
}

footer {
	padding: 10px;
	background: #fff;
	border-top: 1px solid #dee2e6;
	text-align: center;
	color: #6c757d;
}
</style>
</head>
<body>

	<!-- HEADER -->
	<%-- <jsp:include page="/common/admin/header.jsp" /> --%>


	<div class="container-fluid">
		<div class="row flex-nowrap">

			<!-- SIDEBAR -->
			<%-- <jsp:include page="/common/admin/left.jsp" /> --%>


			<!-- MAIN CONTENT -->
			<main class="col py-3">
				<!-- <sitemesh:write property="body" /> -->
			</main>
		</div>
	</div>

	<!-- FOOTER -->

	<jsp:include page="/common/footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
