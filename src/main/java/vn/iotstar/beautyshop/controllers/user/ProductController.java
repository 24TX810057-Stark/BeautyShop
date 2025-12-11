package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.dao.ProductDAO;
import vn.iotstar.beautyshop.dao.impl.ProductDAOImpl;
import vn.iotstar.beautyshop.model.Product;

@WebServlet("/product")
public class ProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cidParam = req.getParameter("cid");

		// Nếu không có parameter cid, hiển thị trang với dữ liệu tĩnh
		if (cidParam == null || cidParam.isEmpty()) {
			// Không cần set products - JSP đã có dữ liệu tĩnh
			req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
			return;
		}

		try {
			int categoryId = Integer.parseInt(cidParam);
			ProductDAO pdao = new ProductDAOImpl();
			List<Product> list = pdao.findByCategory(categoryId);
			req.setAttribute("products", list);
		} catch (NumberFormatException e) {
			// Nếu cid không hợp lệ, hiển thị trang với dữ liệu tĩnh
		}

		req.getRequestDispatcher("/views/web/product-list.jsp").forward(req, resp);
	}
}
