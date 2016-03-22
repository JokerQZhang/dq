package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.ApprovalProj;
import com.joker.dq.dao.ApprovalProjDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("approvalProjDao")
public class ApprovalProjDaoHibernate extends GenericDaoHibernate<ApprovalProj, Long> implements ApprovalProjDao {

    public ApprovalProjDaoHibernate() {
        super(ApprovalProj.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = "SELECT * FROM approval_proj WHERE 1=1";
		if(condition!=null && !condition.isEmpty()){
    		if(condition.containsKey("partyId")){
    			sql += " AND party_id=" + condition.get("partyId");
    		}
    	}
		return sql;
	}
}
