package com.joker.dq.service.impl;

import com.joker.dq.dao.StatusTypeDao;
import com.joker.dq.model.StatusType;
import com.joker.dq.service.StatusTypeManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("statusTypeManager")
@WebService(serviceName = "StatusTypeService", endpointInterface = "com.joker.dq.service.StatusTypeManager")
public class StatusTypeManagerImpl extends GenericManagerImpl<StatusType, Long> implements StatusTypeManager {
    StatusTypeDao statusTypeDao;

    @Autowired
    public StatusTypeManagerImpl(StatusTypeDao statusTypeDao) {
        super(statusTypeDao);
        this.statusTypeDao = statusTypeDao;
    }
}