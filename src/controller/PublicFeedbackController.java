package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Categories;
import model.bean.Feedback;
import model.bean.FootballCats;
import model.bean.TennisCats;
import model.bean.Users;
import model.dao.CatsDAO;
import model.dao.FeedbackDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;

public class PublicFeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsDAO newsDAO;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private FeedbackDAO feedbackDAO;

	public PublicFeedbackController() {
		super();
		newsDAO = new NewsDAO();
		tennisCatsDAO = new TennisCatsDAO();
		footballCatsDAO = new FootballCatsDAO();
		catsDAO = new CatsDAO();
		feedbackDAO = new FeedbackDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		ArrayList<Categories> catList = catsDAO.getAllCategories();
		request.setAttribute("catList", catList);
		ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
		ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
		request.setAttribute("footballCatList", footballCatList);
		request.setAttribute("tennisCatList", tennisCatList);
		request.getRequestDispatcher("/public/pages/feedback.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Users user_account = (Users) session.getAttribute("user_account");
		if (user_account == null) {
			response.sendRedirect(request.getContextPath() + "/index/feedback?err=1");
			return;
		} else {
			String txtFeedback = request.getParameter("feedback");
			Feedback feedback = new Feedback(0, user_account.getUsername(), user_account.getEmail(), txtFeedback);
			if (feedbackDAO.addFeedback(feedback) > 0) {
				response.sendRedirect(request.getContextPath() + "/index/feedback?msg=1");
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/index/feedback?err=1");
				return;
			}
		}
	}

}
