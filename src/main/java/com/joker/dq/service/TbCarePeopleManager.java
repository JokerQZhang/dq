package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.TbCarePeople;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface TbCarePeopleManager extends GenericManager<TbCarePeople, Long> {
    public List getYFTypeByPeopleId(String peopleId);
}