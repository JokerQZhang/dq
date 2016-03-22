package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.CpCharge;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface CpChargeManager extends GenericManager<CpCharge, Long> {
    public List getChargeSumList(Long partyId);
}