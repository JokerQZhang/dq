package com.joker.dq.service.impl;

import com.joker.dq.dao.ApprovalProjDao;
import com.joker.dq.model.ApprovalProj;
import com.joker.dq.service.ApprovalProjManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("approvalProjManager")
@WebService(serviceName = "ApprovalProjService", endpointInterface = "com.joker.dq.service.ApprovalProjManager")
public class ApprovalProjManagerImpl extends GenericManagerImpl<ApprovalProj, Long> implements ApprovalProjManager {
    ApprovalProjDao approvalProjDao;

    @Autowired
    public ApprovalProjManagerImpl(ApprovalProjDao approvalProjDao) {
        super(approvalProjDao);
        this.approvalProjDao = approvalProjDao;
    }
}