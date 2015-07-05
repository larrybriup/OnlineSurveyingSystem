package com.eagle.web.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import sun.print.resources.serviceui;

import com.eagle.common.bean.User;
import com.eagle.common.util.MD5;
import com.eagle.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private UserService userService;
	private String name,password,gender,age,phone,email,hoppy,city,
			proverb;
	
	private HttpServletRequest req = ServletActionContext.getRequest();
	private HttpSession session = req.getSession();
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Override
	public String execute() throws Exception {
		User user=new User
				(name, MD5.getMD5Str(password), gender, Integer.parseInt(age), phone, email, hoppy, city, proverb);
		user.setRegisterdate(new Date());
		userService.register(user);
		session.setAttribute("user", user);
		return SUCCESS;
	}
	public String login(){
		try {
			User user = userService.login(name, password);
			session.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	public String logout(){
		try {
			User sUser = (User) session.getAttribute("user");
			if (sUser!=null) {
				userService.logout(sUser.getName(), sUser.getPassword());
				session.removeAttribute("user");
			}else{
				throw new Exception("注销失败，没有此用户，或者您还没有登陆！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", e.getMessage());
			return ERROR;
		}
		return SUCCESS;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
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




}
