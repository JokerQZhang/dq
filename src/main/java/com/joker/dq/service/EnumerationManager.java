package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.Enumeration;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface EnumerationManager extends GenericManager<Enumeration, Long> {
    public List getYFTypes();
}