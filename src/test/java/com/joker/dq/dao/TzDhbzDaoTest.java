package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TzDhbz;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TzDhbzDaoTest extends BaseDaoTestCase {
    @Autowired
    private TzDhbzDao tzDhbzDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTzDhbz() {
        TzDhbz tzDhbz = new TzDhbz();

        // enter all required fields

        log.debug("adding tzDhbz...");
        tzDhbz = tzDhbzDao.save(tzDhbz);

        tzDhbz = tzDhbzDao.get(tzDhbz.getDhbzId());

        assertNotNull(tzDhbz.getDhbzId());

        log.debug("removing tzDhbz...");

        tzDhbzDao.remove(tzDhbz.getDhbzId());

        // should throw DataAccessException 
        tzDhbzDao.get(tzDhbz.getDhbzId());
    }
}