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

@WebServlet(urlPatterns = { "/category" })
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAOImpl();
        CategoryDAO categoryDAO = new CategoryDAOImpl();

        String idParam = req.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);

                // Load sản phẩm theo category
                List<Product> products = productDAO.findByCategory(id);
                req.setAttribute("products", products);

                // Load tên category cho breadcrumb
                Category category = categoryDAO.findById(id);
                if (category != null) {
                    req.setAttribute("categoryName", category.getName());
                }
            } catch (NumberFormatException e) {
                // Nếu id không hợp lệ, load tất cả sản phẩm
                List<Product> allProducts = productDAO.findAll();
                req.setAttribute("products", allProducts);
            }
        } else {
            // Không có id, load tất cả sản phẩm
            List<Product> allProducts = productDAO.findAll();
            req.setAttribute("products", allProducts);
        }

        req.getRequestDispatcher("/views/web/category.jsp").forward(req, resp);
    }
}
