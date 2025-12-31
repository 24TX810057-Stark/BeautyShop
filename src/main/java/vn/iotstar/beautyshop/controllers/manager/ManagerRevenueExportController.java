package vn.iotstar.beautyshop.controllers.manager;

import java.io.IOException;
import java.io.OutputStream;
import java.time.YearMonth;
import java.util.Map;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.model.User;
import vn.iotstar.beautyshop.service.OrderService;
import vn.iotstar.beautyshop.service.impl.OrderServiceImpl;

@WebServlet("/manager/revenue/export")
public class ManagerRevenueExportController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// check login + role
		User user = (User) req.getSession().getAttribute("user");
		if (user == null || !"ADMIN".equals(user.getRole())) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		// lấy tháng
		String monthParam = req.getParameter("month"); // ví dụ: 2025-12
		YearMonth ym = (monthParam == null || monthParam.isBlank()) ? YearMonth.now() : YearMonth.parse(monthParam);

		int month = ym.getMonthValue();
		int year = ym.getYear();

		// ===== LẤY DATA=====
		Map<Integer, Double> revenueByDay = orderService.getRevenueByDay(month, year);

		Map<String, Double> categoryRevenue = orderService.getRevenueByCategory(month, year);

		// ===== SET HEADER FILE EXCEL =====
		resp.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		resp.setHeader("Content-Disposition", "attachment; filename=Doanh thu " + ym + ".xlsx");

		// ===== GHI EXCEL =====
		writeExcel(resp.getOutputStream(), revenueByDay, categoryRevenue, ym);
	}

	private void writeExcel(OutputStream os, Map<Integer, Double> revenueByDay, Map<String, Double> categoryRevenue,
			YearMonth ym) throws IOException {

		Workbook wb = new XSSFWorkbook();
		CellStyle titleStyle = wb.createCellStyle();
		Font titleFont = wb.createFont();
		titleFont.setBold(true);
		titleFont.setFontHeightInPoints((short) 14);
		titleStyle.setFont(titleFont);
		titleStyle.setAlignment(HorizontalAlignment.CENTER);

		CellStyle headerStyle = wb.createCellStyle();
		Font headerFont = wb.createFont();
		headerFont.setBold(true);
		headerStyle.setFont(headerFont);
		headerStyle.setFillForegroundColor(IndexedColors.LIGHT_CORNFLOWER_BLUE.getIndex());
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setBorderBottom(BorderStyle.THIN);
		headerStyle.setBorderTop(BorderStyle.THIN);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);

		CellStyle moneyStyle = wb.createCellStyle();
		moneyStyle.setDataFormat(wb.createDataFormat().getFormat("#,##0 \"VNĐ\""));

		// ===== SHEET 1: DOANH THU THEO NGÀY =====
		Sheet s1 = wb.createSheet("Doanh thu theo ngày");

		// TITLE
		Row titleRow1 = s1.createRow(0);
		titleRow1.createCell(0).setCellValue("BÁO CÁO DOANH THU THEO NGÀY - " + ym + ".xlxs");
		titleRow1.getCell(0).setCellStyle(titleStyle);
		// gộp 2 cột (Ngày | Doanh thu)
		s1.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));

		// HEADER
		Row h1 = s1.createRow(1);
		h1.createCell(0).setCellValue("Ngày");
		h1.createCell(1).setCellValue("Doanh thu");

		h1.getCell(0).setCellStyle(headerStyle);
		h1.getCell(1).setCellStyle(headerStyle);

		// DATA
		int r = 2;
		double totalDayRevenue = 0;

		for (var e : revenueByDay.entrySet()) {
			Row row = s1.createRow(r++);
			row.createCell(0).setCellValue(e.getKey());
			row.createCell(1).setCellValue(e.getValue());
			row.getCell(1).setCellStyle(moneyStyle);
			totalDayRevenue += e.getValue();
		}

		// TOTAL
		Row totalRow = s1.createRow(r);
		totalRow.createCell(0).setCellValue("TỔNG");
		totalRow.createCell(1).setCellValue(totalDayRevenue);
		totalRow.getCell(0).setCellStyle(headerStyle);
		totalRow.getCell(1).setCellStyle(headerStyle);

		s1.autoSizeColumn(0);
		s1.autoSizeColumn(1);

		// ===== SHEET 2: DOANH THU THEO CATEGORY =====
		Sheet s2 = wb.createSheet("Doanh thu theo danh mục");

		// TITLE
		Row titleRow2 = s2.createRow(0);
		titleRow2.createCell(0).setCellValue("BÁO CÁO DOANH THU THEO DANH MỤC");
		titleRow2.getCell(0).setCellStyle(titleStyle);
		s2.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));

		// HEADER
		Row h2 = s2.createRow(1);
		h2.createCell(0).setCellValue("Danh mục");
		h2.createCell(1).setCellValue("Doanh thu");

		h2.getCell(0).setCellStyle(headerStyle);
		h2.getCell(1).setCellStyle(headerStyle);

		// DATA
		r = 2;
		double totalCatRevenue = 0;

		for (var e : categoryRevenue.entrySet()) {
			Row row = s2.createRow(r++);
			row.createCell(0).setCellValue(e.getKey());
			row.createCell(1).setCellValue(e.getValue());
			row.getCell(1).setCellStyle(moneyStyle);
			totalCatRevenue += e.getValue();
		}

		// TOTAL
		Row totalRow2 = s2.createRow(r);
		totalRow2.createCell(0).setCellValue("TỔNG");
		totalRow2.createCell(1).setCellValue(totalCatRevenue);
		totalRow2.getCell(0).setCellStyle(headerStyle);
		totalRow2.getCell(1).setCellStyle(headerStyle);

		s2.autoSizeColumn(0);
		s2.autoSizeColumn(1);

		wb.write(os);
		wb.close();
	}
}
