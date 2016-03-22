package com.joker.dq.service.impl;

import com.joker.dq.dao.RoleTypeDao;
import com.joker.dq.model.RoleType;
import com.joker.dq.service.RoleTypeManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("roleTypeManager")
@WebService(serviceName = "RoleTypeService", endpointInterface = "com.joker.dq.service.RoleTypeManager")
public class RoleTypeManagerImpl extends GenericManagerImpl<RoleType, Long> implements RoleTypeManager {
    RoleTypeDao roleTypeDao;

    @Autowired
    public RoleTypeManagerImpl(RoleTypeDao roleTypeDao) {
        super(roleTypeDao);
        this.roleTypeDao = roleTypeDao;
    }
}