package model.bean;

public class TennisCats {
	private int id;
	private String name;
	private int cats_id;

	public TennisCats() {
	}

	public TennisCats(int id, String name, int cats_id) {
		this.id = id;
		this.name = name;
		this.cats_id = cats_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCats_id() {
		return cats_id;
	}

	public void setCats_id(int cats_id) {
		this.cats_id = cats_id;
	}

}
