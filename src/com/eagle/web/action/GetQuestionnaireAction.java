package com.eagle.web.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.eagle.common.bean.Questionnaire;
import com.eagle.service.QuestionnaireService;
import com.opensymphony.xwork2.ActionSupport;

public class GetQuestionnaireAction extends ActionSupport {
	private QuestionnaireService questionService;
	private String condition,selectNum,rmNum;
	@Override
	public String execute() throws Exception {
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		String head="ID&nbsp;&nbsp;&nbsp;name&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;create time&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;annotation</br>";
		int count=0;
	if(condition!=null){
		List<Questionnaire> questionnaireList = questionService.getQuestionnaire();
		
		
		if("id".equals(condition)){
			out.println("<select name='selectNum' id='selectNum' onchange='query(this)'><option value='-1'>请选择</option>");
			for(Questionnaire q:questionnaireList){
				out.println("<option value='"+q.getId()+"'>"+q.getId()+"</option>");
			}
			out.println("</select>");
		}
		if("title".equals(condition)){
			out.println("<select name='selectNum' id='selectNum' onchange='query(this)'><option value='-1'>请选择</option>");
			for(Questionnaire q:questionnaireList){
				out.println("<option value='"+q.getId()+"'>"+q.getQuestionnaireName()+"</option>");
			}
			out.println("</select>");
		}
		if("all".equals(condition)){
			out.println("<ol>");
			for(Questionnaire q:questionnaireList){
				int year=q.getCreateDate().getYear()+1900;
				int m=q.getCreateDate().getMonth();
				int d=q.getCreateDate().getDate();
				int h=q.getCreateDate().getHours();
				int mi=q.getCreateDate().getMinutes();
				int s=q.getCreateDate().getSeconds();
				
				String desc=(q.getDescription()==null?"---":q.getDescription());
				out.println(count==0?head:"");
				count++;
				
				out.println("<li><a href='createNewFile?id="+q.getId()
						+"' title='点击生成页面' onclick='create(this)'>"
						+q.getId()+"&nbsp;&nbsp;&nbsp;"+q.getQuestionnaireName()+"&nbsp;&nbsp;&nbsp;"+
						year+"年"+m+"月"+d+"日 "+h+":"+mi+":"+s+
						"&nbsp;&nbsp;&nbsp;"+desc+"</a>&nbsp;&nbsp;&nbsp;<font color='green' class='rm' onclick='rm("+q.getId()+")' style='cursor:pointer;'>删除</font></li>");
			}
			out.println("</ol>");
		}
	}else{
		int parseIntNum = Integer.parseInt(selectNum);
		Questionnaire q = questionService.getQuestionnaireByNum(parseIntNum);
		String desc=(q.getDescription()==null?"---":q.getDescription());
		out.println("<ol>");
		out.println(count==0?head:"");
		count++;
			out.println("<li><a href='createNewFile?id="+q.getId()
					+"' title='点击生成页面' onclick='create(this)'>"
					+q.getId()+"&nbsp;&nbsp;&nbsp;"+q.getQuestionnaireName()+"&nbsp;&nbsp;&nbsp;"+q.getCreateDate()+ 
					"&nbsp;&nbsp;&nbsp;"+desc+"</a>&nbsp;&nbsp;&nbsp;<font color='green' class='rm' onclick='rm("+q.getId()+")'>删除</font></li>");
		out.println("</ol>");
	}
		out.flush();
		out.close();
		return null;
	}
	public void setQuestionService(QuestionnaireService questionService) {
		this.questionService = questionService;
	}
	public String getSelectNum() {
		return selectNum;
	}
	public void setSelectNum(String selectNum) {
		this.selectNum = selectNum;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getRmNum() {
		return rmNum;
	}
	public void setRmNum(String rmNum) {
		this.rmNum = rmNum;
	}

}
