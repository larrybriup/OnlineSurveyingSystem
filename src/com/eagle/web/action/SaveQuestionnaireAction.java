package com.eagle.web.action;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.Questionnaire;
import com.eagle.service.QuestionnaireService;
import com.opensymphony.xwork2.ActionSupport;

public class SaveQuestionnaireAction extends ActionSupport {
	private QuestionnaireService questionService;
	private String questionnaireName,content,description;
	@Override
	public String execute() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();
		try {
			Questionnaire question= new Questionnaire();
			question.setQuestionnaireName(questionnaireName.trim());
			question.setContent(content.trim());
			question.setDescription(description.trim());
			
			question.setCreateDate(new Date());
			questionService.save(question);
			
			req.setAttribute("msg", "保存成功!");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "保存失败,请从新设计!");
			return ERROR;
		}
		return SUCCESS;
	}
	
	public void setQuestionService(QuestionnaireService questionService) {
		this.questionService = questionService;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getQuestionnaireName() {
		return questionnaireName;
	}

	public void setQuestionnaireName(String questionnaireName) {
		this.questionnaireName = questionnaireName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}



}
