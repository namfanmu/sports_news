package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Feedback;
import model.bean.Users;
import model.dao.CatsDAO;
import model.dao.CommentDAO;
import model.dao.FeedbackDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;
import model.dao.UsersDAO;

public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private NewsDAO newsDAO;
	private UsersDAO usersDAO;
	private FeedbackDAO feedbackDAO;
	private CommentDAO commentDAO;

	public AdminIndexController() {
		super();
		catsDAO = new CatsDAO();
		footballCatsDAO = new FootballCatsDAO();
		tennisCatsDAO = new TennisCatsDAO();
		newsDAO = new NewsDAO();
		usersDAO = new UsersDAO();
		feedbackDAO = new FeedbackDAO();
		commentDAO = new CommentDAO();
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
		int countAllUsers = usersDAO.countAllUsers();
		request.setAttribute("countAllUsers", countAllUsers);

		int countAllNews = newsDAO.countAllNews();
		request.setAttribute("countAllNews", countAllNews);

		int countAllFeedbacks = feedbackDAO.countAllFeedbacks();
		request.setAttribute("countAllFeedbacks", countAllFeedbacks);
		
		int countAllComments = commentDAO.countAllComments();
		request.setAttribute("countAllComments", countAllComments);
		request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
