package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Users;
import model.dao.UsersDAO;
import util.StringUtil;

public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsersDAO usersDAO;

	public UserLoginController() {
		super();
		usersDAO = new UsersDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/public/pages/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		password = StringUtil.md5(password);

		Users user = usersDAO.checkLogin(username, password);
		if (user != null && "USER".equals(user.getRole())) {
			HttpSession session = request.getSession();
			session.setAttribute("user_account", user);
			response.sendRedirect(request.getContextPath() + "/index");
			return;
		} else if (user != null && ("ADMIN".equals(user.getRole()) || "SUPER_MOD".equals(user.getRole())
				|| "MOD".equals(user.getRole()))) {
			HttpSession session = request.getSession();
			session.setAttribute("admin_account", user);
			response.sendRedirect(request.getContextPath() + "/admin/index");
			return;

		} else {
			response.sendRedirect(request.getContextPath() + "/index/login?err=1");
			return;
		}
	}

}
