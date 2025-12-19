<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<title>Tìm kiếm sản phẩm</title>
<div class="container mt-4">

    <h4 class="mb-3">
        Kết quả tìm kiếm
        <c:if test="${not empty keyword}">
            cho "<strong>${keyword}</strong>"
        </c:if>
    </h4>

    <c:choose>
        <c:when test="${empty products}">
            <p class="text-muted">Không tìm thấy sản phẩm phù hợp.</p>
        </c:when>

        <c:otherwise>
            <div class="row">
                <c:forEach var="p" items="${products}">
                    <div class="col-md-3 mb-4">
                        <div class="card h-100">
                            <c:choose>
                                <c:when test="${not empty p.image}">
                                    <img
                                        src="${pageContext.request.contextPath}/assets/images/${p.image}"
                                        class="card-img-top"
                                        alt="${p.name}">
                                </c:when>
                                <c:otherwise>
                                    <div class="text-center py-5 bg-light">
                                        <i class="bi bi-image"></i>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <div class="card-body">
                                <h6 class="card-title">${p.name}</h6>
                                <p class="text-danger fw-bold">
                                    ${p.price} đ
                                </p>
                            </div>

                            <div class="card-footer bg-white border-0">
                                <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}"
                                   class="btn btn-sm btn-outline-primary w-100">
                                    Xem chi tiết
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

</div>
