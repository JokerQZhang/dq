package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TzDyzth;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TzDyzthDaoTest extends BaseDaoTestCase {
    @Autowired
    private TzDyzthDao tzDyzthDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTzDyzth() {
        TzDyzth tzDyzth = new TzDyzth();

        // enter all required fields

        log.debug("adding tzDyzth...");
        tzDyzth = tzDyzthDao.save(tzDyzth);

        tzDyzth = tzDyzthDao.get(tzDyzth.getDyzthId());

        assertNotNull(tzDyzth.getDyzthId());

        log.debug("removing tzDyzth...");

        tzDyzthDao.remove(tzDyzth.getDyzthId());

        // should throw DataAccessException 
        tzDyzthDao.get(tzDyzth.getDyzthId());
    }
}