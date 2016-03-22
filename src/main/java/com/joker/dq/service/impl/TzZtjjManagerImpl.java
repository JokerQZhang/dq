package com.joker.dq.service.impl;

import com.joker.dq.dao.TzZtjjDao;
import com.joker.dq.model.TzZtjj;
import com.joker.dq.service.TzZtjjManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("tzZtjjManager")
@WebService(serviceName = "TzZtjjService", endpointInterface = "com.joker.dq.service.TzZtjjManager")
public class TzZtjjManagerImpl extends GenericManagerImpl<TzZtjj, Long> implements TzZtjjManager {
    TzZtjjDao tzZtjjDao;

    @Autowired
    public TzZtjjManagerImpl(TzZtjjDao tzZtjjDao) {
        super(tzZtjjDao);
        this.tzZtjjDao = tzZtjjDao;
    }
}