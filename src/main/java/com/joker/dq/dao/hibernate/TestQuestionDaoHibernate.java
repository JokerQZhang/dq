package com.joker.dq.dao.hibernate;

import java.util.List;
import java.util.Map;

import com.joker.dq.model.QuestionOption;
import com.joker.dq.model.TestQuestion;
import com.joker.dq.dao.TestQuestionDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

@Repository("testQuestionDao")
public class TestQuestionDaoHibernate extends GenericDaoHibernate<TestQuestion, Long> implements TestQuestionDao {

    public TestQuestionDaoHibernate() {
        super(TestQuestion.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "";
		if(condition!=null && !condition.isEmpty()){
    		
    	}
		return sql;
	}

	@Override
	public List<QuestionOption> getOl(Long questionId) {
		String sql = "select * from question_option where question_id="+questionId;
		SQLQuery q = super.findBySql(sql);
		return q.addEntity(QuestionOption.class).list();
	}

	@Override
	public QuestionOption getQueationOption(Long qoid) {
		String sql = "select * from question_option where question_option_id="+qoid;
		return (QuestionOption)super.findBySql(sql).addEntity(QuestionOption.class).uniqueResult();
	}
}
