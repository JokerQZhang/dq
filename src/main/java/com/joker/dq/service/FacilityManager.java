package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.Facility;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface FacilityManager extends GenericManager<Facility, Long> {
    public List getFacilityByUserId(String userId);
}