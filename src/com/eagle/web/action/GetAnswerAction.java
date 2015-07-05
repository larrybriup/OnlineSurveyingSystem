package com.eagle.web.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.Answer;
import com.eagle.service.QuestionnaireService;
import com.opensymphony.xwork2.ActionSupport;

public class GetAnswerAction extends ActionSupport {
	private QuestionnaireService questionService;
	private String questionNum;
	private String customerList;
	
	@Override
	public String execute() {
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=null;
		try {
			
			out = resp.getWriter();
			List<Answer> list=null;
			list = questionService.getAnswer();
			if(customerList!=null&&customerList!=""){
				 list = questionService.getAnswerByNum(Integer.parseInt(customerList));
			}
			
			String str="";
				for(Answer answer:list){
					if(customerList!=null&&customerList!=""){
						str += answer.getUser().getName()+"|"+answer.getContent()+"^";
					}
					if(questionNum!=null&&questionNum!=""){
						String[] split = (answer.getUser().getName()+"|"+answer.getContent()).split("[|]");
						str+=split[Integer.parseInt(questionNum)]+"|";
					}
				}
				out.println(str);
				out.flush();
				out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("<font color='red'>没有问题 </font>"+e.getMessage());
			out.flush();
			out.close();
			
		}
		return null;
	}


	public void setQuestionService(QuestionnaireService questionService) {
		this.questionService = questionService;
	}


	public String getQuestionNum() {
		return questionNum;
	}


	public void setQuestionNum(String questionNum) {
		this.questionNum = questionNum;
	}


	public String getCustomerList() {
		return customerList;
	}


	public void setCustomerList(String customerList) {
		this.customerList = customerList;
	}


	
}
