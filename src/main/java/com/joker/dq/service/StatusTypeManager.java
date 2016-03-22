package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.StatusType;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface StatusTypeManager extends GenericManager<StatusType, Long> {
    
}