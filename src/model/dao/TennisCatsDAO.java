package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.TennisCats;
import util.DBConnectionUtil;

public class TennisCatsDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public ArrayList<TennisCats> getAllTennisCategories() {
		ArrayList<TennisCats> tennisCatList = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `tennis_cats` WHERE cats_id = 2";
		try {
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				TennisCats tennisCat = new TennisCats(rs.getInt(1), rs.getString(2), rs.getInt(3));
				tennisCatList.add(tennisCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return tennisCatList;
	}

	public TennisCats getTennisCatById(int tennis_cat_id) {
		TennisCats tennisCats = new TennisCats();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `tennis_cats` WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, tennis_cat_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				tennisCats = new TennisCats(rs.getInt(1), rs.getString(2), rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tennisCats;
	}

	public int addCats(String nameCats) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "INSERT INTO tennis_cats(name)\r\n" + "VALUES(?)";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, nameCats);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int editCats(TennisCats tennisCats) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "UPDATE tennis_cats SET name = ? WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, tennisCats.getName());
			ps.setInt(2, tennisCats.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteCats(int id) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "DELETE FROM tennis_cats WHERE id = ?";
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
