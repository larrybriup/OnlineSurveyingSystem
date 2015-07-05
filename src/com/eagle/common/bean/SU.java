package com.eagle.common.bean;

public class SU {
	private long id;
	private String name;
	private String password;
	private String phone;

	public SU() {}

	public SU(String name, String password) {
		this.name = name;
		this.password = password;
	}

	public SU(String name, String password, String phone) {
		this.name = name;
		this.password = password;
		this.phone = phone;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
