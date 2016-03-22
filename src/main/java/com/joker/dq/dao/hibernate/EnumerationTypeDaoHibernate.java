package com.joker.dq.dao.hibernate;

import com.joker.dq.model.EnumerationType;
import com.joker.dq.dao.EnumerationTypeDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("enumerationTypeDao")
public class EnumerationTypeDaoHibernate extends GenericDaoHibernate<EnumerationType, Long> implements EnumerationTypeDao {

    public EnumerationTypeDaoHibernate() {
        super(EnumerationType.class);
    }
}
