package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.bean.Categories;
import model.bean.FootballCats;
import model.bean.News;
import model.bean.TennisCats;
import model.bean.Users;
import model.dao.UsersDAO;
import util.FileUtil;
import util.StringUtil;

@MultipartConfig
public class UserRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsersDAO usersDAO;

	public UserRegisterController() {
		super();
		usersDAO = new UsersDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/public/pages/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String username = request.getParameter("username");
		if (usersDAO.checkUsername(username) > 0) {
			request.getRequestDispatcher("/public/pages/register.jsp?err=1").forward(request, response);
			return;
		}
		String password = request.getParameter("password");
		password = StringUtil.md5(password);
		String email = request.getParameter("email");

		Part filePart = request.getPart("image");
		final String dirPartName = request.getServletContext().getRealPath("/files");
		File dirFile = new File(dirPartName);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		String fileName = FileUtil.getName(filePart);
		String image = FileUtil.rename(fileName);
		String filePartName = dirPartName + File.separator + image;

		Users user = new Users(0, username, password, email, image, "USER");

		if (usersDAO.addUsers(user) > 0) {
			if (!fileName.isEmpty()) {
				filePart.write(filePartName);
			}
			response.sendRedirect(request.getContextPath() + "/index/login?msg=1");
			return;

		} else {
			request.getRequestDispatcher("/public/pages/register.jsp?err=2").forward(request, response);
			return;
		}
	}

}
