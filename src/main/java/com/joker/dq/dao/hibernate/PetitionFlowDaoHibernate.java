package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.PetitionFlow;
import com.joker.dq.dao.PetitionFlowDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("petitionFlowDao")
public class PetitionFlowDaoHibernate extends GenericDaoHibernate<PetitionFlow, Long> implements PetitionFlowDao {

    public PetitionFlowDaoHibernate() {
        super(PetitionFlow.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "";
		if(condition!=null && !condition.isEmpty()){
    		
    	}
		return sql;
	}
}
