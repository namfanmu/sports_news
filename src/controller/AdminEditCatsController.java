package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.FootballCats;
import model.bean.TennisCats;
import model.bean.Users;
import model.dao.CatsDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;

public class AdminEditCatsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private NewsDAO newsDAO;

	public AdminEditCatsController() {
		super();
		catsDAO = new CatsDAO();
		footballCatsDAO = new FootballCatsDAO();
		tennisCatsDAO = new TennisCatsDAO();
		newsDAO = new NewsDAO();
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
			response.sendRedirect(request.getContextPath() + "/admin/cats?err=1");
			return;
		}
		FootballCats footballCats = null;
		TennisCats tennisCats = null;
		if (id >= 1 && id <= 10) {
			footballCats = footballCatsDAO.getFootballCatById(id);
		} else if (id >= 11 && id <= 20) {
			tennisCats = tennisCatsDAO.getTennisCatById(id);
		}
		request.setAttribute("footballCats", footballCats);
		request.setAttribute("tennisCats", tennisCats);
		request.getRequestDispatcher("/admin/categories/edit.jsp").forward(request, response);
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

		int id = 0;
		int cats_id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
			cats_id = Integer.parseInt(request.getParameter("cats_id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/cats?err=1");
			return;
		}
		String nameCats = request.getParameter("name");
		FootballCats footballCats = new FootballCats(id, nameCats, cats_id);
		TennisCats tennisCats = new TennisCats(id, nameCats, cats_id);

		if (cats_id == 1) {
			if (footballCatsDAO.editCats(footballCats) > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/cats?msg=2");
				return;
			} else {
				request.getRequestDispatcher("/admin/categories/edit.jsp?err=1").forward(request, response);
				return;
			}
		} else {
			if (tennisCatsDAO.editCats(tennisCats) > 0) {
				response.sendRedirect(request.getContextPath() + "/admin/cats?msg=2");
				return;
			} else {
				request.getRequestDispatcher("/admin/categories/edit.jsp?err=1").forward(request, response);
				return;
			}
		}
	}

}
