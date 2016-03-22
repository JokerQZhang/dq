package com.joker.dq.service.impl;

import com.joker.dq.dao.EnumerationTypeDao;
import com.joker.dq.model.EnumerationType;
import com.joker.dq.service.EnumerationTypeManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("enumerationTypeManager")
@WebService(serviceName = "EnumerationTypeService", endpointInterface = "com.joker.dq.service.EnumerationTypeManager")
public class EnumerationTypeManagerImpl extends GenericManagerImpl<EnumerationType, Long> implements EnumerationTypeManager {
    EnumerationTypeDao enumerationTypeDao;

    @Autowired
    public EnumerationTypeManagerImpl(EnumerationTypeDao enumerationTypeDao) {
        super(enumerationTypeDao);
        this.enumerationTypeDao = enumerationTypeDao;
    }
}