package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.Categories;
import model.bean.FootballCats;
import model.bean.News;
import model.bean.TennisCats;
import model.bean.Users;
import model.dao.CatsDAO;
import model.dao.FootballCatsDAO;
import model.dao.NewsDAO;
import model.dao.TennisCatsDAO;
import util.FileUtil;

@MultipartConfig
public class AdminEditNewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatsDAO catsDAO;
	private FootballCatsDAO footballCatsDAO;
	private TennisCatsDAO tennisCatsDAO;
	private NewsDAO newsDAO;

	public AdminEditNewsController() {
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
			response.sendRedirect(request.getContextPath() + "/admin/news?err=1");
			return;
		}
		News news = newsDAO.getNewsById(id);

		if (news == null) {
			response.sendRedirect(request.getContextPath() + "/admin/news?err=1");
			return;
		}
		request.setAttribute("news", news);
		ArrayList<Categories> catList = catsDAO.getAllCategories();
		ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
		ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
		request.setAttribute("catList", catList);
		request.setAttribute("footballCatList", footballCatList);
		request.setAttribute("tennisCatList", tennisCatList);
		request.getRequestDispatcher("/admin/news/edit.jsp").forward(request, response);
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
		
		int cat_id = 0;
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
			cat_id = Integer.parseInt(request.getParameter("cats"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/news?err=1");
			return;
		}
		int cat_news_id = 0;
		try {
			cat_news_id = Integer.parseInt(request.getParameter("cat_news"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/news?err=1");
			return;
		}
		int cats_id = 0;
		int football_cat_id = 0;
		int tennis_cat_id = 0;
		if (cat_id >= 1 && cat_id <= 10) {
			cats_id = 1;
			football_cat_id = cat_id;
		} else if (cat_id >= 11 && cat_id <= 20) {
			cats_id = 2;
			tennis_cat_id = cat_id;
		}
		String title = request.getParameter("title");
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		String url_video = request.getParameter("url_video");

		News news = newsDAO.getNewsById(id);
		if (news == null) {
			response.sendRedirect(request.getContextPath() + "/admin/news?err=1");
			return;
		}

		Part filePart = request.getPart("image");
		final String dirPartName = request.getServletContext().getRealPath("/files");
		File dirFile = new File(dirPartName);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		String fileName = FileUtil.getName(filePart);

		String image = "";
		if (fileName.isEmpty()) {
			image = news.getImage();
		} else {
			image = FileUtil.rename(fileName);
		}

		String filePartName = dirPartName + File.separator + image;

		News newsItem = new News(id, title, preview, detail, null, 0, cats_id, football_cat_id, tennis_cat_id,
				cat_news_id, image, url_video, null);
		
		if (newsDAO.editNews(newsItem) > 0) {
			if (!fileName.isEmpty()) {
				String oldFilePathName = dirPartName + File.separator + news.getImage();
				File oldFile = new File(oldFilePathName);
				if (oldFile.exists()) {
					oldFile.delete();
				}

				filePart.write(filePartName);
			}
			response.sendRedirect(request.getContextPath() + "/admin/news?msg=2");
			return;

		} else {
			ArrayList<Categories> catList = catsDAO.getAllCategories();
			ArrayList<FootballCats> footballCatList = footballCatsDAO.getAllFootballCategories();
			ArrayList<TennisCats> tennisCatList = tennisCatsDAO.getAllTennisCategories();
			request.setAttribute("catList", catList);
			request.setAttribute("footballCatList", footballCatList);
			request.setAttribute("tennisCatList", tennisCatList);
			request.getRequestDispatcher("/admin/news/add.jsp?err=1").forward(request, response);
			return;
		}
	}

}
