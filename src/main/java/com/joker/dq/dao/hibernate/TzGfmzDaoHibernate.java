package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.TzGfmz;
import com.joker.dq.dao.TzGfmzDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("tzGfmzDao")
public class TzGfmzDaoHibernate extends GenericDaoHibernate<TzGfmz, Long> implements TzGfmzDao {

    public TzGfmzDaoHibernate() {
        super(TzGfmz.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "SELECT * FROM tz_gfmz WHERE 1=1";
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
