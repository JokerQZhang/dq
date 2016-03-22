package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TbCarePeople;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TbCarePeopleDaoTest extends BaseDaoTestCase {
    @Autowired
    private TbCarePeopleDao tbCarePeopleDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTbCarePeople() {
        TbCarePeople tbCarePeople = new TbCarePeople();

        // enter all required fields

        log.debug("adding tbCarePeople...");
        tbCarePeople = tbCarePeopleDao.save(tbCarePeople);

        tbCarePeople = tbCarePeopleDao.get(tbCarePeople.getPeopleId());

        assertNotNull(tbCarePeople.getPeopleId());

        log.debug("removing tbCarePeople...");

        tbCarePeopleDao.remove(tbCarePeople.getPeopleId());

        // should throw DataAccessException 
        tbCarePeopleDao.get(tbCarePeople.getPeopleId());
    }
}