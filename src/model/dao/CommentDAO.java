package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Comments;
import util.DBConnectionUtil;

public class CommentDAO {
	private Connection conn;
	private ResultSet rs;
	private Statement st;
	private PreparedStatement ps;

	public ArrayList<Comments> getAllCommentByNews_id(int id) {
		ArrayList<Comments> cmtList = new ArrayList<Comments>();
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT * FROM `comments` WHERE news_id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Comments comment = new Comments(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), id);
				cmtList.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmtList;
	}

	public int addComment(Comments comment) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String query = "INSERT INTO comments(username,image,comment,news_id)\r\n" + "VALUES(?,?,?,?)";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, comment.getUsername());
			ps.setString(2, comment.getImage());
			ps.setString(3, comment.getComment());
			ps.setInt(4, comment.getNews_id());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int countAllCommentByNews_id(int news_id) {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM comments WHERE news_id = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, news_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	public ArrayList<Comments> getAllCommentPagingByNews_id(int index, int pageSize, int news_id) {
		ArrayList<Comments> cmtList = new ArrayList<Comments>();
		conn = DBConnectionUtil.getConnection();
		String query = "WITH x AS (SELECT *,ROW_NUMBER() over (ORDER BY id DESC) AS intRow FROM `comments` WHERE news_id = ?) SELECT * FROM x WHERE intRow BETWEEN ? * 4 - 3 and ? * 4";
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, news_id);
			ps.setInt(2, index);
			ps.setInt(3, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				Comments cmt = new Comments(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getTimestamp(5), news_id);
				cmtList.add(cmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cmtList;
	}

	public int countAllComments() {
		conn = DBConnectionUtil.getConnection();
		String query = "SELECT COUNT(*) FROM comments";
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
