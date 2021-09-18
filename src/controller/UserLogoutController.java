package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLogoutController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int index=Integer.parseInt(request.getParameter("index"));
		if(index==1) {
			session.removeAttribute("admin_account");
		} else {
			session.removeAttribute("user_account");
		}
		response.sendRedirect(request.getContextPath() + "/index/login");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
