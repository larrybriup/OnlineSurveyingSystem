package com.eagle.web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.Answer;
import com.eagle.common.bean.Questionnaire;
import com.eagle.common.bean.User;
import com.eagle.service.QuestionnaireService;
import com.opensymphony.xwork2.ActionSupport;

public class SummitQuestionnaireAction extends ActionSupport {
	private String q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20;
	private String inputId;
	private QuestionnaireService questionService;
	@Override
	public String execute() {
		try {
			String content="";
			if(q1!=null){
				content+=q1+"|";
			}
			if(q2!=null){
				content+=q2+"|";
			}
			if(q3!=null){
				content+=q3+"|";
			}
			if(q4!=null){
				content+=q4+"|";
			}
			if(q5!=null){
				content+=q5+"|";
			}
			if(q6!=null){
				content+=q6+"|";
			}
			if(q7!=null){
				content+=q7+"|";
			}
			if(q8!=null){
				content+=q8+"|";
			}
			if(q9!=null){
				content+=q9+"|";
			}
			if(q10!=null){
				content+=q10+"|";
			}
			if(q11!=null){
				content+=q11+"|";
			}
			if(q12!=null){
				content+=q12+"|";
			}
			if(q13!=null){
				content+=q13+"|";
			}
			if(q14!=null){
				content+=q14+"|";
			}
			if(q15!=null){
				content+=q15+"|";
			}
			if(q16!=null){
				content+=q16+"|";
			}
			if(q17!=null){
				content+=q17+"|";
			}
			if(q18!=null){
				content+=q18+"|";
			}
			if(q19!=null){
				content+=q19+"|";
			}
			if(q20!=null){
				content+=q20;
			}
			HttpSession session = ServletActionContext.getRequest().getSession();
			User user=
					(User) session.getAttribute("user");
			Questionnaire questionnaireByNum = null;
			System.out.println("inputId="+inputId);
			if (inputId!=null) {
				questionnaireByNum= 
						questionService.getQuestionnaireByNum(Integer.parseInt(inputId));
			}
			
			
			Answer answer= new Answer();
			answer.setUser(user);
			answer.setQuestionnaire(questionnaireByNum);
			
			answer.setContent(content);
			questionService.save(answer);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	public void setQuestionService(QuestionnaireService questionService) {
		this.questionService = questionService;
	}


	public String getQ1() {
		return q1;
	}


	public void setQ1(String q1) {
		this.q1 = q1;
	}


	public String getQ2() {
		return q2;
	}


	public void setQ2(String q2) {
		this.q2 = q2;
	}


	public String getQ3() {
		return q3;
	}


	public void setQ3(String q3) {
		this.q3 = q3;
	}


	public String getQ4() {
		return q4;
	}


	public void setQ4(String q4) {
		this.q4 = q4;
	}


	public String getQ5() {
		return q5;
	}


	public void setQ5(String q5) {
		this.q5 = q5;
	}


	public String getQ6() {
		return q6;
	}


	public void setQ6(String q6) {
		this.q6 = q6;
	}


	public String getQ7() {
		return q7;
	}


	public void setQ7(String q7) {
		this.q7 = q7;
	}


	public String getQ8() {
		return q8;
	}


	public void setQ8(String q8) {
		this.q8 = q8;
	}


	public String getQ9() {
		return q9;
	}


	public void setQ9(String q9) {
		this.q9 = q9;
	}


	public String getQ10() {
		return q10;
	}


	public void setQ10(String q10) {
		this.q10 = q10;
	}


	public String getQ11() {
		return q11;
	}


	public void setQ11(String q11) {
		this.q11 = q11;
	}


	public String getQ12() {
		return q12;
	}


	public void setQ12(String q12) {
		this.q12 = q12;
	}


	public String getQ13() {
		return q13;
	}


	public void setQ13(String q13) {
		this.q13 = q13;
	}


	public String getQ14() {
		return q14;
	}


	public void setQ14(String q14) {
		this.q14 = q14;
	}


	public String getQ15() {
		return q15;
	}


	public void setQ15(String q15) {
		this.q15 = q15;
	}


	public String getQ16() {
		return q16;
	}


	public void setQ16(String q16) {
		this.q16 = q16;
	}


	public String getQ17() {
		return q17;
	}


	public void setQ17(String q17) {
		this.q17 = q17;
	}


	public String getQ18() {
		return q18;
	}


	public void setQ18(String q18) {
		this.q18 = q18;
	}


	public String getQ19() {
		return q19;
	}


	public void setQ19(String q19) {
		this.q19 = q19;
	}


	public String getQ20() {
		return q20;
	}


	public void setQ20(String q20) {
		this.q20 = q20;
	}
	public String getInputId() {
		return inputId;
	}
	public void setInputId(String inputId) {
		this.inputId = inputId;
	}
	
}
