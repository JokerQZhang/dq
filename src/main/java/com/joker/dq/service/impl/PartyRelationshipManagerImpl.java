package com.joker.dq.service.impl;

import com.joker.dq.dao.PartyRelationshipDao;
import com.joker.dq.model.PartyRelationship;
import com.joker.dq.service.PartyRelationshipManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("partyRelationshipManager")
@WebService(serviceName = "PartyRelationshipService", endpointInterface = "com.joker.dq.service.PartyRelationshipManager")
public class PartyRelationshipManagerImpl extends GenericManagerImpl<PartyRelationship, Long> implements PartyRelationshipManager {
    PartyRelationshipDao partyRelationshipDao;

    @Autowired
    public PartyRelationshipManagerImpl(PartyRelationshipDao partyRelationshipDao) {
        super(partyRelationshipDao);
        this.partyRelationshipDao = partyRelationshipDao;
    }
}