package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.TestPaper;
import com.joker.dq.dao.TestPaperDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("testPaperDao")
public class TestPaperDaoHibernate extends GenericDaoHibernate<TestPaper, Long> implements TestPaperDao {

    public TestPaperDaoHibernate() {
        super(TestPaper.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "";
		if(condition!=null && !condition.isEmpty()){
    		
    	}
		return sql;
	}
}
