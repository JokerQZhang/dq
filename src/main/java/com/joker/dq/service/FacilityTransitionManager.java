package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.FacilityTransition;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface FacilityTransitionManager extends GenericManager<FacilityTransition, Long> {
    
}