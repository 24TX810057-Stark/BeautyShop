package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.dao.CategoryDAO;
import vn.iotstar.beautyshop.dao.ProductDAO;
import vn.iotstar.beautyshop.dao.impl.CategoryDAOImpl;
import vn.iotstar.beautyshop.dao.impl.ProductDAOImpl;
import vn.iotstar.beautyshop.model.Category;
import vn.iotstar.beautyshop.model.Product;

@WebServlet("/product")
public class ProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductDAO productDAO = new ProductDAOImpl();
		CategoryDAO categoryDAO = new CategoryDAOImpl();

		// Load categories cho sidebar
		List<Category> categories = categoryDAO.findAll();
		req.setAttribute("categories", categories);

		String cidParam = req.getParameter("cid");

		if (cidParam != null && !cidParam.isEmpty()) {
			try {
				int categoryId = Integer.parseInt(cidParam);
				List<Product> list = productDAO.findByCategory(categoryId);
				req.setAttribute("products", list);
			} catch (NumberFormatException e) {
				// Nếu cid không hợp lệ, load tất cả sản phẩm
				List<Product> allProducts = productDAO.findAll();
				req.setAttribute("products", allProducts);
			}
		} else {
			// Không có cid, load tất cả sản phẩm
			List<Product> allProducts = productDAO.findAll();
			req.setAttribute("products", allProducts);
		}

		req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
	}
}
