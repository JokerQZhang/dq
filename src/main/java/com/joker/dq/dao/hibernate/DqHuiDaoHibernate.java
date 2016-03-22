package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.DqHui;
import com.joker.dq.dao.DqHuiDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("dqHuiDao")
public class DqHuiDaoHibernate extends GenericDaoHibernate<DqHui, Long> implements DqHuiDao {

    public DqHuiDaoHibernate() {
        super(DqHui.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "";
		if(condition!=null && !condition.isEmpty()){
    		
    	}
		return sql;
	}
}
