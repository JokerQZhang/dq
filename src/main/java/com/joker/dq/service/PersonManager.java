package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.webapp.action.Page;
import com.joker.dq.model.CpDtl;
import com.joker.dq.model.CpPositive;
import com.joker.dq.model.Person;

import java.util.List;

import javax.jws.WebService;

@WebService
public interface PersonManager extends GenericManager<Person, Long> {
    public List searchByGroupId(Class claaz, Page page, String belongGroupId);
    public List getDangPerson(String belongGroupId, String isNowDangwei);
    public List getPositivePerson(String belongGroupId, String isNowDangwei);
    public CpDtl getCpDtlByPartyId(Long partyId);
    public CpPositive getCpPositiveByPartyId(Long partyId);
    public boolean approvalDangPerson(String partyId, String totalNum, String approvalNum, String approvalResult, String resultStatus);
    public List getPersonRoles(Long partyId);
}