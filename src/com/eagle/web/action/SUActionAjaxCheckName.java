package com.eagle.web.action;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.SU;
import com.eagle.common.util.Util;
import com.eagle.service.SUService;
import com.opensymphony.xwork2.ActionSupport;

public class SUActionAjaxCheckName extends ActionSupport {
	private SUService suService;
	
	@Override
	public String execute() throws Exception {
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
			SU findSU = suService.findSU();
			if (findSU!=null) {
				out.println("<font color='red'>您已经注册过！</font>"
						+ "<a href='login.jsp'><font color='green'>点击登陆>></font></a>");
			}else{
				out.println("<font color='green'>尚未注册，请填写用户名！</font>");
			}
			out.flush();
			out.close();
		return null;
	}
	public void setSuService(SUService suService) {
		this.suService = suService;
	}




}
