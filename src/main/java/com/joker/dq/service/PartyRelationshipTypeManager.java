package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.PartyRelationshipType;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface PartyRelationshipTypeManager extends GenericManager<PartyRelationshipType, Long> {
    
}