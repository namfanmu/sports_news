package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bean.CatNews;
import util.DBConnectionUtil;

public class CatNewsDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public CatNews getCatNewsById(int cat_news_id) {
		CatNews catNews = new CatNews();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `cat_news` WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, cat_news_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				catNews = new CatNews(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return catNews;
	}

}
