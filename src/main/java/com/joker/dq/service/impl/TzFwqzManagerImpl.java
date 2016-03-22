package com.joker.dq.service.impl;

import com.joker.dq.dao.TzFwqzDao;
import com.joker.dq.model.TzFwqz;
import com.joker.dq.service.TzFwqzManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("tzFwqzManager")
@WebService(serviceName = "TzFwqzService", endpointInterface = "com.joker.dq.service.TzFwqzManager")
public class TzFwqzManagerImpl extends GenericManagerImpl<TzFwqz, Long> implements TzFwqzManager {
    TzFwqzDao tzFwqzDao;

    @Autowired
    public TzFwqzManagerImpl(TzFwqzDao tzFwqzDao) {
        super(tzFwqzDao);
        this.tzFwqzDao = tzFwqzDao;
    }
}