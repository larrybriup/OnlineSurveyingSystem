package com.eagle.web.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.Questionnaire;
import com.eagle.service.QuestionnaireService;
import com.opensymphony.xwork2.ActionSupport;

public class RmQuestionnaireAction extends ActionSupport {
	private QuestionnaireService questionService;
	private String rmNum;
	@Override
	public String execute(){
		HttpServletRequest req = ServletActionContext.getRequest();
		try {
		System.out.println("rmNUm="+rmNum);
			questionService.delete(Integer.parseInt(rmNum));
			req.setAttribute("msg", "删除成功！");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "删除失败！");
			return ERROR;
		}
		return SUCCESS;
	}
	public void setQuestionService(QuestionnaireService questionService) {
		this.questionService = questionService;
	}
	public String getRmNum() {
		return rmNum;
	}
	public void setRmNum(String rmNum) {
		this.rmNum = rmNum;
	}

}
