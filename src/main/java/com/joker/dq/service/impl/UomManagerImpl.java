package com.joker.dq.service.impl;

import com.joker.dq.dao.UomDao;
import com.joker.dq.model.Uom;
import com.joker.dq.service.UomManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("uomManager")
@WebService(serviceName = "UomService", endpointInterface = "com.joker.dq.service.UomManager")
public class UomManagerImpl extends GenericManagerImpl<Uom, Long> implements UomManager {
    UomDao uomDao;

    @Autowired
    public UomManagerImpl(UomDao uomDao) {
        super(uomDao);
        this.uomDao = uomDao;
    }
}