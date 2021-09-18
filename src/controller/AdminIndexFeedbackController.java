package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Feedback;
import model.bean.Users;
import model.dao.FeedbackDAO;

public class AdminIndexFeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FeedbackDAO feedbackDAO;

	public AdminIndexFeedbackController() {
		super();
		feedbackDAO = new FeedbackDAO();
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
		
		ArrayList<Feedback> feedbackList = feedbackDAO.getAllFeedback();
		request.setAttribute("feedbackList", feedbackList);
		request.getRequestDispatcher("/admin/feedbacks/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
