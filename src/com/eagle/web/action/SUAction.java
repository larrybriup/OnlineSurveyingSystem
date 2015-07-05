package com.eagle.web.action;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.SU;
import com.eagle.common.util.MD5;
import com.eagle.common.util.Util;
import com.eagle.service.SUService;
import com.opensymphony.xwork2.ActionSupport;

public class SUAction extends ActionSupport {
	private String name,password,phone,oldPassword,newPassword,autoCode,autoLogin;
	private SUService suService;
	
	private HttpServletRequest request = ServletActionContext.getRequest();
	private String code = 
						(String) request.getSession().getAttribute("authCode");
	
	@Override
	public String execute() throws Exception {
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		try {
			if(!code.equals(autoCode))
				throw new Exception("验证码输入不正确!");
			SU su = new SU(name, MD5.getInstance().getMD5ofStr(password), phone);
			suService.register(su);
			request.getSession().setAttribute("su", su);
			
			request.setAttribute("msg","注册成功！");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "注册失败！"+e.getMessage());
			return ERROR;
		}
		return SUCCESS;
	}
	public String login() throws Exception{
		try {
			if(!code.equals(autoCode))
				throw new Exception("验证码输入不正确!");
			SU loginSU = suService.login(name, password);
			request.getSession().setAttribute("su", loginSU);
			if("true".equals(autoLogin)){
			HttpServletResponse resp = ServletActionContext.getResponse();
				Cookie c1= new Cookie("name", name);
				Cookie c2= new Cookie("password", password);
				c1.setMaxAge(60 * 60 * 24 * 365);
				c2.setMaxAge(60 * 60 * 24 * 365);
				resp.addCookie(c1);
				resp.addCookie(c2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return ERROR;
		}
		
		return SUCCESS;
		
	}
	public String modifySU() throws Exception{
		SU findSU=null;
		try {
			 findSU = suService.findSU();
			if(findSU==null)
				throw new Exception("没有此用户,请检查用户名是否正确");
			if(!findSU.getPassword().equals(MD5.getInstance().getMD5ofStr(oldPassword)))
				throw new Exception("旧密码输入有误!");
			if(!code.equals(autoCode))
				throw new Exception("验证码输入不正确!");
			
			findSU.setName(name);
			findSU.setPassword(MD5.getInstance().getMD5ofStr(newPassword));
			findSU.setPhone(phone);
			
			suService.saveOrUpdateSU(findSU);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("su", findSU);
			return ERROR;
		}
		
		return SUCCESS;
	}
	public String findPassword() throws Exception{
		SU findSU=null;
		try {
			findSU = suService.findSU();
			if(findSU==null)throw new Exception("没有此用户!");
			if(!findSU.getName().equals(name))throw new Exception("用户名不匹配!");
			if(!findSU.getPhone().equals(phone))throw new Exception("手机号不匹配!");
			String passwd=Util.getRandomPasswd();
			findSU.setPassword(MD5.getInstance().getMD5ofStr(passwd));
			suService.saveOrUpdateSU(findSU);
			request.setAttribute("msg", "您的密码是:"+passwd+"，请牢记！");
			request.setAttribute("su", findSU);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return ERROR;
		}
		
		return SUCCESS;
	}
	public String logout(){
		request.getSession().removeAttribute("su");
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setSuService(SUService suService) {
		this.suService = suService;
	}
	public String getAutoCode() {
		return autoCode;
	}
	public void setAutoCode(String autoCode) {
		this.autoCode = autoCode;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(String autoLogin) {
		this.autoLogin = autoLogin;
	}




}
