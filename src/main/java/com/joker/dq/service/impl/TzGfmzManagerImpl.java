package com.joker.dq.service.impl;

import com.joker.dq.dao.TzGfmzDao;
import com.joker.dq.model.TzGfmz;
import com.joker.dq.service.TzGfmzManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("tzGfmzManager")
@WebService(serviceName = "TzGfmzService", endpointInterface = "com.joker.dq.service.TzGfmzManager")
public class TzGfmzManagerImpl extends GenericManagerImpl<TzGfmz, Long> implements TzGfmzManager {
    TzGfmzDao tzGfmzDao;

    @Autowired
    public TzGfmzManagerImpl(TzGfmzDao tzGfmzDao) {
        super(tzGfmzDao);
        this.tzGfmzDao = tzGfmzDao;
    }
}