package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TzGfmzDao;
import com.joker.dq.model.TzGfmz;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TzGfmzManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TzGfmzManagerImpl manager;

    @Mock
    private TzGfmzDao dao;

    @Test
    public void testGetTzGfmz() {
        log.debug("testing get...");
        //given
        final Long gfmzId = 7L;
        final TzGfmz tzGfmz = new TzGfmz();
        given(dao.get(gfmzId)).willReturn(tzGfmz);

        //when
        TzGfmz result = manager.get(gfmzId);

        //then
        assertSame(tzGfmz, result);
    }

    @Test
    public void testGetTzGfmzs() {
        log.debug("testing getAll...");
        //given
        final List<TzGfmz> tzGfmzs = new ArrayList<>();
        given(dao.getAll()).willReturn(tzGfmzs);

        //when
        List result = manager.getAll();

        //then
        assertSame(tzGfmzs, result);
    }

    @Test
    public void testSaveTzGfmz() {
        log.debug("testing save...");

        //given
        final TzGfmz tzGfmz = new TzGfmz();
        // enter all required fields

        given(dao.save(tzGfmz)).willReturn(tzGfmz);

        //when
        manager.save(tzGfmz);

        //then
        verify(dao).save(tzGfmz);
    }

    @Test
    public void testRemoveTzGfmz() {
        log.debug("testing remove...");

        //given
        final Long gfmzId = -11L;
        willDoNothing().given(dao).remove(gfmzId);

        //when
        manager.remove(gfmzId);

        //then
        verify(dao).remove(gfmzId);
    }
}
