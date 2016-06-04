package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.PetitionFlow;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface PetitionFlowManager extends GenericManager<PetitionFlow, Long> {
    public PetitionFlow getNowPetitionFlow(Long petitionId);
    public List getAllPetitionFlow(Long petitionId);
}