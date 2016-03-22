package com.joker.dq.dao.hibernate;

import com.joker.dq.model.StatusType;
import com.joker.dq.dao.StatusTypeDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("statusTypeDao")
public class StatusTypeDaoHibernate extends GenericDaoHibernate<StatusType, Long> implements StatusTypeDao {

    public StatusTypeDaoHibernate() {
        super(StatusType.class);
    }
}
