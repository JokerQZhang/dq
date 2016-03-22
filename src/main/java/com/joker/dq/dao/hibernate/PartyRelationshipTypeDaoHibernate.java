package com.joker.dq.dao.hibernate;

import com.joker.dq.model.PartyRelationshipType;
import com.joker.dq.dao.PartyRelationshipTypeDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("partyRelationshipTypeDao")
public class PartyRelationshipTypeDaoHibernate extends GenericDaoHibernate<PartyRelationshipType, Long> implements PartyRelationshipTypeDao {

    public PartyRelationshipTypeDaoHibernate() {
        super(PartyRelationshipType.class);
    }
}
