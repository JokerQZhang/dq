package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TzDyzthDao;
import com.joker.dq.model.TzDyzth;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TzDyzthManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TzDyzthManagerImpl manager;

    @Mock
    private TzDyzthDao dao;

    @Test
    public void testGetTzDyzth() {
        log.debug("testing get...");
        //given
        final Long dyzthId = 7L;
        final TzDyzth tzDyzth = new TzDyzth();
        given(dao.get(dyzthId)).willReturn(tzDyzth);

        //when
        TzDyzth result = manager.get(dyzthId);

        //then
        assertSame(tzDyzth, result);
    }

    @Test
    public void testGetTzDyzths() {
        log.debug("testing getAll...");
        //given
        final List<TzDyzth> tzDyzths = new ArrayList<>();
        given(dao.getAll()).willReturn(tzDyzths);

        //when
        List result = manager.getAll();

        //then
        assertSame(tzDyzths, result);
    }

    @Test
    public void testSaveTzDyzth() {
        log.debug("testing save...");

        //given
        final TzDyzth tzDyzth = new TzDyzth();
        // enter all required fields

        given(dao.save(tzDyzth)).willReturn(tzDyzth);

        //when
        manager.save(tzDyzth);

        //then
        verify(dao).save(tzDyzth);
    }

    @Test
    public void testRemoveTzDyzth() {
        log.debug("testing remove...");

        //given
        final Long dyzthId = -11L;
        willDoNothing().given(dao).remove(dyzthId);

        //when
        manager.remove(dyzthId);

        //then
        verify(dao).remove(dyzthId);
    }
}
