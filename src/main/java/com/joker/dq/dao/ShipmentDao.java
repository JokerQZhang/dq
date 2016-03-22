package com.joker.dq.dao;

import java.util.List;
import java.util.Map;

import com.joker.dq.dao.GenericDao;
import com.joker.dq.model.Shipment;

/**
 * An interface that provides a data management interface to the Shipment table.
 */
public interface ShipmentDao extends GenericDao<Shipment, Long> {
	public List getOShipmentByCondition(Map condition);
}