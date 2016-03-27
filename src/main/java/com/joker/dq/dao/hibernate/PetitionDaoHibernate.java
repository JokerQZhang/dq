package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.Petition;
import com.joker.dq.dao.PetitionDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("petitionDao")
public class PetitionDaoHibernate extends GenericDaoHibernate<Petition, Long> implements PetitionDao {

    public PetitionDaoHibernate() {
        super(Petition.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "";
		if(condition!=null && !condition.isEmpty()){
    		
    	}
		return sql;
	}
}
