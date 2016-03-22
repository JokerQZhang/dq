package com.joker.dq.service.impl;

import com.joker.dq.dao.UomConversionDao;
import com.joker.dq.model.UomConversion;
import com.joker.dq.service.UomConversionManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("uomConversionManager")
@WebService(serviceName = "UomConversionService", endpointInterface = "com.joker.dq.service.UomConversionManager")
public class UomConversionManagerImpl extends GenericManagerImpl<UomConversion, Long> implements UomConversionManager {
    UomConversionDao uomConversionDao;

    @Autowired
    public UomConversionManagerImpl(UomConversionDao uomConversionDao) {
        super(uomConversionDao);
        this.uomConversionDao = uomConversionDao;
    }
}