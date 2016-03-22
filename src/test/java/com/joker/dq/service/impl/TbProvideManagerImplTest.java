package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TbProvideDao;
import com.joker.dq.model.TbProvide;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TbProvideManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TbProvideManagerImpl manager;

    @Mock
    private TbProvideDao dao;

    @Test
    public void testGetTbProvide() {
        log.debug("testing get...");
        //given
        final Long provideId = 7L;
        final TbProvide tbProvide = new TbProvide();
        given(dao.get(provideId)).willReturn(tbProvide);

        //when
        TbProvide result = manager.get(provideId);

        //then
        assertSame(tbProvide, result);
    }

    @Test
    public void testGetTbProvides() {
        log.debug("testing getAll...");
        //given
        final List<TbProvide> tbProvides = new ArrayList<>();
        given(dao.getAll()).willReturn(tbProvides);

        //when
        List result = manager.getAll();

        //then
        assertSame(tbProvides, result);
    }

    @Test
    public void testSaveTbProvide() {
        log.debug("testing save...");

        //given
        final TbProvide tbProvide = new TbProvide();
        // enter all required fields

        given(dao.save(tbProvide)).willReturn(tbProvide);

        //when
        manager.save(tbProvide);

        //then
        verify(dao).save(tbProvide);
    }

    @Test
    public void testRemoveTbProvide() {
        log.debug("testing remove...");

        //given
        final Long provideId = -11L;
        willDoNothing().given(dao).remove(provideId);

        //when
        manager.remove(provideId);

        //then
        verify(dao).remove(provideId);
    }
}
