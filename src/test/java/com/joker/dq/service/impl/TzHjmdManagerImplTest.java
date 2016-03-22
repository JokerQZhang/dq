package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TzHjmdDao;
import com.joker.dq.model.TzHjmd;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TzHjmdManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TzHjmdManagerImpl manager;

    @Mock
    private TzHjmdDao dao;

    @Test
    public void testGetTzHjmd() {
        log.debug("testing get...");
        //given
        final Long hjmdId = 7L;
        final TzHjmd tzHjmd = new TzHjmd();
        given(dao.get(hjmdId)).willReturn(tzHjmd);

        //when
        TzHjmd result = manager.get(hjmdId);

        //then
        assertSame(tzHjmd, result);
    }

    @Test
    public void testGetTzHjmds() {
        log.debug("testing getAll...");
        //given
        final List<TzHjmd> tzHjmds = new ArrayList<>();
        given(dao.getAll()).willReturn(tzHjmds);

        //when
        List result = manager.getAll();

        //then
        assertSame(tzHjmds, result);
    }

    @Test
    public void testSaveTzHjmd() {
        log.debug("testing save...");

        //given
        final TzHjmd tzHjmd = new TzHjmd();
        // enter all required fields

        given(dao.save(tzHjmd)).willReturn(tzHjmd);

        //when
        manager.save(tzHjmd);

        //then
        verify(dao).save(tzHjmd);
    }

    @Test
    public void testRemoveTzHjmd() {
        log.debug("testing remove...");

        //given
        final Long hjmdId = -11L;
        willDoNothing().given(dao).remove(hjmdId);

        //when
        manager.remove(hjmdId);

        //then
        verify(dao).remove(hjmdId);
    }
}
