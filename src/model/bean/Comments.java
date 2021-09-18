package model.bean;

import java.sql.Timestamp;

public class Comments {

	private int id;
	private String username;
	private String image;
	private String comment;
	private Timestamp comment_date;
	private int news_id;

	public Comments() {
	}

	public Comments(int id, String username, String image, String comment, Timestamp comment_date, int news_id) {
		this.id = id;
		this.username = username;
		this.image = image;
		this.comment = comment;
		this.comment_date = comment_date;
		this.news_id = news_id;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}

}
