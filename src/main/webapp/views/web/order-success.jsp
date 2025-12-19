<%@ page contentType="text/html; charset=UTF-8"%>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">

            <div class="mb-4">
                <i class="bi bi-check-circle-fill text-success"
                   style="font-size: 80px;"></i>
            </div>

            <h3 class="fw-bold mb-2">Đặt hàng thành công!</h3>
            <p class="text-muted mb-4">
                Cảm ơn bạn đã mua sắm tại BeautyShop.<br>
                Đơn hàng của bạn đang được xử lý.
            </p>

            <div class="d-grid gap-2">
                <a href="${pageContext.request.contextPath}/home"
                   class="btn btn-danger">
                    Tiếp tục mua sắm
                </a>

                <a href="${pageContext.request.contextPath}/order-tracking"
                   class="btn btn-outline-secondary">
                    Tra cứu đơn hàng
                </a>
            </div>

        </div>
    </div>
</div>
