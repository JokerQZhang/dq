package com.joker.dq.service.impl;

import com.joker.dq.dao.SalePlanDtlDao;
import com.joker.dq.model.SalePlanDtl;
import com.joker.dq.service.SalePlanDtlManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("salePlanDtlManager")
@WebService(serviceName = "SalePlanDtlService", endpointInterface = "com.joker.dq.service.SalePlanDtlManager")
public class SalePlanDtlManagerImpl extends GenericManagerImpl<SalePlanDtl, Long> implements SalePlanDtlManager {
    SalePlanDtlDao salePlanDtlDao;

    @Autowired
    public SalePlanDtlManagerImpl(SalePlanDtlDao salePlanDtlDao) {
        super(salePlanDtlDao);
        this.salePlanDtlDao = salePlanDtlDao;
    }
}