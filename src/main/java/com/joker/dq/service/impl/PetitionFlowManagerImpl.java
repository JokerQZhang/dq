package com.joker.dq.service.impl;

import com.joker.dq.dao.PetitionFlowDao;
import com.joker.dq.model.PetitionFlow;
import com.joker.dq.service.PetitionFlowManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("petitionFlowManager")
@WebService(serviceName = "PetitionFlowService", endpointInterface = "com.joker.dq.service.PetitionFlowManager")
public class PetitionFlowManagerImpl extends GenericManagerImpl<PetitionFlow, Long> implements PetitionFlowManager {
    PetitionFlowDao petitionFlowDao;

    @Autowired
    public PetitionFlowManagerImpl(PetitionFlowDao petitionFlowDao) {
        super(petitionFlowDao);
        this.petitionFlowDao = petitionFlowDao;
    }
}