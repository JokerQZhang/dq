package com.joker.dq.service.impl;

import com.joker.dq.dao.PetitionDao;
import com.joker.dq.model.Petition;
import com.joker.dq.service.PetitionManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("petitionManager")
@WebService(serviceName = "PetitionService", endpointInterface = "com.joker.dq.service.PetitionManager")
public class PetitionManagerImpl extends GenericManagerImpl<Petition, Long> implements PetitionManager {
    PetitionDao petitionDao;

    @Autowired
    public PetitionManagerImpl(PetitionDao petitionDao) {
        super(petitionDao);
        this.petitionDao = petitionDao;
    }
}