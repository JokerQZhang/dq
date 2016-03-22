package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.SalePlanDtl;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface SalePlanDtlManager extends GenericManager<SalePlanDtl, Long> {
    
}