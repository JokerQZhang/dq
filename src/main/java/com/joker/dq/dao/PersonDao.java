package com.joker.dq.dao;

import java.util.List;
import java.util.Map;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.Person;
import com.joker.dq.webapp.action.Page;

/**
 * An interface that provides a data management interface to the Person table.
 */
public interface PersonDao extends GenericDao<Person, Long> {
	public List searchByGroupId(String query, Class claaz, Page page, String belongGroupId);
	public List searchAllByGroupId(Class claaz, Page page, String belongGroupId);
	public List getDangPerson(Map condition);
	public List findCpDtl(Map condition);
	public List findCpPositive(Map condition);
	public boolean approvalDangPerson(String partyId, String totalNum, String approvalNum, String approvalResult, String resultStatus);
	public List getPersonRoles(Map condition);
}