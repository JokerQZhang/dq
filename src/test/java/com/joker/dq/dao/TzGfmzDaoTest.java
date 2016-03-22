package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TzGfmz;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TzGfmzDaoTest extends BaseDaoTestCase {
    @Autowired
    private TzGfmzDao tzGfmzDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTzGfmz() {
        TzGfmz tzGfmz = new TzGfmz();

        // enter all required fields

        log.debug("adding tzGfmz...");
        tzGfmz = tzGfmzDao.save(tzGfmz);

        tzGfmz = tzGfmzDao.get(tzGfmz.getGfmzId());

        assertNotNull(tzGfmz.getGfmzId());

        log.debug("removing tzGfmz...");

        tzGfmzDao.remove(tzGfmz.getGfmzId());

        // should throw DataAccessException 
        tzGfmzDao.get(tzGfmz.getGfmzId());
    }
}