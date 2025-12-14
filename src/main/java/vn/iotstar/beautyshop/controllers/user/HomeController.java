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

@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CategoryDAO categoryDAO = new CategoryDAOImpl();
		ProductDAO productDAO = new ProductDAOImpl();

		// Load danh mục
		List<Category> categories = categoryDAO.findAll();
		req.setAttribute("categories", categories);

		// Load tất cả sản phẩm
		List<Product> allProducts = productDAO.findAll();
		req.setAttribute("products", allProducts);

		// Sản phẩm mới nhất (8 sản phẩm)
		List<Product> latestProducts = productDAO.findLatest();
		req.setAttribute("newProducts", latestProducts);

		// Flash Sale - lấy sản phẩm có giá sale > 0
		List<Product> saleProducts = allProducts.stream()
				.filter(p -> p.getSalePrice() > 0)
				.limit(5)
				.toList();
		req.setAttribute("flashSaleProducts", saleProducts);

		// Featured Products - 5 sản phẩm đầu tiên
		List<Product> featuredProducts = allProducts.stream()
				.limit(5)
				.toList();
		req.setAttribute("featuredProducts", featuredProducts);

		req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
	}
}
