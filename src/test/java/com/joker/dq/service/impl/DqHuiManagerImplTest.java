package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.DqHuiDao;
import com.joker.dq.model.DqHui;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class DqHuiManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private DqHuiManagerImpl manager;

    @Mock
    private DqHuiDao dao;

    @Test
    public void testGetDqHui() {
        log.debug("testing get...");
        //given
        final Long huiId = 7L;
        final DqHui dqHui = new DqHui();
        given(dao.get(huiId)).willReturn(dqHui);

        //when
        DqHui result = manager.get(huiId);

        //then
        assertSame(dqHui, result);
    }

    @Test
    public void testGetDqHuies() {
        log.debug("testing getAll...");
        //given
        final List<DqHui> dqHuies = new ArrayList<>();
        given(dao.getAll()).willReturn(dqHuies);

        //when
        List result = manager.getAll();

        //then
        assertSame(dqHuies, result);
    }

    @Test
    public void testSaveDqHui() {
        log.debug("testing save...");

        //given
        final DqHui dqHui = new DqHui();
        // enter all required fields

        given(dao.save(dqHui)).willReturn(dqHui);

        //when
        manager.save(dqHui);

        //then
        verify(dao).save(dqHui);
    }

    @Test
    public void testRemoveDqHui() {
        log.debug("testing remove...");

        //given
        final Long huiId = -11L;
        willDoNothing().given(dao).remove(huiId);

        //when
        manager.remove(huiId);

        //then
        verify(dao).remove(huiId);
    }
}
