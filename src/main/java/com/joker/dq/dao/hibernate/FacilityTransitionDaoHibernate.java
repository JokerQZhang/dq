package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.FacilityTransition;
import com.joker.dq.dao.FacilityTransitionDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("facilityTransitionDao")
public class FacilityTransitionDaoHibernate extends GenericDaoHibernate<FacilityTransition, Long> implements FacilityTransitionDao {

    public FacilityTransitionDaoHibernate() {
        super(FacilityTransition.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "";
		if(condition!=null && !condition.isEmpty()){
    		
    	}
		return sql;
	}
}
