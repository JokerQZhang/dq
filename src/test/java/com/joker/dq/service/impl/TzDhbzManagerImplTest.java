package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TzDhbzDao;
import com.joker.dq.model.TzDhbz;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TzDhbzManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TzDhbzManagerImpl manager;

    @Mock
    private TzDhbzDao dao;

    @Test
    public void testGetTzDhbz() {
        log.debug("testing get...");
        //given
        final Long dhbzId = 7L;
        final TzDhbz tzDhbz = new TzDhbz();
        given(dao.get(dhbzId)).willReturn(tzDhbz);

        //when
        TzDhbz result = manager.get(dhbzId);

        //then
        assertSame(tzDhbz, result);
    }

    @Test
    public void testGetTzDhbzs() {
        log.debug("testing getAll...");
        //given
        final List<TzDhbz> tzDhbzs = new ArrayList<>();
        given(dao.getAll()).willReturn(tzDhbzs);

        //when
        List result = manager.getAll();

        //then
        assertSame(tzDhbzs, result);
    }

    @Test
    public void testSaveTzDhbz() {
        log.debug("testing save...");

        //given
        final TzDhbz tzDhbz = new TzDhbz();
        // enter all required fields

        given(dao.save(tzDhbz)).willReturn(tzDhbz);

        //when
        manager.save(tzDhbz);

        //then
        verify(dao).save(tzDhbz);
    }

    @Test
    public void testRemoveTzDhbz() {
        log.debug("testing remove...");

        //given
        final Long dhbzId = -11L;
        willDoNothing().given(dao).remove(dhbzId);

        //when
        manager.remove(dhbzId);

        //then
        verify(dao).remove(dhbzId);
    }
}
