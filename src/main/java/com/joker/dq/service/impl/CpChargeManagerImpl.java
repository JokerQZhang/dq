package com.joker.dq.service.impl;

import com.joker.dq.dao.CpChargeDao;
import com.joker.dq.model.CpCharge;
import com.joker.dq.service.CpChargeManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

@Service("cpChargeManager")
@WebService(serviceName = "CpChargeService", endpointInterface = "com.joker.dq.service.CpChargeManager")
public class CpChargeManagerImpl extends GenericManagerImpl<CpCharge, Long> implements CpChargeManager {
    CpChargeDao cpChargeDao;

    @Autowired
    public CpChargeManagerImpl(CpChargeDao cpChargeDao) {
        super(cpChargeDao);
        this.cpChargeDao = cpChargeDao;
    }

	@Override
	public List getChargeSumList(Long partyId) {
		Map condition = new HashMap();
		condition.put("partyId", partyId);
		return cpChargeDao.getChargeSumList(condition);
	}
}