package com.eagle.common.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;





public class Questionnaire {
	private int id;
	private String questionnaireName;
	private String description;
	private String content;
	private Date createDate;
	private Set<Answer> answers = new HashSet<Answer>();
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQuestionnaireName() {
		return questionnaireName;
	}
	public void setQuestionnaireName(String questionnaireName) {
		this.questionnaireName = questionnaireName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(Set<Answer> answers) {
		this.answers = answers;
	}

}
