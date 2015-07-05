package com.eagle.web.action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.Questionnaire;
import com.eagle.service.QuestionnaireService;
import com.opensymphony.xwork2.ActionSupport;

public class CreateNewFileAction extends ActionSupport {
	private QuestionnaireService questionService;
	private String id;
	private String name;

	@Override
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		if (name!=null&&name.indexOf(",")!=-1) {
			String[] strings = name.split("[\\,]");
			name=strings[0];
		}
		try {
			if (id==null) {
				throw new Exception("没有生成文件！");
			}
			Questionnaire questionnaire = 
					questionService.getQuestionnaireByNum(Integer.parseInt(id));
			
			String path=ServletActionContext.
					getServletContext().getRealPath("/")+name+".jsp";
			
			File destFile=new File(path);
			
			if(destFile.exists())throw new Exception("文件名已经存在，不能覆盖,请重新输入文件名!");
			PrintWriter pw= new PrintWriter(destFile);
			
			String head="<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>"+
					"<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>"+
					"<html xmlns='http://www.w3.org/1999/xhtml'><head>"+ 
					"<script type='text/javascript' src='js/questionnaire.js'></script>"+
					"<title>"+name+".jsp</title></head>"+
					"<body background='images/back.jpg' style='background-attachment: fixed;'><center>";
			
			String tail="</center><span id='idSpan' style='display:none;'>"+id+"</span></body></html>";
			
			pw.println(head);
			pw.println(questionnaire.getContent());
			pw.println(tail);
			
			pw.flush();
			pw.close();
			String page=name==null?"questionnaire1":name+".jsp";
			response.sendRedirect(page);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return ERROR;
		}
		
		request.setAttribute("msg", "已经成功生成页面!");
		return SUCCESS;
	}

	public void setQuestionService(QuestionnaireService questionService) {
		this.questionService = questionService;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



}
