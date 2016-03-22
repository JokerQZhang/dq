package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.PartyRelationship;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface PartyRelationshipManager extends GenericManager<PartyRelationship, Long> {
    
}