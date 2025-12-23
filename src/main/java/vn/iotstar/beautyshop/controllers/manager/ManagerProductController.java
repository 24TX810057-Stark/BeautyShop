package vn.iotstar.beautyshop.controllers.manager;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.beautyshop.configs.UploadConfig;
import vn.iotstar.beautyshop.dao.CategoryDAO;
import vn.iotstar.beautyshop.dao.ProductDAO;
import vn.iotstar.beautyshop.dao.impl.CategoryDAOImpl;
import vn.iotstar.beautyshop.dao.impl.ProductDAOImpl;
import vn.iotstar.beautyshop.model.Category;
import vn.iotstar.beautyshop.model.Product;

@WebServlet(urlPatterns = { "/manager/products", "/manager/products/*" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
		maxFileSize = 1024 * 1024 * 5, // 5 MB
		maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class ManagerProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO = new ProductDAOImpl();
	private CategoryDAO categoryDAO = new CategoryDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		if (action == null) {
			action = "list";
		}

		switch (action) {
		case "add":
			showAddForm(req, resp);
			break;
		case "edit":
			showEditForm(req, resp);
			break;
		case "delete":
			deleteProduct(req, resp);
			break;
		default:
			listProducts(req, resp);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("add".equals(action)) {
			addProduct(req, resp);
		} else if ("edit".equals(action)) {
			updateProduct(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/manager/products");
		}
	}

	// Hiển thị danh sách sản phẩm
	private void listProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> products = productDAO.findAll();
		
		List<Category> categories = categoryDAO.findAll();
		req.setAttribute("products", products);
		req.setAttribute("categories", categories);

		// Kiểm tra thông báo từ session
		String message = (String) req.getSession().getAttribute("message");
		String messageType = (String) req.getSession().getAttribute("messageType");
		if (message != null) {
			req.setAttribute("message", message);
			req.setAttribute("messageType", messageType);
			req.getSession().removeAttribute("message");
			req.getSession().removeAttribute("messageType");
		}

		req.getRequestDispatcher("/views/manager/product/list.jsp").forward(req, resp);
	}

	// Hiển thị form thêm sản phẩm
	private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categories = categoryDAO.findAll();
		req.setAttribute("categories", categories);
		req.getRequestDispatcher("/views/manager/product/form.jsp").forward(req, resp);
	}

	// Hiển thị form sửa sản phẩm
	private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			Product product = productDAO.findById(id);
			if (product != null) {
				List<Category> categories = categoryDAO.findAll();
				req.setAttribute("product", product);
				req.setAttribute("categories", categories);
				req.getRequestDispatcher("/views/manager/product/form.jsp").forward(req, resp);
			} else {
				resp.sendRedirect(req.getContextPath() + "/manager/products");
			}
		} catch (NumberFormatException e) {
			resp.sendRedirect(req.getContextPath() + "/manager/products");
		}
	}

	// Thêm sản phẩm mới
	private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String priceStr = req.getParameter("price");
		String salePriceStr = req.getParameter("salePrice");
		String categoryIdStr = req.getParameter("categoryId");
		String description = req.getParameter("description");
		String imageName = uploadImage(req);

		if (name != null && !name.trim().isEmpty()) {
			try {
				Product product = new Product();
				product.setName(name.trim());
				product.setPrice(Double.parseDouble(priceStr));
				product.setSalePrice(
						salePriceStr != null && !salePriceStr.isEmpty() ? Double.parseDouble(salePriceStr) : 0);
				product.setCategoryId(Integer.parseInt(categoryIdStr));
				product.setDescription(description != null ? description.trim() : "");
				product.setImage(imageName != null ? imageName : "");
				productDAO.insert(product);

				req.getSession().setAttribute("message", "Thêm sản phẩm thành công!");
				req.getSession().setAttribute("messageType", "success");
			} catch (NumberFormatException e) {
				req.getSession().setAttribute("message", "Dữ liệu không hợp lệ!");
				req.getSession().setAttribute("messageType", "danger");
			}
		} else {
			req.getSession().setAttribute("message", "Vui lòng nhập tên sản phẩm!");
			req.getSession().setAttribute("messageType", "danger");
		}
		resp.sendRedirect(req.getContextPath() + "/manager/products");
	}

	// Cập nhật sản phẩm
	private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String priceStr = req.getParameter("price");
			String salePriceStr = req.getParameter("salePrice");
			String categoryIdStr = req.getParameter("categoryId");
			String description = req.getParameter("description");
			String imageName = uploadImage(req);

			// Nếu không upload ảnh mới, giữ ảnh cũ
			if (imageName == null) {
				Product oldProduct = productDAO.findById(id);
				if (oldProduct != null) {
					imageName = oldProduct.getImage();
				}
			}

			if (name != null && !name.trim().isEmpty()) {
				Product product = new Product();
				product.setId(id);
				product.setName(name.trim());
				product.setPrice(Double.parseDouble(priceStr));
				product.setSalePrice(
						salePriceStr != null && !salePriceStr.isEmpty() ? Double.parseDouble(salePriceStr) : 0);
				product.setCategoryId(Integer.parseInt(categoryIdStr));
				product.setDescription(description != null ? description.trim() : "");
				product.setImage(imageName != null ? imageName : "");
				productDAO.update(product);

				req.getSession().setAttribute("message", "Cập nhật sản phẩm thành công!");
				req.getSession().setAttribute("messageType", "success");
			} else {
				req.getSession().setAttribute("message", "Vui lòng nhập tên sản phẩm!");
				req.getSession().setAttribute("messageType", "danger");
			}
		} catch (NumberFormatException e) {
			req.getSession().setAttribute("message", "Dữ liệu không hợp lệ!");
			req.getSession().setAttribute("messageType", "danger");
		}
		resp.sendRedirect(req.getContextPath() + "/manager/products");
	}

	// Xóa sản phẩm
	private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			productDAO.delete(id);
			req.getSession().setAttribute("message", "Xóa sản phẩm thành công!");
			req.getSession().setAttribute("messageType", "success");
		} catch (NumberFormatException e) {
			req.getSession().setAttribute("message", "ID không hợp lệ!");
			req.getSession().setAttribute("messageType", "danger");
		}
		resp.sendRedirect(req.getContextPath() + "/manager/products");
	}

	// Upload hình ảnh
	private String uploadImage(HttpServletRequest req) throws IOException, ServletException {
		Part filePart = req.getPart("imageFile");
		if (filePart == null || filePart.getSize() == 0) {
			return null;
		}

		String submitted = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		if (submitted.isEmpty()) {
			return null;
		}

		// extension
		String ext = "";
		int dot = submitted.lastIndexOf('.');
		if (dot >= 0) {
			ext = submitted.substring(dot);
		}

		String fileName = "prod_" + UUID.randomUUID().toString().substring(0, 8) + ext;

		// === GHI FILE ĐÚNG CHỖ DUY NHẤT ===
		File dest = new File(UploadConfig.getProductUploadPath(), fileName);
		Files.copy(filePart.getInputStream(), dest.toPath());

		// === DB LƯU PATH TƯƠNG ĐỐI ===
		return "products/" + fileName;
	}

}
