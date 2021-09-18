package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Categories;
import util.DBConnectionUtil;

public class CatsDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> catList = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `categories` ORDER BY id ASC";
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Categories category = new Categories(rs.getInt(1), rs.getString(2));
				catList.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return catList;
	}

	public Categories getCatsById(int cats_id) {
		Categories categories = new Categories();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `categories` WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, cats_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				categories = new Categories(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categories;
	}

	

}
