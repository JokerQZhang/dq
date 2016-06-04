package com.joker.dq.dao;

import java.util.List;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.QuestionOption;
import com.joker.dq.model.TestQuestion;

/**
 * An interface that provides a data management interface to the TestQuestion table.
 */
public interface TestQuestionDao extends GenericDao<TestQuestion, Long> {
	public List<QuestionOption> getOl(Long questionId);
	public QuestionOption getQueationOption(Long qoid);
}