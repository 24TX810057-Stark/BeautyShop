<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="sidebar col-auto">
    <div class="brand">Admin Panel</div>

    <a href="${pageContext.request.contextPath}/manager/home" class="active">
        <i class="bi bi-speedometer2"></i> Dashboard
    </a>

    <a href="${pageContext.request.contextPath}/manager/products">
        <i class="bi bi-box"></i> Sản phẩm
    </a>

    <a href="${pageContext.request.contextPath}/manager/orders">
        <i class="bi bi-cart-check"></i> Đơn hàng
    </a>

    <a href="${pageContext.request.contextPath}/manager/users">
        <i class="bi bi-people"></i> Người dùng
    </a>

    <a href="${pageContext.request.contextPath}/manager/settings">
        <i class="bi bi-gear"></i> Cài đặt
    </a>
</div>
