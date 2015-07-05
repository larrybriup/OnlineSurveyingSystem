package com.eagle.common.bean;

import java.util.Date;

public class User {
	private int id;
	private String name;
	private String password;
	private String gender;
	private int age;
	private String phone;
	private String email;
	private String hoppy;
	private String city;
	private String proverb;
	private int isonline;
	private Date registerdate;
	private Date latestdate;
	private Answer answer;
	
	

	public User() {}

	


	public User(String name, String password, String gender, int age,
			String phone, String email) {
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.email = email;
	}

	public User(String name, String password, String gender, int age,
			String phone, String email, String hoppy, String city,
			String proverb) {
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.email = email;
		this.hoppy = hoppy;
		this.city = city;
		this.proverb = proverb;
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




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	public int getAge() {
		return age;
	}




	public void setAge(int age) {
		this.age = age;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public int getIsonline() {
		return isonline;
	}




	public void setIsonline(int isonline) {
		this.isonline = isonline;
	}




	public Date getRegisterdate() {
		return registerdate;
	}




	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}




	public Date getLatestdate() {
		return latestdate;
	}




	public void setLatestdate(Date latestdate) {
		this.latestdate = latestdate;
	}




	public String getHoppy() {
		return hoppy;
	}




	public void setHoppy(String hoppy) {
		this.hoppy = hoppy;
	}




	public String getCity() {
		return city;
	}




	public void setCity(String city) {
		this.city = city;
	}




	public String getProverb() {
		return proverb;
	}




	public void setProverb(String proverb) {
		this.proverb = proverb;
	}




	public Answer getAnswer() {
		return answer;
	}




	public void setAnswer(Answer answer) {
		this.answer = answer;
	}







}
