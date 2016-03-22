package com.joker.dq.service.impl;

import com.joker.dq.dao.PartyRelationshipTypeDao;
import com.joker.dq.model.PartyRelationshipType;
import com.joker.dq.service.PartyRelationshipTypeManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("partyRelationshipTypeManager")
@WebService(serviceName = "PartyRelationshipTypeService", endpointInterface = "com.joker.dq.service.PartyRelationshipTypeManager")
public class PartyRelationshipTypeManagerImpl extends GenericManagerImpl<PartyRelationshipType, Long> implements PartyRelationshipTypeManager {
    PartyRelationshipTypeDao partyRelationshipTypeDao;

    @Autowired
    public PartyRelationshipTypeManagerImpl(PartyRelationshipTypeDao partyRelationshipTypeDao) {
        super(partyRelationshipTypeDao);
        this.partyRelationshipTypeDao = partyRelationshipTypeDao;
    }
}