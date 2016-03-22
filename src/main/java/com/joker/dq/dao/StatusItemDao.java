package com.joker.dq.dao;

import java.util.List;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.StatusItem;
import com.joker.dq.webapp.action.Page;

/**
 * An interface that provides a data management interface to the StatusItem table.
 */
public interface StatusItemDao extends GenericDao<StatusItem, Long> {
	List searchByTypeId(String typeId, Class clazz, Page page);
}