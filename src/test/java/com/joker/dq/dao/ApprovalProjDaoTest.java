package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.ApprovalProj;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ApprovalProjDaoTest extends BaseDaoTestCase {
    @Autowired
    private ApprovalProjDao approvalProjDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveApprovalProj() {
        ApprovalProj approvalProj = new ApprovalProj();

        // enter all required fields

        log.debug("adding approvalProj...");
        approvalProj = approvalProjDao.save(approvalProj);

        approvalProj = approvalProjDao.get(approvalProj.getApprovalProjId());

        assertNotNull(approvalProj.getApprovalProjId());

        log.debug("removing approvalProj...");

        approvalProjDao.remove(approvalProj.getApprovalProjId());

        // should throw DataAccessException 
        approvalProjDao.get(approvalProj.getApprovalProjId());
    }
}