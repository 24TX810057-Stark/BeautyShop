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

		// Sản phẩm mới
		List<Product> newProducts = productDAO.findLatest();
		req.setAttribute("newProducts", newProducts);

		// Lấy tất cả sản phẩm (không dính sort)
		List<Product> allProducts = productDAO.findAll("new");

		// Flash Sale
		List<Product> flashSaleProducts = allProducts.stream().filter(p -> p.getSalePrice() > 0).limit(8).toList();
		req.setAttribute("flashSaleProducts", flashSaleProducts);

		// Featured
		List<Product> featuredProducts = allProducts.stream().limit(8).toList();
		req.setAttribute("featuredProducts", featuredProducts);
		
	    // Best Seller
	    List<Product> bestSellerProducts = productDAO.findBestSeller(8);
	    req.setAttribute("bestSellerProducts", bestSellerProducts);

		req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
	}
}
