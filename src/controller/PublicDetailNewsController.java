package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Categories;
import model.bean.Comments;
import model.bean.FootballCats;
import model.bean.News;
import model.bean.TennisCats;
import model.dao.CatsDAO;
import model.dao.CommentDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;

public class PublicDetailNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private NewsDAO newsDAO;
	private CommentDAO commentDAO;

	public PublicDetailNewsController() {
		catsDAO = new CatsDAO();
		footballCatsDAO = new FootballCatsDAO();
		tennisCatsDAO = new TennisCatsDAO();
		newsDAO = new NewsDAO();
		commentDAO = new CommentDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		News news = newsDAO.getNewsById(id);
		ArrayList<Categories> catList = catsDAO.getAllCategories();
		ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
		ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
		ArrayList<News> textNewsList = newsDAO.getAllTextNews();
		ArrayList<News> videoNewsList = newsDAO.getAllVideoNews();
		request.setAttribute("news", news);
		request.setAttribute("catList", catList);
		request.setAttribute("footballCatList", footballCatList);
		request.setAttribute("tennisCatList", tennisCatList);
		request.setAttribute("textNewsList", textNewsList);
		request.setAttribute("videoNewsList", videoNewsList);
		
		HttpSession session = request.getSession();
		String hasVisited = (String) session.getAttribute("hasVisited: " + id);
		if (hasVisited == null) {
			session.setAttribute("hasVisited: " + id, "Yes");
			session.setMaxInactiveInterval(2000);
		}
		newsDAO.increaseView(id);
		
		
		int count = commentDAO.countAllCommentByNews_id(id);
		int pageSize = 4;
		int endPage = 0;
		endPage = count / pageSize;
		if (count % pageSize != 0) {
			endPage++;
		}
		int index = Integer.parseInt(request.getParameter("index"));
		request.setAttribute("index", index);
		request.setAttribute("endPage", endPage);
		ArrayList<Comments> cmtList = commentDAO.getAllCommentPagingByNews_id(index, pageSize, id);
		request.setAttribute("cmtList", cmtList);
		
		request.getRequestDispatcher("/public/pages/detailnews.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
