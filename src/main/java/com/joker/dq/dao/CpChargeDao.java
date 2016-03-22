package com.joker.dq.dao;

import java.util.List;
import java.util.Map;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.CpCharge;

/**
 * An interface that provides a data management interface to the CpCharge table.
 */
public interface CpChargeDao extends GenericDao<CpCharge, Long> {
	public List getChargeSumList(Map condition);
}