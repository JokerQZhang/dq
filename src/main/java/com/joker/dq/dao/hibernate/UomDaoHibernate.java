package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.Uom;
import com.joker.dq.dao.UomDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;

import org.springframework.stereotype.Repository;

@Repository("uomDao")
public class UomDaoHibernate extends GenericDaoHibernate<Uom, Long> implements UomDao {

    public UomDaoHibernate() {
        super(Uom.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "select * FROM uom where 1=1 ";
		if(condition!=null && !condition.isEmpty()){
			if(condition.containsKey("uomTypeId")){
				sql += " and uom_type_id= " + condition.get("uomTypeId");
			}
		}
		return sql;
	}
}
