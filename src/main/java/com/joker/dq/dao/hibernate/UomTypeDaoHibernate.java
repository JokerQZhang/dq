package com.joker.dq.dao.hibernate;

import com.joker.dq.model.UomType;
import com.joker.dq.dao.UomTypeDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("uomTypeDao")
public class UomTypeDaoHibernate extends GenericDaoHibernate<UomType, Long> implements UomTypeDao {

    public UomTypeDaoHibernate() {
        super(UomType.class);
    }
}
