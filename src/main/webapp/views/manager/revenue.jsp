<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container my-4">

	<h2 class="fw-bold">Revenue Dashboard</h2>
	<p class="text-muted">Tổng quan doanh thu & hiệu suất bán hàng</p>
	<form method="get"
		action="${pageContext.request.contextPath}/manager/revenue"
		class="row g-2 align-items-end mb-3">

		<div class="col-auto">
			<label class="form-label mb-0">Tháng</label> <input type="month"
				name="month" value="${selectedMonth}" class="form-control">
		</div>

		<div class="col-auto">
			<button class="btn btn-primary">
				<i class="bi bi-bar-chart"></i> Xem
			</button>
		</div>

		<div class="col-auto">
			<a
				href="${pageContext.request.contextPath}/manager/revenue/export?month=${selectedMonth}"
				class="btn btn-success"
				href="${pageContext.request.contextPath}/manager/revenue/export?month=${selectedMonth}">
				Xuất Excel </a>
		</div>
	</form>


	<!-- KPI -->
	<div class="row g-3 my-3">
		<div class="col-md-4">
			<div class="p-4 rounded text-white" style="background: #fbbf24">
				<div>Tổng doanh thu (tháng)</div>
				<h4>
					<fmt:formatNumber value="${monthRevenue}" type="currency" />
				</h4>
			</div>
		</div>

		<div class="col-md-4">
			<div class="p-4 rounded text-white" style="background: #fb7185">
				<div>Đơn hàng hoàn thành</div>
				<h4>${monthOrders}đơn</h4>
			</div>
		</div>

		<div class="col-md-4">
			<div class="p-4 rounded text-white" style="background: #6366f1">
				<div>Giá trị đơn trung bình</div>
				<h4>
					<fmt:formatNumber value="${avgOrderValue}" type="currency" />
				</h4>
			</div>
		</div>
	</div>

	<!-- CHART -->
	<div class="row g-4">
		<div class="col-md-8">
			<div class="p-3 bg-white rounded shadow-sm">
				<h6 class="fw-bold mb-3">Doanh thu theo ngày trong tháng</h6>
				<div class="chart-box">
					<canvas id="dailyRevenueChart"></canvas>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="p-3 bg-white rounded shadow-sm">
				<h6 class="fw-bold mb-3">Doanh thu theo danh mục</h6>
				<div class="chart-box">
					<canvas id="categoryRevenueChart"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ================= JS ================= -->

<!--  Chart.js -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>

<!-- DATA TỪ JSP -->
<script>
const dailyLabels = [
<c:forEach begin="1" end="${daysInMonth}" var="d" varStatus="s">
  "Ngày ${d}"<c:if test="${!s.last}">,</c:if>
</c:forEach>
];

const dailyData = [
<c:forEach begin="1" end="${daysInMonth}" var="d" varStatus="s">
  ${revenueByDay[d] != null ? revenueByDay[d] : 0}<c:if test="${!s.last}">,</c:if>
</c:forEach>
];

const catLabels = [
<c:forEach items="${categoryRevenue}" var="c" varStatus="s">
  "${c.key}"<c:if test="${!s.last}">,</c:if>
</c:forEach>
];

const catData = [
<c:forEach items="${categoryRevenue}" var="c" varStatus="s">
  ${c.value}<c:if test="${!s.last}">,</c:if>
</c:forEach>
];
</script>
<!-- VẼ CHART -->
<script>
document.addEventListener("DOMContentLoaded", () => {

    /* ===== BAR CHART ===== */
    new Chart(document.getElementById("dailyRevenueChart"), {
        type: "bar",
        data: {
            labels: dailyLabels,
            datasets: [{
                label: "Doanh thu (VNĐ)",
                data: dailyData,
                backgroundColor: "#4f46e5"
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    ticks: {
                        maxRotation: 45,
                        minRotation: 45
                    }
                }
            }
        }
    });

    /* ===== DOUGHNUT CHART ===== */
    new Chart(document.getElementById("categoryRevenueChart"), {
        type: "doughnut",
        data: {
            labels: catLabels,
            datasets: [{
                data: catData,
                backgroundColor: [
                    "#6366f1", // xanh tím
                    "#fb7185", // hồng
                    "#fbbf24", // vàng
                    "#34d399", // xanh ngọc
                    "#a78bfa"  // tím nhạt
                ],
                borderWidth: 2,
                borderColor: "#fff",
                hoverOffset: 12
            }]
        },
        options: {
            cutout: "30%",       
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: "bottom",
                    labels: {
                        usePointStyle: true,
                        padding: 20
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(ctx) {
                            return ctx.label + ": " +
                              ctx.raw.toLocaleString("vi-VN") + " ₫";
                        }
                    }
                }
            }
        }
    });

});
</script>
