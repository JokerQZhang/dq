package com.joker.dq.dao;

import java.util.List;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.Facility;

/**
 * An interface that provides a data management interface to the Facility table.
 */
public interface FacilityDao extends GenericDao<Facility, Long> {
	public List getFacilityByUserId(String userId);
	public List getFacilityByPartyGroupId(String partyId);
}