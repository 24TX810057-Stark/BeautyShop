package vn.iotstar.beautyshop.controllers.manager;

import java.io.IOException;
import java.time.YearMonth;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.service.OrderService;
import vn.iotstar.beautyshop.service.impl.OrderServiceImpl;

@WebServlet("/manager/revenue")
public class ManagerRevenueController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final OrderService orderService = new OrderServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// ===== CHECK ROLE =====
		User user = (User) req.getSession().getAttribute("user");
		if (user == null || !"ADMIN".equals(user.getRole())) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		// ===== LẤY THÁNG (yyyy-MM) =====
		String monthParam = req.getParameter("month");
		YearMonth ym;

		if (monthParam == null || monthParam.isBlank()) {
			ym = YearMonth.now();
			monthParam = ym.toString();
		} else {
			ym = YearMonth.parse(monthParam);
		}

		int month = ym.getMonthValue();
		int year = ym.getYear();

		// ===== KPI =====
		double monthRevenue = orderService.getRevenueByMonth(month, year);
		int monthOrders = orderService.countCompletedOrders(month, year);
		double avgOrderValue = monthOrders == 0 ? 0 : monthRevenue / monthOrders;

		// ===== BAR CHART =====
		Map<Integer, Double> revenueByDay = orderService.getRevenueByDay(month, year);

		// ===== PIE CHART =====
		Map<String, Double> categoryRevenue = orderService.getRevenueByCategory(month, year);

		// ===== SET ATTRIBUTE =====
		req.setAttribute("selectedMonth", monthParam);
		req.setAttribute("daysInMonth", ym.lengthOfMonth());

		req.setAttribute("revenueByDay", revenueByDay);
		req.setAttribute("categoryRevenue", categoryRevenue);

		req.setAttribute("monthRevenue", monthRevenue);
		req.setAttribute("monthOrders", monthOrders);
		req.setAttribute("avgOrderValue", avgOrderValue);

		// ===== FORWARD =====
		req.getRequestDispatcher("/views/manager/revenue.jsp").forward(req, resp);
	}
}
