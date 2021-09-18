package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Feedback;
import model.bean.Users;
import util.DBConnectionUtil;

public class FeedbackDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public int addFeedback(Feedback feedback) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "INSERT INTO feedback(username,email,feedback)\r\n" + "VALUES(?,?,?)";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, feedback.getUsername());
			ps.setString(2, feedback.getEmail());
			ps.setString(3, feedback.getFeedback());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Feedback> getAllFeedback() {
		ArrayList<Feedback> feedbackList = new ArrayList<Feedback>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `feedback` ORDER BY id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				Feedback feedback = new Feedback(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				feedbackList.add(feedback);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return feedbackList;
	}

	public int countAllFeedbacks() {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM feedback";
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

}
