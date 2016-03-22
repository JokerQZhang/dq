package com.joker.dq.service.impl;

import com.joker.dq.dao.TzDyzthDao;
import com.joker.dq.model.TzDyzth;
import com.joker.dq.service.TzDyzthManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("tzDyzthManager")
@WebService(serviceName = "TzDyzthService", endpointInterface = "com.joker.dq.service.TzDyzthManager")
public class TzDyzthManagerImpl extends GenericManagerImpl<TzDyzth, Long> implements TzDyzthManager {
    TzDyzthDao tzDyzthDao;

    @Autowired
    public TzDyzthManagerImpl(TzDyzthDao tzDyzthDao) {
        super(tzDyzthDao);
        this.tzDyzthDao = tzDyzthDao;
    }
}