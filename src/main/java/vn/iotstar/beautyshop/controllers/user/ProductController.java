package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.dao.CategoryDAO;
import vn.iotstar.beautyshop.dao.ProductDAO;
import vn.iotstar.beautyshop.dao.impl.CategoryDAOImpl;
import vn.iotstar.beautyshop.dao.impl.ProductDAOImpl;

@WebServlet("/product")
public class ProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductDAO productDAO = new ProductDAOImpl();
		CategoryDAO categoryDAO = new CategoryDAOImpl();

		// Categories
		req.setAttribute("categories", categoryDAO.findAll());

		// Sort
		String sort = req.getParameter("sort");
		if (sort == null || sort.isEmpty())
			sort = "new";

		// Price
		Double min = null, max = null;
		try {
			if (req.getParameter("min") != null)
				min = Double.parseDouble(req.getParameter("min"));
			if (req.getParameter("max") != null)
				max = Double.parseDouble(req.getParameter("max"));
		} catch (Exception ignored) {
		}

		// Category
		String cidParam = req.getParameter("cid");
		Integer categoryId = null;
		try {
			if (cidParam != null)
				categoryId = Integer.parseInt(cidParam);
		} catch (NumberFormatException ignored) {
		}
		// ===== 1. BEST SELLER =====
		String type = req.getParameter("type");

		if ("best-seller".equals(type)) {

			req.setAttribute("products", productDAO.findBestSeller(12));
			req.setAttribute("pageTitle", "Best Seller");
		}
		// ===== 1.1DEAL HOT DƯỚI 100K =====
		else if ("deal-100k".equals(type)) {

			req.setAttribute("products", productDAO.findDealUnder100k(sort));
			req.setAttribute("pageTitle", "Deal hot dưới 100K");

		}

		// ===== 2. FILTER GIÁ =====
		else if (min != null || max != null) {

			req.setAttribute("products", productDAO.findByPriceRange(min, max, sort));
			req.setAttribute("pageTitle", "Lọc theo giá");

		}
		// ===== 3. CATEGORY THƯỜNG =====
		else if (categoryId != null) {

			req.setAttribute("products", productDAO.findByCategory(categoryId, sort));

		}
		// ===== 4. ALL =====
		else {

			req.setAttribute("products", productDAO.findAll(sort));
			req.setAttribute("pageTitle", "Tất cả sản phẩm");

		}

		req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
	}
}
