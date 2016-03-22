package com.joker.dq.service.impl;

import com.joker.dq.dao.EnumerationDao;
import com.joker.dq.model.Enumeration;
import com.joker.dq.service.EnumerationManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("enumerationManager")
@WebService(serviceName = "EnumerationService", endpointInterface = "com.joker.dq.service.EnumerationManager")
public class EnumerationManagerImpl extends GenericManagerImpl<Enumeration, Long> implements EnumerationManager {
    EnumerationDao enumerationDao;

    @Autowired
    public EnumerationManagerImpl(EnumerationDao enumerationDao) {
        super(enumerationDao);
        this.enumerationDao = enumerationDao;
    }

	@Override
	public List getYFTypes() {
		return enumerationDao.getYFTypes(null);
	}
}