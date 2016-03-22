package com.joker.dq.dao;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.SalePlan;
import com.joker.dq.model.SalePlanDtl;

/**
 * An interface that provides a data management interface to the SalePlanDtl table.
 */
public interface SalePlanDtlDao extends GenericDao<SalePlanDtl, Long> {
	public void saveShipmentByDtl(SalePlan salePlan);
}