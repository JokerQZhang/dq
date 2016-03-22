package com.joker.dq.dao;

import java.util.List;
import java.util.Map;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.Party;
import com.joker.dq.model.PartyGroup;
import com.joker.dq.model.PartyRole;
import com.joker.dq.webapp.action.Page;

/**
 * An interface that provides a data management interface to the PartyGroup table.
 */
public interface PartyGroupDao extends GenericDao<PartyGroup, Long> {
	public Party saveParty(Party party);
	public PartyRole savePartyRole(PartyRole partyRole);
	public List searchRelationToPartyGroup(Map condition, Page page);
	public List<PartyGroup> getGroupCustomer(String ids);
	public List searchCun(Map condition);
	public List getMPersons(Map condition);
	public List getPgByDwId(Map condition);
	public List getPartyGroupByRole(Map condition);
	/**
	 * 根据关系查找PartyGroup
	 * @param condition
	 * @return
	 */
	public List getPartyGroupOfRS(Map condition);
	public List getPartyGroup(Map condition); 
	/**
	 * 根据关系查找relationship，即party_id_from对应的partygroup
	 * @param condition
	 * @return
	 */
	public List getPartyGroupFromRS(Map condition);
	/**
	 * 根据关系查找relationship，即party_id_to对应的partygroup
	 * @param condition
	 * @return
	 */
	public List getPartyGroupToRS(Map condition);
}