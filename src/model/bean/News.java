package model.bean;

import java.sql.Timestamp;

public class News {
	private int id;
	private String title;
	private String preview;
	private String detail;
	private Timestamp created_date;
	private int view;
	private int cat_id;
	private int football_cat_id;
	private int tennis_cat_id;
	private int cat_news_id;
	private String image;
	private String url_video;
	private String author;

	public News() {
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public News(int id, String title, String preview, String detail, Timestamp created_date, int view, int cat_id,
			int football_cat_id, int tennis_cat_id, int cat_news_id, String image, String url_video, String author) {
		super();
		this.id = id;
		this.title = title;
		this.preview = preview;
		this.detail = detail;
		this.created_date = created_date;
		this.view = view;
		this.cat_id = cat_id;
		this.football_cat_id = football_cat_id;
		this.tennis_cat_id = tennis_cat_id;
		this.cat_news_id = cat_news_id;
		this.image = image;
		this.url_video = url_video;
		this.author = author;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Timestamp getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Timestamp created_date) {
		this.created_date = created_date;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public int getFootball_cat_id() {
		return football_cat_id;
	}

	public void setFootball_cat_id(int football_cat_id) {
		this.football_cat_id = football_cat_id;
	}

	public int getTennis_cat_id() {
		return tennis_cat_id;
	}

	public void setTennis_cat_id(int tennis_cat_id) {
		this.tennis_cat_id = tennis_cat_id;
	}

	public int getCat_news_id() {
		return cat_news_id;
	}

	public void setCat_news_id(int cat_news_id) {
		this.cat_news_id = cat_news_id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUrl_video() {
		return url_video;
	}

	public void setUrl_video(String url_video) {
		this.url_video = url_video;
	}

}
