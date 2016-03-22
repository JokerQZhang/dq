package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.SalePlanDtl;
import com.joker.dq.model.Shipment;

import java.util.List;

import javax.jws.WebService;

@WebService
public interface ShipmentManager extends GenericManager<Shipment, Long> {
    public Shipment getShipmentBySPD(SalePlanDtl salePlanDtl);
}