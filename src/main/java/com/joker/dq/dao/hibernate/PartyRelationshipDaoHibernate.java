package com.joker.dq.dao.hibernate;

import com.joker.dq.model.PartyRelationship;
import com.joker.dq.dao.PartyRelationshipDao;
import com.joker.dq.dao.hibernate.GenericDaoHibernate;
import org.springframework.stereotype.Repository;

@Repository("partyRelationshipDao")
public class PartyRelationshipDaoHibernate extends GenericDaoHibernate<PartyRelationship, Long> implements PartyRelationshipDao {

    public PartyRelationshipDaoHibernate() {
        super(PartyRelationship.class);
    }
}
