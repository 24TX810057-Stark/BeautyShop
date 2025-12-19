package vn.iotstar.beautyshop.controllers.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.dao.ProductDAO;
import vn.iotstar.beautyshop.dao.impl.ProductDAOImpl;
import vn.iotstar.beautyshop.model.Product;

@WebServlet("/product-detail")
public class ProductDetailController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idParam = req.getParameter("id");

		// Nếu không có parameter id, hiển thị trang với dữ liệu tĩnh
		if (idParam == null || idParam.isEmpty()) {
			// Không cần set product - JSP đã có dữ liệu tĩnh
			req.getRequestDispatcher("/views/web/product-detail.jsp").forward(req, resp);
			return;
		}

		try {
			int id = Integer.parseInt(idParam);
			ProductDAO pdao = new ProductDAOImpl();
			Product p = pdao.findById(id);
			req.setAttribute("product", p);
		} catch (NumberFormatException e) {
			// Nếu id không hợp lệ, hiển thị trang với dữ liệu tĩnh
		}

		req.getRequestDispatcher("/views/web/product-detail.jsp").forward(req, resp);
	}
}
