package com.joker.dq.service.impl;

import com.joker.dq.dao.TzDhbzDao;
import com.joker.dq.model.TzDhbz;
import com.joker.dq.service.TzDhbzManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("tzDhbzManager")
@WebService(serviceName = "TzDhbzService", endpointInterface = "com.joker.dq.service.TzDhbzManager")
public class TzDhbzManagerImpl extends GenericManagerImpl<TzDhbz, Long> implements TzDhbzManager {
    TzDhbzDao tzDhbzDao;

    @Autowired
    public TzDhbzManagerImpl(TzDhbzDao tzDhbzDao) {
        super(tzDhbzDao);
        this.tzDhbzDao = tzDhbzDao;
    }
}