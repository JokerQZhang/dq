package com.joker.dq.service.impl;

import com.joker.dq.dao.StatusValidChangeDao;
import com.joker.dq.model.StatusValidChange;
import com.joker.dq.service.StatusValidChangeManager;
import com.joker.dq.service.impl.GenericManagerImpl;
import com.joker.dq.webapp.action.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.jws.WebService;

@Service("statusValidChangeManager")
@WebService(serviceName = "StatusValidChangeService", endpointInterface = "com.joker.dq.service.StatusValidChangeManager")
public class StatusValidChangeManagerImpl extends GenericManagerImpl<StatusValidChange, Long> implements StatusValidChangeManager {
    StatusValidChangeDao statusValidChangeDao;

    @Autowired
    public StatusValidChangeManagerImpl(StatusValidChangeDao statusValidChangeDao) {
        super(statusValidChangeDao);
        this.statusValidChangeDao = statusValidChangeDao;
    }

	@Override
	public List searchByTypeId(String typeId, Class clazz, Page page) {
		return statusValidChangeDao.searchByTypeId(typeId, clazz, page);
	}
}