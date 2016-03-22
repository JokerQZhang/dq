package com.joker.dq.service.impl;

import com.joker.dq.dao.StatusItemDao;
import com.joker.dq.model.StatusItem;
import com.joker.dq.service.StatusItemManager;
import com.joker.dq.service.impl.GenericManagerImpl;
import com.joker.dq.webapp.action.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import javax.jws.WebService;

@Service("statusItemManager")
@WebService(serviceName = "StatusItemService", endpointInterface = "com.joker.dq.service.StatusItemManager")
public class StatusItemManagerImpl extends GenericManagerImpl<StatusItem, Long> implements StatusItemManager {
    StatusItemDao statusItemDao;

    @Autowired
    public StatusItemManagerImpl(StatusItemDao statusItemDao) {
        super(statusItemDao);
        this.statusItemDao = statusItemDao;
    }

	@Override
	public List searchByTypeId(String typeId, Class clazz, Page page) {
		return statusItemDao.searchByTypeId(typeId, clazz, page);
	}
}