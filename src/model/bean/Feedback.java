package model.bean;

public class Feedback {
	private int id;
	private String username;
	private String email;
	private String feedback;

	public Feedback() {
	}

	public Feedback(int id, String username, String email, String feedback) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.feedback = feedback;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

}
