package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.Answerer;
import com.joker.dq.dao.AnswererDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("answererDao")
public class AnswererDaoHibernate extends GenericDaoHibernate<Answerer, Long> implements AnswererDao {

    public AnswererDaoHibernate() {
        super(Answerer.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "";
		if(condition!=null && !condition.isEmpty()){
    		
    	}
		return sql;
	}
}
