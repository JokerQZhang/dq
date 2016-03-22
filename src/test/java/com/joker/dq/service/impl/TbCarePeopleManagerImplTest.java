package com.joker.dq.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.joker.dq.dao.TbCarePeopleDao;
import com.joker.dq.model.TbCarePeople;
import com.joker.dq.service.impl.BaseManagerMockTestCase;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

public class TbCarePeopleManagerImplTest extends BaseManagerMockTestCase {

    @InjectMocks
    private TbCarePeopleManagerImpl manager;

    @Mock
    private TbCarePeopleDao dao;

    @Test
    public void testGetTbCarePeople() {
        log.debug("testing get...");
        //given
        final Long peopleId = 7L;
        final TbCarePeople tbCarePeople = new TbCarePeople();
        given(dao.get(peopleId)).willReturn(tbCarePeople);

        //when
        TbCarePeople result = manager.get(peopleId);

        //then
        assertSame(tbCarePeople, result);
    }

    @Test
    public void testGetTbCarePeoples() {
        log.debug("testing getAll...");
        //given
        final List<TbCarePeople> tbCarePeoples = new ArrayList<>();
        given(dao.getAll()).willReturn(tbCarePeoples);

        //when
        List result = manager.getAll();

        //then
        assertSame(tbCarePeoples, result);
    }

    @Test
    public void testSaveTbCarePeople() {
        log.debug("testing save...");

        //given
        final TbCarePeople tbCarePeople = new TbCarePeople();
        // enter all required fields

        given(dao.save(tbCarePeople)).willReturn(tbCarePeople);

        //when
        manager.save(tbCarePeople);

        //then
        verify(dao).save(tbCarePeople);
    }

    @Test
    public void testRemoveTbCarePeople() {
        log.debug("testing remove...");

        //given
        final Long peopleId = -11L;
        willDoNothing().given(dao).remove(peopleId);

        //when
        manager.remove(peopleId);

        //then
        verify(dao).remove(peopleId);
    }
}
