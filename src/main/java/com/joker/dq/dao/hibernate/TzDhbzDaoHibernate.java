package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.TzDhbz;
import com.joker.dq.dao.TzDhbzDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("tzDhbzDao")
public class TzDhbzDaoHibernate extends GenericDaoHibernate<TzDhbz, Long> implements TzDhbzDao {

    public TzDhbzDaoHibernate() {
        super(TzDhbz.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "SELECT * FROM tz_dhbz WHERE 1=1";
		if(condition!=null && !condition.isEmpty()){
    		if(condition.containsKey("tzDate")){
    			sql += " AND tz_date='" + condition.get("tzDate") + "'";
    		}
    		if(condition.containsKey("groupPartyId")){
    			sql += " AND group_party_id=" + condition.get("groupPartyId");
    		}
    	}
		return sql;
	}
}
