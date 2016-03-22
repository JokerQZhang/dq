package com.joker.dq.service.impl;

import com.joker.dq.dao.TzHjmdDao;
import com.joker.dq.model.TzHjmd;
import com.joker.dq.service.TzHjmdManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("tzHjmdManager")
@WebService(serviceName = "TzHjmdService", endpointInterface = "com.joker.dq.service.TzHjmdManager")
public class TzHjmdManagerImpl extends GenericManagerImpl<TzHjmd, Long> implements TzHjmdManager {
    TzHjmdDao tzHjmdDao;

    @Autowired
    public TzHjmdManagerImpl(TzHjmdDao tzHjmdDao) {
        super(tzHjmdDao);
        this.tzHjmdDao = tzHjmdDao;
    }
}