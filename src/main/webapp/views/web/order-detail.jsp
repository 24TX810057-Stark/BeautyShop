<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>Chi tiết đơn hàng #${order.id}</h3>

<p>Ngày đặt: ${order.createdAt}</p>
<p>Trạng thái: ${order.status}</p>

<table border="1" cellpadding="10">
    <tr>
        <th>Sản phẩm</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Tạm tính</th>
    </tr>

    <c:forEach items="${order.items}" var="item">
        <tr>
            <td>${item.productName}</td>
            <td>${item.price}</td>
            <td>${item.quantity}</td>
            <td>${item.price * item.quantity}</td>
        </tr>
    </c:forEach>
</table>

<p><b>Tổng tiền:</b> ${order.totalAmount}</p>
