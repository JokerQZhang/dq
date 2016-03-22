package com.joker.dq.dao.hibernate;

import com.joker.dq.model.RoleType;
import com.joker.dq.dao.RoleTypeDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("roleTypeDao")
public class RoleTypeDaoHibernate extends GenericDaoHibernate<RoleType, Long> implements RoleTypeDao {

    public RoleTypeDaoHibernate() {
        super(RoleType.class);
    }
}
