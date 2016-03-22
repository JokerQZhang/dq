package com.joker.dq.dao;

import java.util.List;
import java.util.Map;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.Enumeration;

/**
 * An interface that provides a data management interface to the Enumeration table.
 */
public interface EnumerationDao extends GenericDao<Enumeration, Long> {
	public List getYFTypes(Map condition);
}