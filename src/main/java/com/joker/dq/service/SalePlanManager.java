package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.SalePlan;

import java.util.List;

import javax.jws.WebService;

@WebService
public interface SalePlanManager extends GenericManager<SalePlan, Long> {
    public void saveNewDtl(SalePlan salePlan);
    public void saveNewShipMent(SalePlan salePlan);
    public List facilityInventory(String facilityId, String productId);
    public void updateShipDate(SalePlan salePlan);
    public void transactionFacility(SalePlan salePlan);
}