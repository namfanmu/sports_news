package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Categories;
import model.bean.FootballCats;
import model.bean.News;
import model.bean.TennisCats;
import model.bean.Users;
import model.dao.CatsDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;

public class AdminIndexCatsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private NewsDAO newsDAO;

	public AdminIndexCatsController() {
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
		
		ArrayList<News> newsList=newsDAO.getAllNews();
		request.setAttribute("newsList", newsList);
		ArrayList<Categories> catList = catsDAO.getAllCategories();
		ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
		ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
		request.setAttribute("catList", catList);
		request.setAttribute("footballCatList", footballCatList);
		request.setAttribute("tennisCatList", tennisCatList);
		request.getRequestDispatcher("/admin/categories/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
