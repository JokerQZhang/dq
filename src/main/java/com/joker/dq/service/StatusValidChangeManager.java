package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.webapp.action.Page;
import com.joker.dq.model.StatusValidChange;

import java.util.List;

import javax.jws.WebService;

@WebService
public interface StatusValidChangeManager extends GenericManager<StatusValidChange, Long> {
    public List searchByTypeId(String typeId, Class clazz, Page page);
}