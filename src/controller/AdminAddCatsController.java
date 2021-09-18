package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Users;
import model.dao.FootballCatsDAO;
import model.dao.TennisCatsDAO;

public class AdminAddCatsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;

	public AdminAddCatsController() {
		super();
		footballCatsDAO = new FootballCatsDAO();
		tennisCatsDAO = new TennisCatsDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/admin/categories/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

		int cats_id = 0;
		try {
			cats_id = Integer.parseInt(request.getParameter("cats_id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/cats?err=1");
			return;
		}
		String nameCats = request.getParameter("name");

		if (cats_id == 1) {
			if (footballCatsDAO.addCats(nameCats) > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/cats?msg=1");
				return;
			} else {
				request.getRequestDispatcher("/admin/categories/add.jsp?err=1").forward(request, response);
				return;
			}
		} else {
			if (tennisCatsDAO.addCats(nameCats) > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/cats?msg=1");
				return;
			} else {
				request.getRequestDispatcher("/admin/categories/add.jsp?err=1").forward(request, response);
				return;
			}
		}

	}

}
