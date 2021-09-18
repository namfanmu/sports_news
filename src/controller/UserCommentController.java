package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Comments;
import model.bean.Users;
import model.dao.CommentDAO;
import model.dao.UsersDAO;

public class UserCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommentDAO commentDAO;
	private UsersDAO usersDAO;

	public UserCommentController() {
		super();
		commentDAO = new CommentDAO();
		usersDAO = new UsersDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Users user_account = (Users) session.getAttribute("user_account");
		if (user_account == null) {
			response.sendRedirect(request.getContextPath() + "/index/detail?err=1");
			return;
		} else {
			String cmt = request.getParameter("cmt");
			int news_id = Integer.parseInt(request.getParameter("news_id"));
			Comments comment = new Comments(0, user_account.getUsername(), user_account.getImage(), cmt, null, news_id);
			if (commentDAO.addComment(comment) > 0) {
				int count = commentDAO.countAllCommentByNews_id(news_id);
				int pageSize = 4;
				int endPage = 0;
				endPage = count / pageSize;
				if (count % pageSize != 0) {
					endPage++;
				}
				int index = Integer.parseInt(request.getParameter("index"));
				request.setAttribute("index", index);
				request.setAttribute("endPage", endPage);
				ArrayList<Comments> cmtList = commentDAO.getAllCommentPagingByNews_id(index, pageSize, news_id);
				request.setAttribute("cmtList", cmtList);
				if (cmtList.size() > 0) {
					for (Comments item : cmtList) {
						response.getWriter().println(
								"<div class=\"comment-box\"><div class=\"d-flex align-items-center\"><div class=\"rotate-img\"><img src=\"/sport_news_jsp_project/files/" + item.getImage() + "\" alt=\"banner\" class=\"img-fluid img-rounded mr-3\" /></div><div><p class=\"fs-12 mb-1 line-height-xs\">" + item.getComment_date() + "</p><p class=\"fs-16 font-weight-600 mb-0 line-height-xs\">" + item.getUsername() + "</p></div></div><p class=\"fs-12 mt-3\" style=\"font-size: 16px;\">" + item.getComment() + "</p></div>");
					}
				}
			}
		}

	}

}
