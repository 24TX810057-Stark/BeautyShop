package vn.iotstar.beautyshop.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.beautyshop.configs.UploadConfig;

@WebServlet("/uploads/*")
public class ImageController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		File file = new File(UploadConfig.getBasePath(), req.getPathInfo());
		if (!file.exists()) {
			resp.setStatus(404);
			return;
		}
		resp.setContentType(getServletContext().getMimeType(file.getName()));
		Files.copy(file.toPath(), resp.getOutputStream());
	}
}
