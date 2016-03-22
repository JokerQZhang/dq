package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TzFwqz;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TzFwqzDaoTest extends BaseDaoTestCase {
    @Autowired
    private TzFwqzDao tzFwqzDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTzFwqz() {
        TzFwqz tzFwqz = new TzFwqz();

        // enter all required fields

        log.debug("adding tzFwqz...");
        tzFwqz = tzFwqzDao.save(tzFwqz);

        tzFwqz = tzFwqzDao.get(tzFwqz.getFwqzId());

        assertNotNull(tzFwqz.getFwqzId());

        log.debug("removing tzFwqz...");

        tzFwqzDao.remove(tzFwqz.getFwqzId());

        // should throw DataAccessException 
        tzFwqzDao.get(tzFwqz.getFwqzId());
    }
}