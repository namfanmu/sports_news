package model.bean;

public class Users {
	private int id;
	private String username;
	private String password;
	private String email;
	private String image;
	private String role;

	public Users() {
	}

	public Users(int id, String username, String password, String email, String image, String role) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.image = image;
		this.role = role;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
