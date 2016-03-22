package com.joker.dq.dao;

import java.util.List;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.StatusValidChange;
import com.joker.dq.webapp.action.Page;

/**
 * An interface that provides a data management interface to the StatusValidChange table.
 */
public interface StatusValidChangeDao extends GenericDao<StatusValidChange, Long> {
	public List searchByTypeId(String typeId, Class clazz, Page page);
}