package com.joker.dq.service.impl;

import com.joker.dq.dao.UomTypeDao;
import com.joker.dq.model.UomType;
import com.joker.dq.service.UomTypeManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("uomTypeManager")
@WebService(serviceName = "UomTypeService", endpointInterface = "com.joker.dq.service.UomTypeManager")
public class UomTypeManagerImpl extends GenericManagerImpl<UomType, Long> implements UomTypeManager {
    UomTypeDao uomTypeDao;

    @Autowired
    public UomTypeManagerImpl(UomTypeDao uomTypeDao) {
        super(uomTypeDao);
        this.uomTypeDao = uomTypeDao;
    }
}