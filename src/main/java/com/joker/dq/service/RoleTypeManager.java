package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.RoleType;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface RoleTypeManager extends GenericManager<RoleType, Long> {
    
}