package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class UserEditInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsersDAO usersDAO;

	public UserEditInfoController() {
		super();
		usersDAO = new UsersDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Users user_account = (Users) session.getAttribute("user_account");
		if (user_account == null) {
			response.sendRedirect(request.getContextPath() + "/index/login");
			return;
		}

		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/index?err=1");
			return;
		}

		Users user = usersDAO.getUserById(id);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/index?err=1");
			return;
		}
		request.setAttribute("user", user);
		request.getRequestDispatcher("/public/pages/edit_info.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Users user_account = (Users) session.getAttribute("user_account");
		if (user_account == null) {
			response.sendRedirect(request.getContextPath() + "/index/login");
			return;
		}

		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/index?err=1");
			return;
		}

		String username = request.getParameter("username");
		String oldpassword = request.getParameter("oldpassword");
		oldpassword = StringUtil.md5(oldpassword);
		if (usersDAO.checkPassword(username, oldpassword) <= 0) {
			request.setAttribute("user", user_account);
			request.getRequestDispatcher("/public/pages/edit_info.jsp?err=1").forward(request, response);
			return;
		}
		String password = request.getParameter("password");
		password = StringUtil.md5(password);
		String email = request.getParameter("email");

		Users user = usersDAO.getUserById(id);
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/index?err=1");
			return;
		}

		Part filePart = request.getPart("image");
		final String dirPartName = request.getServletContext().getRealPath("/files");
		File dirFile = new File(dirPartName);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		String fileName = FileUtil.getName(filePart);

		String image = "";
		if (fileName.isEmpty()) {
			image = user.getImage();
		} else {
			image = FileUtil.rename(fileName);
		}

		String filePartName = dirPartName + File.separator + image;

		Users userItem = new Users(id, username, password, email, image, "USER");

		if (usersDAO.editUsers(userItem) > 0) {
			if (!fileName.isEmpty()) {
				String oldFilePathName = dirPartName + File.separator + user.getImage();
				File oldFile = new File(oldFilePathName);
				if (oldFile.exists()) {
					oldFile.delete();
				}

				filePart.write(filePartName);
			}
			response.sendRedirect(request.getContextPath() + "/index?msg=2");
			return;

		} else {
			request.getRequestDispatcher("/public/pages/edit_info.jsp?err=1").forward(request, response);
			return;
		}
	}

}
