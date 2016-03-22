package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TzFwqzDao;
import com.joker.dq.model.TzFwqz;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TzFwqzManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TzFwqzManagerImpl manager;

    @Mock
    private TzFwqzDao dao;

    @Test
    public void testGetTzFwqz() {
        log.debug("testing get...");
        //given
        final Long fwqzId = 7L;
        final TzFwqz tzFwqz = new TzFwqz();
        given(dao.get(fwqzId)).willReturn(tzFwqz);

        //when
        TzFwqz result = manager.get(fwqzId);

        //then
        assertSame(tzFwqz, result);
    }

    @Test
    public void testGetTzFwqzs() {
        log.debug("testing getAll...");
        //given
        final List<TzFwqz> tzFwqzs = new ArrayList<>();
        given(dao.getAll()).willReturn(tzFwqzs);

        //when
        List result = manager.getAll();

        //then
        assertSame(tzFwqzs, result);
    }

    @Test
    public void testSaveTzFwqz() {
        log.debug("testing save...");

        //given
        final TzFwqz tzFwqz = new TzFwqz();
        // enter all required fields

        given(dao.save(tzFwqz)).willReturn(tzFwqz);

        //when
        manager.save(tzFwqz);

        //then
        verify(dao).save(tzFwqz);
    }

    @Test
    public void testRemoveTzFwqz() {
        log.debug("testing remove...");

        //given
        final Long fwqzId = -11L;
        willDoNothing().given(dao).remove(fwqzId);

        //when
        manager.remove(fwqzId);

        //then
        verify(dao).remove(fwqzId);
    }
}
