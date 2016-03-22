package com.joker.dq.service.impl;

import com.joker.dq.dao.DqHuiDao;
import com.joker.dq.model.DqHui;
import com.joker.dq.service.DqHuiManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("dqHuiManager")
@WebService(serviceName = "DqHuiService", endpointInterface = "com.joker.dq.service.DqHuiManager")
public class DqHuiManagerImpl extends GenericManagerImpl<DqHui, Long> implements DqHuiManager {
    DqHuiDao dqHuiDao;

    @Autowired
    public DqHuiManagerImpl(DqHuiDao dqHuiDao) {
        super(dqHuiDao);
        this.dqHuiDao = dqHuiDao;
    }
}