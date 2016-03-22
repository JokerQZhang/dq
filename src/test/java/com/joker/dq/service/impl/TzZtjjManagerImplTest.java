package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TzZtjjDao;
import com.joker.dq.model.TzZtjj;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TzZtjjManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TzZtjjManagerImpl manager;

    @Mock
    private TzZtjjDao dao;

    @Test
    public void testGetTzZtjj() {
        log.debug("testing get...");
        //given
        final Long ztjjId = 7L;
        final TzZtjj tzZtjj = new TzZtjj();
        given(dao.get(ztjjId)).willReturn(tzZtjj);

        //when
        TzZtjj result = manager.get(ztjjId);

        //then
        assertSame(tzZtjj, result);
    }

    @Test
    public void testGetTzZtjjs() {
        log.debug("testing getAll...");
        //given
        final List<TzZtjj> tzZtjjs = new ArrayList<>();
        given(dao.getAll()).willReturn(tzZtjjs);

        //when
        List result = manager.getAll();

        //then
        assertSame(tzZtjjs, result);
    }

    @Test
    public void testSaveTzZtjj() {
        log.debug("testing save...");

        //given
        final TzZtjj tzZtjj = new TzZtjj();
        // enter all required fields

        given(dao.save(tzZtjj)).willReturn(tzZtjj);

        //when
        manager.save(tzZtjj);

        //then
        verify(dao).save(tzZtjj);
    }

    @Test
    public void testRemoveTzZtjj() {
        log.debug("testing remove...");

        //given
        final Long ztjjId = -11L;
        willDoNothing().given(dao).remove(ztjjId);

        //when
        manager.remove(ztjjId);

        //then
        verify(dao).remove(ztjjId);
    }
}
