package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.webapp.action.Page;
import com.joker.dq.model.StatusItem;

import java.util.List;

import javax.jws.WebService;

@WebService
public interface StatusItemManager extends GenericManager<StatusItem, Long> {
    List searchByTypeId(String typeId, Class clazz, Page page);
}