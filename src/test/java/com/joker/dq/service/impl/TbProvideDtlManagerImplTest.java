package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TbProvideDtlDao;
import com.joker.dq.model.TbProvideDtl;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TbProvideDtlManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TbProvideDtlManagerImpl manager;

    @Mock
    private TbProvideDtlDao dao;

    @Test
    public void testGetTbProvideDtl() {
        log.debug("testing get...");
        //given
        final Long provideDtlId = 7L;
        final TbProvideDtl tbProvideDtl = new TbProvideDtl();
        given(dao.get(provideDtlId)).willReturn(tbProvideDtl);

        //when
        TbProvideDtl result = manager.get(provideDtlId);

        //then
        assertSame(tbProvideDtl, result);
    }

    @Test
    public void testGetTbProvideDtls() {
        log.debug("testing getAll...");
        //given
        final List<TbProvideDtl> tbProvideDtls = new ArrayList<>();
        given(dao.getAll()).willReturn(tbProvideDtls);

        //when
        List result = manager.getAll();

        //then
        assertSame(tbProvideDtls, result);
    }

    @Test
    public void testSaveTbProvideDtl() {
        log.debug("testing save...");

        //given
        final TbProvideDtl tbProvideDtl = new TbProvideDtl();
        // enter all required fields

        given(dao.save(tbProvideDtl)).willReturn(tbProvideDtl);

        //when
        manager.save(tbProvideDtl);

        //then
        verify(dao).save(tbProvideDtl);
    }

    @Test
    public void testRemoveTbProvideDtl() {
        log.debug("testing remove...");

        //given
        final Long provideDtlId = -11L;
        willDoNothing().given(dao).remove(provideDtlId);

        //when
        manager.remove(provideDtlId);

        //then
        verify(dao).remove(provideDtlId);
    }
}
