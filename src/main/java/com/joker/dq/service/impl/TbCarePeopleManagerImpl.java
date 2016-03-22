package com.joker.dq.service.impl;

import com.joker.dq.dao.TbCarePeopleDao;
import com.joker.dq.model.TbCarePeople;
import com.joker.dq.service.TbCarePeopleManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

@Service("tbCarePeopleManager")
@WebService(serviceName = "TbCarePeopleService", endpointInterface = "com.joker.dq.service.TbCarePeopleManager")
public class TbCarePeopleManagerImpl extends GenericManagerImpl<TbCarePeople, Long> implements TbCarePeopleManager {
    TbCarePeopleDao tbCarePeopleDao;

    @Autowired
    public TbCarePeopleManagerImpl(TbCarePeopleDao tbCarePeopleDao) {
        super(tbCarePeopleDao);
        this.tbCarePeopleDao = tbCarePeopleDao;
    }

	@Override
	public List getYFTypeByPeopleId(String peopleId) {
		Map condition = new HashMap();
		condition.put("peopleId", peopleId);
		return tbCarePeopleDao.getYFType(condition);
	}
}