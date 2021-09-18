package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Users;
import util.DBConnectionUtil;

public class UsersDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public int addUsers(Users user) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "INSERT INTO users(username,password,email,image,role)\r\n" + "VALUES(?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getImage());
			ps.setString(5, user.getRole());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Users checkLogin(String username, String password) {
		Users user = null;
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM users\r\n" + "WHERE username = ? AND password = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				user = new Users(rs.getInt(1), username, password, rs.getString(4), rs.getString(5), rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public ArrayList<Users> getAllUsers() {
		ArrayList<Users> usersList = new ArrayList<Users>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `users` ORDER BY id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				Users user = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
				usersList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usersList;
	}

	public int countAllUsers() {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM users WHERE role = 'USER'";
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

	public int deleteUser(int id) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "DELETE FROM users WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int checkUsername(String username) {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM `users` WHERE username ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public Users getUserById(int id) {
		Users user = new Users();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `users` WHERE id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				user = new Users(id, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public int checkPassword(String username, String oldpassword) {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM `users` WHERE username = ? AND password = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, oldpassword);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public int editUsers(Users userItem) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "UPDATE users SET password = ?,email = ?,image = ? WHERE id = ? ";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, userItem.getPassword());
			ps.setString(2, userItem.getEmail());
			ps.setString(3, userItem.getImage());
			ps.setInt(4, userItem.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
