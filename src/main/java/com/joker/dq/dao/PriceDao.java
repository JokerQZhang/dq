package com.joker.dq.dao;

import java.util.List;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.Price;

/**
 * An interface that provides a data management interface to the Price table.
 */
public interface PriceDao extends GenericDao<Price, Long> {
	public List getProductPriceList(String groupId, String lastdate, String priceType);
}