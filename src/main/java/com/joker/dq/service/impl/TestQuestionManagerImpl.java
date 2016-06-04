package com.joker.dq.service.impl;

import com.joker.dq.dao.TestQuestionDao;
import com.joker.dq.model.QuestionOption;
import com.joker.dq.model.TestQuestion;
import com.joker.dq.service.TestQuestionManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.jws.WebService;

@Service("testQuestionManager")
@WebService(serviceName = "TestQuestionService", endpointInterface = "com.joker.dq.service.TestQuestionManager")
public class TestQuestionManagerImpl extends GenericManagerImpl<TestQuestion, Long> implements TestQuestionManager {
    TestQuestionDao testQuestionDao;

    @Autowired
    public TestQuestionManagerImpl(TestQuestionDao testQuestionDao) {
        super(testQuestionDao);
        this.testQuestionDao = testQuestionDao;
    }

	@Override
	public Boolean saveOptions(List<QuestionOption> ol) {
		if(ol!=null && ol.size()>0){
			for(QuestionOption o : ol){
				testQuestionDao.saveObject(o);
			}
		}
		return true;
	}

	@Override
	public List<QuestionOption> getOl(Long questionId) {
		return testQuestionDao.getOl(questionId);
	}

	@Override
	public QuestionOption getQueationOption(Long qoid) {
		return testQuestionDao.getQueationOption(qoid);
	}
}