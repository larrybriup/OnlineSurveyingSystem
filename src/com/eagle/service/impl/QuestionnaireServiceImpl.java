package com.eagle.service.impl;

import java.util.List;

import com.eagle.common.bean.Answer;
import com.eagle.common.bean.Questionnaire;
import com.eagle.dao.QuestionDao;
import com.eagle.service.QuestionnaireService;

public class QuestionnaireServiceImpl implements QuestionnaireService{

	private QuestionDao questionDao;
	
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public void save(Questionnaire q) throws Exception {
		questionDao.save(q);
	}
	public boolean delete(int id) throws Exception {
		boolean flag=questionDao.delete(id);
		return flag;
	}
	public void saveOrUpdte(Questionnaire q) throws Exception {
		questionDao.saveOrUpdte(q);
	}
	public List<Questionnaire> getQuestionnaire() throws Exception {
		List<Questionnaire> list = questionDao.getQuestionnaire();
		return list;
	}
	public Questionnaire getQuestionnaireByNum(int num) throws Exception {
		Questionnaire questionnaireByNum = questionDao.getQuestionnaireByNum(num);
		return questionnaireByNum;
	}


	public void save(Answer q) throws Exception {
			questionDao.save(q);
	}
	public void saveOrUpdte(Answer a) throws Exception {
		questionDao.saveOrUpdte(a);;
	}
	public List<Answer> getAnswer() throws Exception {
		List<Answer> list = questionDao.getAnswer();
		return list;
	}
	
	public List<Answer> getAnswerByNum(int num) throws Exception {
		List<Answer> list=questionDao.getAnswerByNum(num);
		return list;
	}


}
