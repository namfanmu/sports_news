package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.News;
import util.DBConnectionUtil;

public class NewsDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public int addNews(News news) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		if (news.getFootball_cat_id() == 0) {
			String query = "INSERT INTO news(title,preview,detail,cats_id,tennis_cat_id,cat_news_id,image,url_video,author)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, news.getTitle());
				ps.setString(2, news.getPreview());
				ps.setString(3, news.getDetail());
				ps.setInt(4, news.getCat_id());
				ps.setInt(5, news.getTennis_cat_id());
				ps.setInt(6, news.getCat_news_id());
				ps.setString(7, news.getImage());
				ps.setString(8, news.getUrl_video());
				ps.setString(9, news.getAuthor());
				result = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (news.getTennis_cat_id() == 0) {
			String query = "INSERT INTO news(title,preview,detail,cats_id,football_cat_id,cat_news_id,image,url_video, author)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?,?)";
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, news.getTitle());
				ps.setString(2, news.getPreview());
				ps.setString(3, news.getDetail());
				ps.setInt(4, news.getCat_id());
				ps.setInt(5, news.getFootball_cat_id());
				ps.setInt(6, news.getCat_news_id());
				ps.setString(7, news.getImage());
				ps.setString(8, news.getUrl_video());
				ps.setString(9, news.getAuthor());
				result = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public ArrayList<News> getAllNews() {
		ArrayList<News> newsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` ORDER BY id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				newsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newsList;
	}

	public ArrayList<News> getAllTextNews() {
		ArrayList<News> textNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` WHERE cat_news_id = 1";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				textNewsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return textNewsList;
	}

	public ArrayList<News> getAllVideoNews() {
		ArrayList<News> videoNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` WHERE cat_news_id = 2 ORDER BY id DESC LIMIT 4";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				videoNewsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return videoNewsList;
	}

	public News getLatestTextNews() {
		News latestTextNews = new News();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM news WHERE cat_news_id = 1 ORDER BY id DESC LIMIT 1";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				latestTextNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return latestTextNews;
	}

	public ArrayList<News> getMostViewTextNews() {
		ArrayList<News> mostViewTextNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` WHERE cat_news_id = 1 ORDER BY view DESC LIMIT 3";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				mostViewTextNewsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mostViewTextNewsList;
	}

	public ArrayList<News> getAllNewsExceptLatest() {
		ArrayList<News> newsExceptLatestList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM news WHERE id != (SELECT MAX(id) FROM news WHERE cat_news_id = 1) AND cat_news_id = 1 ORDER BY id DESC LIMIT 4";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				newsExceptLatestList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newsExceptLatestList;
	}

	public ArrayList<News> getMostViewVideoNews() {
		ArrayList<News> mostViewVideoNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` WHERE cat_news_id = 2 ORDER BY view DESC LIMIT 3";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				mostViewVideoNewsList.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mostViewVideoNewsList;
	}

	public News getNewsById(int id) {
		News news = new News();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5),
						rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
						rs.getString(12), rs.getString(13));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return news;
	}

	public ArrayList<News> getAllLatestNews() {
		ArrayList<News> allLatestNews = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` ORDER BY id DESC LIMIT 3";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				allLatestNews.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allLatestNews;
	}

	public ArrayList<News> getAllMostViewNews() {
		ArrayList<News> allMostViewNews = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` ORDER BY view DESC LIMIT 3";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				allMostViewNews.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allMostViewNews;
	}

	public ArrayList<News> getAllMostViewTextNews() {
		ArrayList<News> allMostViewTextNews = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` WHERE cat_news_id=1 ORDER BY view DESC LIMIT 3";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				allMostViewTextNews.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allMostViewTextNews;
	}

	public ArrayList<News> getRelatedNews(News news) {
		ArrayList<News> relatedNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM news WHERE cats_id = ? && cat_news_id = ? && id != ? ORDER BY id DESC LIMIT 2";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, news.getCat_id());
			ps.setInt(2, news.getCat_news_id());
			ps.setInt(3, news.getId());
			rs = ps.executeQuery();
			while (rs.next()) {
				News relatedNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				relatedNewsList.add(relatedNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return relatedNewsList;
	}

	public ArrayList<News> getAllTextNewsByCats_id(int cats_id) {
		ArrayList<News> textNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = null;
		if (cats_id >= 1 && cats_id <= 10) {
			query = "SELECT * FROM `news` WHERE cat_news_id =1 AND football_cat_id = ?";
		} else if (cats_id >= 11 && cats_id <= 20) {
			query = "SELECT * FROM `news` WHERE cat_news_id =1 AND tennis_cat_id = ?";
		}
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, cats_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				News textNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				textNewsList.add(textNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return textNewsList;
	}

	public int countNews(String txtSearch) {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM news WHERE title LIKE ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public ArrayList<News> getAllNewsBySearch(String txtSearch) {
		ArrayList<News> searchedNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM news WHERE title LIKE ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				News textNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				searchedNewsList.add(textNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchedNewsList;
	}

	public ArrayList<News> getNewsBySearchAndPaging(String txtSearch, int index, int pageSize) {
		ArrayList<News> topNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "WITH x AS (SELECT *,ROW_NUMBER() over (ORDER BY id DESC) AS intRow FROM `news` WHERE title LIKE ?)\r\n"
				+ "SELECT * FROM x WHERE intRow BETWEEN ? * 4 - 3 and ? * 4";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			ps.setInt(2, index);
			ps.setInt(3, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				News textNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				topNewsList.add(textNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return topNewsList;
	}

	public int editNews(News newsItem) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		if (newsItem.getFootball_cat_id() == 0) {
			String query = "UPDATE news SET title = ?,preview = ?,detail = ?,cats_id = ?, tennis_cat_id = ?,cat_news_id = ?,image = ?,url_video = ?\r\n"
					+ "WHERE id = ?";
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, newsItem.getTitle());
				ps.setString(2, newsItem.getPreview());
				ps.setString(3, newsItem.getDetail());
				ps.setInt(4, newsItem.getCat_id());
				ps.setInt(5, newsItem.getTennis_cat_id());
				ps.setInt(6, newsItem.getCat_news_id());
				ps.setString(7, newsItem.getImage());
				ps.setString(8, newsItem.getUrl_video());
				ps.setInt(9, newsItem.getId());
				result = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (newsItem.getTennis_cat_id() == 0) {
			String query = "UPDATE news SET title = ?,preview = ?,detail = ?,cats_id = ?, football_cat_id = ?,cat_news_id = ?,image = ?,url_video = ?\r\n"
					+ "WHERE id = ?";
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, newsItem.getTitle());
				ps.setString(2, newsItem.getPreview());
				ps.setString(3, newsItem.getDetail());
				ps.setInt(4, newsItem.getCat_id());
				ps.setInt(5, newsItem.getFootball_cat_id());
				ps.setInt(6, newsItem.getCat_news_id());
				ps.setString(7, newsItem.getImage());
				ps.setString(8, newsItem.getUrl_video());
				ps.setInt(9, newsItem.getId());
				result = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int countAllTextNews() {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM news WHERE cat_news_id = 1";
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public ArrayList<News> getAllTextNewsPaging(int index, int pageSize) {
		ArrayList<News> allTextNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "WITH x AS (SELECT *,ROW_NUMBER() over (ORDER BY id DESC) AS intRow FROM `news` WHERE cat_news_id = 1) SELECT * FROM x WHERE intRow BETWEEN ? * 4 - 3 and ? * 4";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, index);
			ps.setInt(2, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				News textNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				allTextNewsList.add(textNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allTextNewsList;
	}

	public int countAllVideoNews() {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM news WHERE cat_news_id = 2";
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public ArrayList<News> getAllVideoNewsPaging(int index, int pageSize) {
		ArrayList<News> allVideoNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "WITH x AS (SELECT *,ROW_NUMBER() over (ORDER BY id DESC) AS intRow FROM `news` WHERE cat_news_id = 2) SELECT * FROM x WHERE intRow BETWEEN ? * 4 - 3 and ? * 4";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, index);
			ps.setInt(2, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				News videoNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				allVideoNewsList.add(videoNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allVideoNewsList;
	}

	public ArrayList<News> getAllMostViewVideoNews() {
		ArrayList<News> allMostViewVideoNews = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `news` WHERE cat_news_id = 2 ORDER BY view DESC LIMIT 3";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				allMostViewVideoNews.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allMostViewVideoNews;
	}

	public int countAllNews() {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM news";
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public void increaseView(int id) {
		conn = DBConnectionUtil.getConnection();
		String query = "UPDATE news SET view = view + 1 WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public int countAllTextNewsByCats_id(int cats_id) {
		conn = DBConnectionUtil.getConnection();
		String query = null;
		if (cats_id >= 1 && cats_id <= 10) {
			query = "SELECT COUNT(*) FROM news WHERE cat_news_id = 1 AND football_cat_id = ?";
		} else if (cats_id >= 11 && cats_id <= 20) {
			query = "SELECT COUNT(*) FROM news WHERE cat_news_id = 1 AND tennis_cat_id = ?";
		}
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, cats_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public String getRoleByUsername(String username) {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT role FROM `users` WHERE username = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<News> getAllTextNewsByCats_idAndPaging(int index, int pageSize, int cats_id) {
		ArrayList<News> allTextNewsList = new ArrayList<News>();
		conn = DBConnectionUtil.getConnection();
		String query = null;
		if (cats_id >= 1 && cats_id <= 10) {
			query = "WITH x AS (SELECT *,ROW_NUMBER() over (ORDER BY id DESC) AS intRow FROM `news` WHERE cat_news_id = 1 AND football_cat_id = ?) SELECT * FROM x WHERE intRow BETWEEN ? * 4 - 3 and ? * 4";
		} else if (cats_id >= 11 && cats_id <= 20) {
			query = "WITH x AS (SELECT *,ROW_NUMBER() over (ORDER BY id DESC) AS intRow FROM `news` WHERE cat_news_id = 1 AND tennis_cat_id = ?) SELECT * FROM x WHERE intRow BETWEEN ? * 4 - 3 and ? * 4";
		}
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, cats_id);
			ps.setInt(2, index);
			ps.setInt(3, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				News textNews = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13));
				allTextNewsList.add(textNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return allTextNewsList;
	}

	public int deleteNews(int id) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "DELETE FROM news WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
