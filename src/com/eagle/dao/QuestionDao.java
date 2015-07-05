package com.eagle.dao;

import java.util.List;

import com.eagle.common.bean.Answer;
import com.eagle.common.bean.Questionnaire;

public interface QuestionDao {
	//保存问卷
	void save(Questionnaire q) throws Exception;
	// 删除问卷
	boolean delete(int id) throws Exception;
	//保存或者更新问卷
	void saveOrUpdte(Questionnaire q) throws Exception;
	//获取问卷
	List<Questionnaire> getQuestionnaire() throws Exception;
	//获取第num条数据
	Questionnaire getQuestionnaireByNum(int num) throws Exception;
	
	//保存答案
	void save(Answer a) throws Exception;
	//保存或者更新答案
	void saveOrUpdte(Answer a) throws Exception;
	//获取全部答案
	List<Answer> getAnswer() throws Exception;
	//获取前num条数据
	List<Answer> getAnswerByNum(int num) throws Exception;
}
