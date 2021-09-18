package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Users;
import model.dao.CatsDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;
import model.dao.UsersDAO;

public class AdminDeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private NewsDAO newsDAO;
	private UsersDAO usersDAO;

	public AdminDeleteUserController() {
		super();
		catsDAO = new CatsDAO();
		footballCatsDAO = new FootballCatsDAO();
		tennisCatsDAO = new TennisCatsDAO();
		newsDAO = new NewsDAO();
		usersDAO = new UsersDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Users admin_account = (Users) session.getAttribute("admin_account");
		if (admin_account == null) {
			response.sendRedirect(request.getContextPath() + "/index/login");
			return;
		}

		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/users?err=1");
			return;
		}
		if (usersDAO.deleteUser(id) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/users?msg=1");
			return;
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/users?err=1");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
