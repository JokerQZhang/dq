package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.CpChargeDao;
import com.joker.dq.model.CpCharge;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class CpChargeManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private CpChargeManagerImpl manager;

    @Mock
    private CpChargeDao dao;

    @Test
    public void testGetCpCharge() {
        log.debug("testing get...");
        //given
        final Long cpChargeId = 7L;
        final CpCharge cpCharge = new CpCharge();
        given(dao.get(cpChargeId)).willReturn(cpCharge);

        //when
        CpCharge result = manager.get(cpChargeId);

        //then
        assertSame(cpCharge, result);
    }

    @Test
    public void testGetCpCharges() {
        log.debug("testing getAll...");
        //given
        final List<CpCharge> cpCharges = new ArrayList<>();
        given(dao.getAll()).willReturn(cpCharges);

        //when
        List result = manager.getAll();

        //then
        assertSame(cpCharges, result);
    }

    @Test
    public void testSaveCpCharge() {
        log.debug("testing save...");

        //given
        final CpCharge cpCharge = new CpCharge();
        // enter all required fields

        given(dao.save(cpCharge)).willReturn(cpCharge);

        //when
        manager.save(cpCharge);

        //then
        verify(dao).save(cpCharge);
    }

    @Test
    public void testRemoveCpCharge() {
        log.debug("testing remove...");

        //given
        final Long cpChargeId = -11L;
        willDoNothing().given(dao).remove(cpChargeId);

        //when
        manager.remove(cpChargeId);

        //then
        verify(dao).remove(cpChargeId);
    }
}
