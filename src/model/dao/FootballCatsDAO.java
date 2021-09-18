package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.FootballCats;
import util.DBConnectionUtil;

public class FootballCatsDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public ArrayList<FootballCats> getAllFootballCategories() {
		ArrayList<FootballCats> footballCatList = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `football_cats` WHERE cats_id = 1";
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				FootballCats footballCat = new FootballCats(rs.getInt(1), rs.getString(2), rs.getInt(3));
				footballCatList.add(footballCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return footballCatList;
	}

	public FootballCats getFootballCatById(int football_cat_id) {
		FootballCats footballCats = new FootballCats();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `football_cats` WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, football_cat_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				footballCats = new FootballCats(rs.getInt(1), rs.getString(2), rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return footballCats;
	}

	public int addCats(String nameCats) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "INSERT INTO football_cats(name)\r\n" + "VALUES(?)";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, nameCats);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int editCats(FootballCats footballCats) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "UPDATE football_cats SET name = ? WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, footballCats.getName());
			ps.setInt(2, footballCats.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteCats(int id) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "DELETE FROM football_cats WHERE id = ?";
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
