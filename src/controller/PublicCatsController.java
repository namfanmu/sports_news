package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Categories;
import model.bean.FootballCats;
import model.bean.News;
import model.bean.TennisCats;
import model.dao.CatsDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;

public class PublicCatsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsDAO newsDAO;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;

	public PublicCatsController() {
		super();
		newsDAO = new NewsDAO();
		tennisCatsDAO = new TennisCatsDAO();
		footballCatsDAO = new FootballCatsDAO();
		catsDAO = new CatsDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int cats_id = 0;

		try {
			cats_id = Integer.parseInt(request.getParameter("cats_id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		request.setAttribute("cats_id", cats_id);
		
		int count = newsDAO.countAllTextNewsByCats_id(cats_id);
		int pageSize = 4;
		int endPage = 0;
		endPage = count / pageSize;
		if (count % pageSize != 0) {
			endPage++;
		}
		int index = Integer.parseInt(request.getParameter("index"));
		request.setAttribute("index", index);
		request.setAttribute("endPage", endPage);
		
		
		ArrayList<News> textNewsList = newsDAO.getAllTextNewsByCats_idAndPaging(index, pageSize, cats_id);
		request.setAttribute("textNewsList", textNewsList);
		FootballCats footballCats = new FootballCats();
		TennisCats tennisCats = new TennisCats();
		if (cats_id >= 1 && cats_id <= 10) {
			footballCats = footballCatsDAO.getFootballCatById(cats_id);
			request.setAttribute("footballCats", footballCats);
		} else if (cats_id >= 11 && cats_id <= 20) {
			tennisCats = tennisCatsDAO.getTennisCatById(cats_id);
			request.setAttribute("tennisCats", tennisCats);
		}
		ArrayList<Categories> catList = catsDAO.getAllCategories();
		request.setAttribute("catList", catList);
		ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
		ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
		request.setAttribute("footballCatList", footballCatList);
		request.setAttribute("tennisCatList", tennisCatList);
		request.getRequestDispatcher("/public/pages/sports.jsp").forward(request, response);
		
//		int count = newsDAO.countAllTextNews();
//		int pageSize = 4;
//		int endPage = 0;
//		endPage = count / pageSize;
//		if (count % pageSize != 0) {
//			endPage++;
//		}
//		int index = Integer.parseInt(request.getParameter("index"));
//		request.setAttribute("index", index);
//		ArrayList<News> textNewsList = newsDAO.getAllTextNewsPaging(index, pageSize);
//		request.setAttribute("textNewsList", textNewsList);
//		request.setAttribute("endPage", endPage);
//		ArrayList<Categories> catList = catsDAO.getAllCategories();
//		request.setAttribute("catList", catList);
//		ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
//		ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
//		request.setAttribute("footballCatList", footballCatList);
//		request.setAttribute("tennisCatList", tennisCatList);
//		request.getRequestDispatcher("/public/pages/text.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
