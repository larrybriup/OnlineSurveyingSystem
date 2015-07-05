package com.eagle.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.eagle.common.bean.Answer;
import com.eagle.common.bean.Questionnaire;
import com.eagle.dao.QuestionDao;

public class QuestionDaoImpl implements QuestionDao {
	private HibernateTemplate temp;

	public void setTemp(HibernateTemplate temp) {
		this.temp = temp;
	}
	
	public void save(Questionnaire q) throws Exception {
		temp.save(q);
	}

	public void saveOrUpdte(Questionnaire q) throws Exception {
		temp.saveOrUpdate(q);
	}

	public List<Questionnaire> getQuestionnaire() throws Exception {
		List<Questionnaire> list = temp.find("from Questionnaire");
		return list;
	}

	public Questionnaire getQuestionnaireByNum(int num) throws Exception {
		List<Questionnaire> find = temp.find("from Questionnaire q where q.id=?", num);
		return find.get(0);
	}

	public void save(Answer a) throws Exception {
		temp.saveOrUpdate(a);
	}

	public void saveOrUpdte(Answer a) throws Exception {
		temp.saveOrUpdate(a);
	}

	public List<Answer> getAnswer() throws Exception {
		List<Answer> list = temp.find("from Answer");
		return list;
	}

	public List<Answer> getAnswerByNum(int num) throws Exception {
		temp.setMaxResults(num);
		List<Answer> list = temp.find("from Answer");
		temp.clear();
		return list;
	}

	public boolean delete(int id) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		temp.delete(getQuestionnaireByNum(id));
		flag=true;
		return flag;
	}

}
