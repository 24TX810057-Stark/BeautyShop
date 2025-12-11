package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.model.Product;
import vn.iotstar.beautyshop.service.ProductService;
import vn.iotstar.beautyshop.service.impl.ProductServiceImpl;

@WebServlet("/search")
public class SearchController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = new ProductServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String keyword = req.getParameter("keyword");

		List<Product> result = service.search(keyword);

		req.setAttribute("products", result);
		req.setAttribute("keyword", keyword);

		req.getRequestDispatcher("/views/web/search.jsp").forward(req, resp);
	}
}
