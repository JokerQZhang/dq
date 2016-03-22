package com.joker.dq.service.impl;

import com.joker.dq.dao.TbProvideDtlDao;
import com.joker.dq.model.TbProvideDtl;
import com.joker.dq.service.TbProvideDtlManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("tbProvideDtlManager")
@WebService(serviceName = "TbProvideDtlService", endpointInterface = "com.joker.dq.service.TbProvideDtlManager")
public class TbProvideDtlManagerImpl extends GenericManagerImpl<TbProvideDtl, Long> implements TbProvideDtlManager {
    TbProvideDtlDao tbProvideDtlDao;

    @Autowired
    public TbProvideDtlManagerImpl(TbProvideDtlDao tbProvideDtlDao) {
        super(tbProvideDtlDao);
        this.tbProvideDtlDao = tbProvideDtlDao;
    }
}