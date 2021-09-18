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

public class PublicTextNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private NewsDAO newsDAO;

	public PublicTextNewsController() {
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
		int count = newsDAO.countAllTextNews();
		int pageSize = 4;
		int endPage = 0;
		endPage = count / pageSize;
		if (count % pageSize != 0) {
			endPage++;
		}
		int index = Integer.parseInt(request.getParameter("index"));
		request.setAttribute("index", index);
		ArrayList<News> textNewsList = newsDAO.getAllTextNewsPaging(index, pageSize);
		request.setAttribute("textNewsList", textNewsList);
		request.setAttribute("endPage", endPage);
		ArrayList<Categories> catList = catsDAO.getAllCategories();
		request.setAttribute("catList", catList);
		ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
		ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
		request.setAttribute("footballCatList", footballCatList);
		request.setAttribute("tennisCatList", tennisCatList);
		request.getRequestDispatcher("/public/pages/text.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
