package com.joker.dq.dao.hibernate;

import java.util.Map;

import com.joker.dq.model.Facility;
import com.joker.dq.model.Product;
import com.joker.dq.model.SalePlan;
import com.joker.dq.model.SalePlanDtl;
import com.joker.dq.dao.SalePlanDtlDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

@Repository("salePlanDtlDao")
public class SalePlanDtlDaoHibernate extends GenericDaoHibernate<SalePlanDtl, Long> implements SalePlanDtlDao {

    public SalePlanDtlDaoHibernate() {
        super(SalePlanDtl.class);
    }
    
    @Override
    public String makeSqlForCondition(Map condition){
		String sql = " SELECT {a.*},{b.*},{c.*}         "
					+" FROM sale_plan_dtl a             "
					+" INNER JOIN facility b            "
					+" ON a.facility_id_to=b.facility_id"
					+" INNER JOIN product c             "
					+" ON a.product_id=c.product_id     "
					+" WHERE 1=1";
		if(condition!=null && !condition.isEmpty()){
    		if(condition.containsKey("salePlanId")){
    			sql += " AND a.sale_plan_id=" + condition.get("salePlanId");
    		}
    	}
		return sql;
	}
    
	@Override
	public SQLQuery setQueryEntitys(SQLQuery sqlQuery) {
		return sqlQuery.addEntity("a", SalePlanDtl.class).addEntity("b", Facility.class).addEntity("c", Product.class);
	}

	@Override
	public void saveShipmentByDtl(SalePlan salePlan) {
		String sql = " INSERT INTO shipment("
					+" sale_plan_id         "
					+" ,facility_id_from    "
					+" ,facility_id_to      "
					+" ,product_id          "
					+" ,num                 "
					+" ,uom_id              "
					+" ,created_time        "
					+" ,created_by_user     "
					+" )                    "
					+" SELECT               "
					+" sale_plan_id         "
					+" ,facility_id_from    "
					+" ,facility_id_to      "
					+" ,product_id          "
					+" ,num                 "
					+" ,uom_id              "
					+" ,created_time        "
					+" ,created_by_user     "
					+" FROM sale_plan_dtl   "
					+" WHERE sale_plan_id=" + salePlan.getSalePlanId();
		super.executeSql(sql);
	}
}
