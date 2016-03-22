package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.EnumerationType;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface EnumerationTypeManager extends GenericManager<EnumerationType, Long> {
    
}