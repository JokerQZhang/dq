package com.joker.dq.service.impl;

import com.joker.dq.dao.FacilityTransitionDao;
import com.joker.dq.model.FacilityTransition;
import com.joker.dq.service.FacilityTransitionManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("facilityTransitionManager")
@WebService(serviceName = "FacilityTransitionService", endpointInterface = "com.joker.dq.service.FacilityTransitionManager")
public class FacilityTransitionManagerImpl extends GenericManagerImpl<FacilityTransition, Long> implements FacilityTransitionManager {
    FacilityTransitionDao facilityTransitionDao;

    @Autowired
    public FacilityTransitionManagerImpl(FacilityTransitionDao facilityTransitionDao) {
        super(facilityTransitionDao);
        this.facilityTransitionDao = facilityTransitionDao;
    }
}