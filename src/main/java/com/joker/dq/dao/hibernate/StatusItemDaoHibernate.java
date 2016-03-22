package com.joker.dq.dao.hibernate;

import java.util.List;

import com.joker.dq.model.StatusItem;
import com.joker.dq.webapp.action.Page;
import com.joker.dq.dao.StatusItemDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

@Repository("statusItemDao")
public class StatusItemDaoHibernate extends GenericDaoHibernate<StatusItem, Long> implements StatusItemDao {

    public StatusItemDaoHibernate() {
        super(StatusItem.class);
    }

	@Override
	public List searchByTypeId(String typeId, Class clazz, Page page) {
		String sql = " SELECT  {a.*} "
					+" FROM status_item a                  "
					+" INNER JOIN status_type b            "
					+" ON a.status_type_id=b.status_type_id"
					+" WHERE b.status_type_id=" + typeId;
		SQLQuery query = super.findBySql(sql, clazz, page);
		return query.list();
	}
}
