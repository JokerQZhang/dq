package com.joker.dq.dao;

import java.util.List;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.TbProvide;

/**
 * An interface that provides a data management interface to the TbProvide table.
 */
public interface TbProvideDao extends GenericDao<TbProvide, Long> {
	public boolean saveProvideDtl(TbProvide tbProvide, String yfTypeId);
	public List getSumFromDtl(Long privideId);
	public boolean removeDtl(Long privideId);
	public boolean sendMoneyDtl(TbProvide tbProvide);
}