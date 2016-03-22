package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.ApprovalProjDao;
import com.joker.dq.model.ApprovalProj;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class ApprovalProjManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private ApprovalProjManagerImpl manager;

    @Mock
    private ApprovalProjDao dao;

    @Test
    public void testGetApprovalProj() {
        log.debug("testing get...");
        //given
        final Long approvalProjId = 7L;
        final ApprovalProj approvalProj = new ApprovalProj();
        given(dao.get(approvalProjId)).willReturn(approvalProj);

        //when
        ApprovalProj result = manager.get(approvalProjId);

        //then
        assertSame(approvalProj, result);
    }

    @Test
    public void testGetApprovalProjs() {
        log.debug("testing getAll...");
        //given
        final List<ApprovalProj> approvalProjs = new ArrayList<>();
        given(dao.getAll()).willReturn(approvalProjs);

        //when
        List result = manager.getAll();

        //then
        assertSame(approvalProjs, result);
    }

    @Test
    public void testSaveApprovalProj() {
        log.debug("testing save...");

        //given
        final ApprovalProj approvalProj = new ApprovalProj();
        // enter all required fields

        given(dao.save(approvalProj)).willReturn(approvalProj);

        //when
        manager.save(approvalProj);

        //then
        verify(dao).save(approvalProj);
    }

    @Test
    public void testRemoveApprovalProj() {
        log.debug("testing remove...");

        //given
        final Long approvalProjId = -11L;
        willDoNothing().given(dao).remove(approvalProjId);

        //when
        manager.remove(approvalProjId);

        //then
        verify(dao).remove(approvalProjId);
    }
}
